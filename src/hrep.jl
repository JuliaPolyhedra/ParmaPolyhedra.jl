struct ConstraintSystem <: Polyhedra.MixedHRep{Rational{BigInt}}
    data::PPL.ppl_Constraint_System_t
end

function Polyhedra.FullDim(cs::ConstraintSystem)::Int # ppl returns `UInt64` but Polyhedra expects `Int`
    return ppl_get(PPL.ppl_dimension_type, PPL.ppl_Constraint_System_space_dimension, cs.data)
end

Polyhedra.hvectortype(::Type{ConstraintSystem}) = Vector{Rational{BigInt}}

struct ConstraintSystemIndex{T,ElemT} <: Polyhedra.AbstractIndex{T,ElemT}
    iterator::PPL.ppl_Constraint_System_const_iterator_t
end
# FIXME add finalizer to free iterator

# Different than Polyhedra.mixednext since we do not start by skipping `it`
function _mixed_next!(cs::ConstraintSystem, idx::ConstraintSystemIndex{T,ElemT}) where {T,ElemT}
    while !Polyhedra.done(Polyhedra.Indices{T,ElemT}(cs), idx) && !isvalid(cs, idx)
        ppl(PPL.ppl_Constraint_System_const_iterator_increment, idx.iterator)
    end
    if Polyhedra.done(Polyhedra.Indices{T,ElemT}(cs), idx)
        return nothing
    else
        return idx
    end
end
function Polyhedra.startindex(indices::Polyhedra.Indices{T,ElemT,<:ConstraintSystem}) where {T,ElemT}
    it = ppl_new(PPL.ppl_Constraint_System_const_iterator_t, PPL.ppl_new_Constraint_System_const_iterator, )
    ppl(PPL.ppl_Constraint_System_begin, indices.rep.data, it)
    idx = ConstraintSystemIndex{T,ElemT}(it)
    return _mixed_next!(indices.rep, idx)
end
function Polyhedra.nextindex(cs::ConstraintSystem, idx::ConstraintSystemIndex)
    ppl(PPL.ppl_Constraint_System_const_iterator_increment, idx.iterator)
    return _mixed_next!(cs, idx)
end

function Base.isvalid(::ConstraintSystem, idx::ConstraintSystemIndex{T,ElemT}) where {T,ElemT}
    pc = ppl_get(PPL.ppl_const_Constraint_t, PPL.ppl_Constraint_System_const_iterator_dereference, idx.iterator)
    return (PPL.ppl_Constraint_type(pc) == PPL.PPL_CONSTRAINT_TYPE_EQUAL) == Polyhedra.islin(ElemT)
end
function Polyhedra.done(cs::Polyhedra.HIndices, idx::ConstraintSystemIndex)
    it_end = ppl_new(PPL.ppl_Constraint_System_const_iterator_t, PPL.ppl_new_Constraint_System_const_iterator)
    ppl(PPL.ppl_Constraint_System_end, cs.rep.data, it_end)
    return !iszero(PPL.ppl_Constraint_System_const_iterator_equal_test(idx.iterator, it_end))
end

function Base.get(::ConstraintSystem, idx::ConstraintSystemIndex{T,ElemT}) where {T,ElemT}
    return convert(
        ElemT,
        ppl_get(
            PPL.ppl_Constraint_t,
            PPL.ppl_Constraint_System_const_iterator_dereference,
            idx.iterator,
        ),
    )
end

function Base.convert(ElemT::Type{<:Polyhedra.HRepElement{T,Vector{T}}}, ct::PPL.ppl_Constraint_t) where {T}
    @assert _constraint_type(ElemT) == PPL.ppl_Constraint_type(ct)
    coef = ppl_new(PPL.ppl_Coefficient_t, PPL.ppl_new_Coefficient)
    ppl(PPL.ppl_Constraint_inhomogeneous_term, ct, coef)
    β = zero(BigInt)
    ppl(PPL.ppl_Coefficient_to_mpz_t, coef, β)
    n = ppl_get(PPL.ppl_dimension_type, PPL.ppl_Constraint_space_dimension, ct)
    # `zeros(BigInt, n)` would create `n` aliases of the same `BigInt`
    a = [zero(BigInt) for i in 1:n]
    for i in eachindex(a)
        # `i - 1` because PPL is zero-indexed
        ppl(PPL.ppl_Constraint_coefficient, ct, i - 1, coef)
        ppl(PPL.ppl_Coefficient_to_mpz_t, coef, a[i])
    end
    ppl(PPL.ppl_delete_Coefficient, coef)
    #ppl(PPL.ppl_delete_Constraint, ct) # FIXME segfaults
    return ElemT(convert(Vector{T}, a), convert(T, β))
end

function _linear_expression(a::Vector, β)
    coef = ppl_new(PPL.ppl_Coefficient_t, PPL.ppl_new_Coefficient)
    le = ppl_new(PPL.ppl_Linear_Expression_t, PPL.ppl_new_Linear_Expression)
    ppl(PPL.ppl_assign_Coefficient_from_mpz_t, coef, convert(BigInt, β))
    ppl(PPL.ppl_Linear_Expression_add_to_inhomogeneous, le, coef)
    for i in eachindex(a)
        ppl(PPL.ppl_assign_Coefficient_from_mpz_t, coef, convert(BigInt, a[i]))
        ppl(PPL.ppl_Linear_Expression_add_to_coefficient, le, i - 1, coef)
    end
    ppl(PPL.ppl_delete_Coefficient, coef)
    return le
end

_constraint_type(::Type{<:Polyhedra.HalfSpace}) = PPL.PPL_CONSTRAINT_TYPE_GREATER_OR_EQUAL
_constraint_type(::Type{<:Polyhedra.HyperPlane}) = PPL.PPL_CONSTRAINT_TYPE_EQUAL

function add_element!(cs::ConstraintSystem, h::Polyhedra.HRepElement)
    le = _linear_expression(h.a, h.β)
    ct = ppl_new(PPL.ppl_Constraint_t, PPL.ppl_new_Constraint, le, _constraint_type(typeof(h)))
    ppl(PPL.ppl_Constraint_System_insert_Constraint, cs.data, ct)
    ppl(PPL.ppl_delete_Constraint, ct)
    ppl(PPL.ppl_delete_Linear_Expression, le)
end

function add_elements!(cs::ConstraintSystem, hit::Polyhedra.HIt)
    for h in hit
        add_element!(cs, h)
    end
end

function ConstraintSystem(d::Polyhedra.FullDim, hits::Polyhedra.HIt...)
    cs = ConstraintSystem(ppl_new(PPL.ppl_Constraint_System_t, PPL.ppl_new_Constraint_System))
    add_elements!.(cs, hits)
    return cs
end
