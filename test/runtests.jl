using Test
import ParmaPolyhedra
import ParmaPolyhedra: PPL
import Polyhedra

@test PPL.ppl_version_major() isa Integer

function _get(f::Function, R, args...)
    ret = Ref{R}(0)
    err = f(args..., ret)
    @test iszero(err)
    return ret[]
end

function _get(R, f::Function, args...)
    ret = Ref{R}(0)
    err = f(ret, args...)
    @test iszero(err)
    return ret[]
end

function _call(f, args...)
    err = f(args...)
    @test iszero(err)
    return
end

coef = [
    2  3  0  0 -8
    4 -1  0  0 -4
    0 -1  0  1  0
    -1  0  1  0  0
]

function test_H_C()
    cs = _get(PPL.ppl_Constraint_System_t, PPL.ppl_new_Constraint_System)
    @test cs != C_NULL

    c = _get(PPL.ppl_Coefficient_t, PPL.ppl_new_Coefficient)
    @test c != C_NULL

    for i in axes(coef, 1)
        le = _get(PPL.ppl_Linear_Expression_t, PPL.ppl_new_Linear_Expression)
        @test le != C_NULL

        @test _get(PPL.ppl_Linear_Expression_space_dimension, PPL.ppl_dimension_type, le) == 0
        for j in axes(coef, 2)
            _call(PPL.ppl_assign_Coefficient_from_mpz_t, c, big(coef[i, j]))
            if j == last(axes(coef, 2))
                _call(PPL.ppl_Linear_Expression_add_to_inhomogeneous, le, c)
            else
                @test _get(PPL.ppl_Linear_Expression_space_dimension, PPL.ppl_dimension_type, le) == j - 1
                _call(PPL.ppl_Linear_Expression_add_to_coefficient, le, j - 1, c)
                @test _get(PPL.ppl_Linear_Expression_space_dimension, PPL.ppl_dimension_type, le) == j
            end
        end
        @test _get(PPL.ppl_Linear_Expression_space_dimension, PPL.ppl_dimension_type, le) == 4
        _call(PPL.ppl_io_print_Linear_Expression, le)
        _call(PPL.ppl_Linear_Expression_all_homogeneous_terms_are_zero, le)

        ct = _get(PPL.ppl_Constraint_t, PPL.ppl_new_Constraint, le, PPL.PPL_CONSTRAINT_TYPE_GREATER_OR_EQUAL)
        @test ct != C_NULL
        _call(PPL.ppl_io_print_Constraint, le)
        _call(PPL.ppl_Constraint_System_insert_Constraint, cs, ct)
        _call(PPL.ppl_delete_Constraint, ct)
        _call(PPL.ppl_delete_Linear_Expression, le)
    end
    _call(PPL.ppl_delete_Coefficient, c)

    _call(PPL.ppl_delete_Constraint_System, cs)

    #@test _get(PPL.ppl_Constraint_System_space_dimension, PPL.ppl_dimension_type, cs) == 4 # FIXME the first call returns garbage

    #err = PPL.ppl_io_print_Constraint_System(cs) # FIXME Segfault
    #@test iszero(err)
end

function test_H_Polyhedra()
    h = Polyhedra.MixedMatHRep(coef[:, 1:end-1], coef[:, end], BitSet())
    cs = convert(ParmaPolyhedra.ConstraintSystem, h)
    @test Polyhedra.fulldim(cs) == 4
end

@testset "H-rep" begin
    test_H_C()
    test_H_Polyhedra()
end
