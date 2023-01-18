struct ConstraintSystem <: Polyhedra.MixedHRep{Rational{BigInt}}
    data::PPL.ppl_Constraint_System_t
end

function Polyhedra.FullDim(cs::ConstraintSystem)
    return ppl_get(PPL.ppl_dimension_type, PPL.ppl_Constraint_System_space_dimension, cs.data)
end

Polyhedra.hvectortype(::Type{ConstraintSystem}) = Vector{Rational{BigInt}}

struct ConstraintSystemIndex{T,ElemT}
    iterator::PPL.ppl_Constraint_System_const_iterator_t
end
# FIXME add finalizer to free iterator

# TODO We could get rid of these ones if Polyhedra had an `AbstractIndex`
Polyhedra.undouble_it(idx) = idx[1]
Polyhedra.double_it(idx::ConstraintSystemIndex) = idx, idx
function Base.iterate(idxs::Polyhedra.Indices, idx::ConstraintSystemIndex)
    return Polyhedra.double_it(Polyhedra.nextindex(idxs.rep, idx))
end

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

function Base.isvalid(cs::ConstraintSystem, idx::ConstraintSystemIndex{T,ElemT}) where {T,ElemT}
    pc = ppl_get(PPL.ppl_const_Constraint_t, PPL.ppl_Constraint_System_const_iterator_dereference, idx.iterator)
    return (PPL.ppl_Constraint_type(pc) == PPL.PPL_CONSTRAINT_TYPE_EQUAL) == Polyhedra.islin(ElemT)
end
function Polyhedra.done(cs::Polyhedra.HIndices, idx::ConstraintSystemIndex)
    it_end = ppl_new(PPL.ppl_Constraint_System_const_iterator_t, PPL.ppl_new_Constraint_System_const_iterator)
    ppl(PPL.ppl_Constraint_System_end, cs.rep.data, it_end)
    return !iszero(PPL.ppl_Constraint_System_const_iterator_equal_test(idx.iterator, it_end))
end

function add_element!(cs::ConstraintSystem, h::Polyhedra.HalfSpace)
    c = ppl_new(PPL.ppl_Coefficient_t, PPL.ppl_new_Coefficient)
    le = ppl_new(PPL.ppl_Linear_Expression_t, PPL.ppl_new_Linear_Expression)
    for i in 1:Polyhedra.fulldim(h)
        ppl(PPL.ppl_assign_Coefficient_from_mpz_t, c, convert(BigInt, h.a[i]))
        ppl(PPL.ppl_Linear_Expression_add_to_coefficient, le, i - 1, c)
    end
    ppl(PPL.ppl_assign_Coefficient_from_mpz_t, c, convert(BigInt, h.β))
    ppl(PPL.ppl_Linear_Expression_add_to_inhomogeneous, le, c)
    ct = ppl_new(PPL.ppl_Constraint_t, PPL.ppl_new_Constraint, le, PPL.PPL_CONSTRAINT_TYPE_GREATER_OR_EQUAL)
    ppl(PPL.ppl_Constraint_System_insert_Constraint, cs.data, ct)
    ppl(PPL.ppl_delete_Constraint, ct)
    ppl(PPL.ppl_delete_Linear_Expression, le)
    ppl(PPL.ppl_delete_Coefficient, c)
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
