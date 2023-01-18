struct ConstraintSystem <: Polyhedra.HRepresentation{Rational{BigInt}}
    data::PPL.ppl_Constraint_System_t
end

function Polyhedra.FullDim(cs::ConstraintSystem)
    return ppl_get(PPL.ppl_dimension_type, PPL.ppl_Constraint_System_space_dimension, cs.data)
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
