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

function _test_H_C(coef)
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


    cit = _get(PPL.ppl_Constraint_System_const_iterator_t, PPL.ppl_new_Constraint_System_const_iterator)
    _call(PPL.ppl_Constraint_System_begin, cs, cit)
    cit_end = _get(PPL.ppl_Constraint_System_const_iterator_t, PPL.ppl_new_Constraint_System_const_iterator)
    _call(PPL.ppl_Constraint_System_end, cs, cit_end)
    i = 0
    while iszero(PPL.ppl_Constraint_System_const_iterator_equal_test(cit, cit_end))
        i += 1
        _call(PPL.ppl_Constraint_System_const_iterator_increment, cit)
    end
    @test i == 4

    _call(PPL.ppl_delete_Constraint_System, cs)

    #@test _get(PPL.ppl_Constraint_System_space_dimension, PPL.ppl_dimension_type, cs) == 4 # FIXME the first time this is called, it returns garbage

    #err = PPL.ppl_io_print_Constraint_System(cs) # FIXME Segfault
    #@test iszero(err)
end

function _test_H_Polyhedra(coef)
    # Equalities are reordered so that equalities are first
    for linset in [BitSet(), BitSet(1:1), BitSet(1:2)]
        h = Polyhedra.MixedMatHRep(coef[:, 1:end-1], coef[:, end], linset)
        cs = convert(ParmaPolyhedra.ConstraintSystem, h)
        @test cs isa ParmaPolyhedra.ConstraintSystem
        @test Polyhedra.fulldim(cs) == size(coef, 2) - 1
        @test Polyhedra.nhalfspaces(cs) == size(coef, 1) - length(linset)
        @test Polyhedra.nhyperplanes(cs) == length(linset)
        h2 = convert(typeof(h), cs)
        @test h.A == h2.A
        @test h.b == h2.b
        @test h.linset == h2.linset
    end
end

function test_H()
    coef = [
        2  3  0  0 -8
        4 -1  0  0 -4
        0 -1  0  1  0
        -1  0  1  0  0
    ]
    _test_H_C(coef)
    _test_H_Polyhedra(coef)
end

@testset "H-rep" begin
    test_H()
end
