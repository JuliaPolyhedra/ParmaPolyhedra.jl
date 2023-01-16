using Test
import ParmaPolyhedra: PPL

@test PPL.ppl_version_major() isa Integer

function segfault()
    c = Ref{PPL.ppl_Coefficient_t}(C_NULL)
    @test c[] == C_NULL
    err = PPL.ppl_new_Coefficient_from_mpz_t(c, big(0))
    @test c[] != C_NULL
    @test iszero(err)
    @show c[]

    PPL.ppl_io_print_Coefficient(c[])

    le = Ref{PPL.ppl_Linear_Expression_t}(C_NULL)
    @test le[] == C_NULL
    err = PPL.ppl_new_Linear_Expression(le);
    @test le[] != C_NULL
    @test iszero(err)

    PPL.ppl_Linear_Expression_add_to_inhomogeneous(le[], c[]) # FIXME Segfault
end

@testset "Segfault FIXME" begin
    segfault()
end

function test_H()
    coef = [
        2  3  0  0 -8
        4 -1  0  0 -4
        0 -1  0  1  0
       -1  0  1  0  0
    ]

    cs = Ref{PPL.ppl_Constraint_System_t}(C_NULL)
    ct = Ref{PPL.ppl_Constraint_t}(C_NULL)
    c = Ref{PPL.ppl_Coefficient_t}(C_NULL)
    le = Ref{PPL.ppl_Linear_Expression_t}(C_NULL)
    pip = Ref{PPL.ppl_PIP_Problem_t}(C_NULL)
    @test cs[] == C_NULL
    err = PPL.ppl_new_Constraint_System(cs)
    @test cs[] != C_NULL
    @test iszero(err)
    @test c[] == C_NULL
    err = PPL.ppl_new_Coefficient_from_mpz_t(c, 0)
    @test c[] != C_NULL
    @test iszero(err)

    #mpc = Ref{BigInt}(C_NULL)
    #ccall((:__gmpz_init, :libgmp), Cvoid, (Base.GMP.MPZ.mpz_t,), mpc)

    for i in axes(coef, 1)
        err = PPL.ppl_new_Linear_Expression(le);
        @test iszero(err)
        @test le[] != C_NULL
        for j in axes(coef, 2)
            #ccall((:__gmpz_set_si, :libgmp), Cint, (Base.GMP.MPZ.mpz_t, Int), mpc, coef[i, j])
            #mpc = convert(BigInt, coef[i, j])
            #err = PPL.ppl_assign_Coefficient_from_mpz_t(c[], mpc)
            @test c[] != C_NULL
            @test iszero(err)
            if j == last(axes(coef, 2))
                PPL.ppl_Linear_Expression_add_to_inhomogeneous(le[], c[]) # FIXME Segfault
            else
                #PPL.ppl_Linear_Expression_add_to_coefficient(le[], j, c[]) # FIXME Segfault
            end
        end
        #err = PPL.ppl_new_Constraint(ct, le[], PPL.PPL_CONSTRAINT_TYPE_GREATER_OR_EQUAL)
        #@test iszero(err)
        #err = PPL.ppl_Constraint_System_insert_Constraint(cs[], ct[])
        #@test iszero(err)
        err = PPL.ppl_delete_Constraint(ct[])
        @test iszero(err)
        err = PPL.ppl_delete_Linear_Expression(le[])
        @test iszero(err)
    end
    err = PPL.ppl_delete_Coefficient(c[])
    @test iszero(err)
end

#@testset "H-rep" begin
#    test_H()
#end
