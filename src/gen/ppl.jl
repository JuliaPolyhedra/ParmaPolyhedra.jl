module PPL

using PPL_jll
export PPL_jll

using CEnum

function ppl_initialize()
    ccall((:ppl_initialize, libppl_c), Cint, ())
end

function ppl_finalize()
    ccall((:ppl_finalize, libppl_c), Cint, ())
end

function ppl_set_rounding_for_PPL()
    ccall((:ppl_set_rounding_for_PPL, libppl_c), Cint, ())
end

function ppl_restore_pre_PPL_rounding()
    ccall((:ppl_restore_pre_PPL_rounding, libppl_c), Cint, ())
end

function ppl_irrational_precision(p)
    ccall((:ppl_irrational_precision, libppl_c), Cint, (Ptr{Cuint},), p)
end

function ppl_set_irrational_precision(p)
    ccall((:ppl_set_irrational_precision, libppl_c), Cint, (Cuint,), p)
end

function ppl_version_major()
    ccall((:ppl_version_major, libppl_c), Cint, ())
end

function ppl_version_minor()
    ccall((:ppl_version_minor, libppl_c), Cint, ())
end

function ppl_version_revision()
    ccall((:ppl_version_revision, libppl_c), Cint, ())
end

function ppl_version_beta()
    ccall((:ppl_version_beta, libppl_c), Cint, ())
end

function ppl_version(p)
    ccall((:ppl_version, libppl_c), Cint, (Ptr{Ptr{Cchar}},), p)
end

function ppl_banner(p)
    ccall((:ppl_banner, libppl_c), Cint, (Ptr{Ptr{Cchar}},), p)
end

@cenum ppl_enum_error_code::Int32 begin
    PPL_ERROR_OUT_OF_MEMORY = -2
    PPL_ERROR_INVALID_ARGUMENT = -3
    PPL_ERROR_DOMAIN_ERROR = -4
    PPL_ERROR_LENGTH_ERROR = -5
    PPL_ARITHMETIC_OVERFLOW = -6
    PPL_STDIO_ERROR = -7
    PPL_ERROR_INTERNAL_ERROR = -8
    PPL_ERROR_UNKNOWN_STANDARD_EXCEPTION = -9
    PPL_ERROR_UNEXPECTED_ERROR = -10
    PPL_TIMEOUT_EXCEPTION = -11
    PPL_ERROR_LOGIC_ERROR = -12
end

function ppl_set_error_handler(h)
    ccall((:ppl_set_error_handler, libppl_c), Cint, (Ptr{Cvoid},), h)
end

function ppl_set_timeout(csecs)
    ccall((:ppl_set_timeout, libppl_c), Cint, (Cuint,), csecs)
end

function ppl_reset_timeout()
    ccall((:ppl_reset_timeout, libppl_c), Cint, ())
end

function ppl_set_deterministic_timeout(unscaled_weight, scale)
    ccall((:ppl_set_deterministic_timeout, libppl_c), Cint, (Culong, Cuint), unscaled_weight, scale)
end

function ppl_reset_deterministic_timeout()
    ccall((:ppl_reset_deterministic_timeout, libppl_c), Cint, ())
end

const ppl_dimension_type = Csize_t

function ppl_max_space_dimension(m)
    ccall((:ppl_max_space_dimension, libppl_c), Cint, (Ptr{ppl_dimension_type},), m)
end

function ppl_not_a_dimension(m)
    ccall((:ppl_not_a_dimension, libppl_c), Cint, (Ptr{ppl_dimension_type},), m)
end

function ppl_io_print_variable(var)
    ccall((:ppl_io_print_variable, libppl_c), Cint, (ppl_dimension_type,), var)
end

function ppl_io_fprint_variable(stream, var)
    ccall((:ppl_io_fprint_variable, libppl_c), Cint, (Ptr{Libc.FILE}, ppl_dimension_type), stream, var)
end

function ppl_io_asprint_variable(strp, var)
    ccall((:ppl_io_asprint_variable, libppl_c), Cint, (Ptr{Ptr{Cchar}}, ppl_dimension_type), strp, var)
end

# typedef const char * ppl_io_variable_output_function_type ( ppl_dimension_type var )
const ppl_io_variable_output_function_type = Cvoid

function ppl_io_set_variable_output_function(p)
    ccall((:ppl_io_set_variable_output_function, libppl_c), Cint, (Ptr{ppl_io_variable_output_function_type},), p)
end

function ppl_io_get_variable_output_function(pp)
    ccall((:ppl_io_get_variable_output_function, libppl_c), Cint, (Ptr{Ptr{ppl_io_variable_output_function_type}},), pp)
end

function ppl_io_wrap_string(src, indent_depth, preferred_first_line_length, preferred_line_length)
    ccall((:ppl_io_wrap_string, libppl_c), Ptr{Cchar}, (Ptr{Cchar}, Cuint, Cuint, Cuint), src, indent_depth, preferred_first_line_length, preferred_line_length)
end

mutable struct ppl_Coefficient_tag end

const ppl_Coefficient_t = Ptr{ppl_Coefficient_tag}

const ppl_const_Coefficient_t = Ptr{ppl_Coefficient_tag}

mutable struct ppl_Linear_Expression_tag end

const ppl_Linear_Expression_t = Ptr{ppl_Linear_Expression_tag}

const ppl_const_Linear_Expression_t = Ptr{ppl_Linear_Expression_tag}

mutable struct ppl_Constraint_tag end

const ppl_Constraint_t = Ptr{ppl_Constraint_tag}

const ppl_const_Constraint_t = Ptr{ppl_Constraint_tag}

mutable struct ppl_Constraint_System_tag end

const ppl_Constraint_System_t = Ptr{ppl_Constraint_System_tag}

const ppl_const_Constraint_System_t = Ptr{ppl_Constraint_System_tag}

mutable struct ppl_Constraint_System_const_iterator_tag end

const ppl_Constraint_System_const_iterator_t = Ptr{ppl_Constraint_System_const_iterator_tag}

const ppl_const_Constraint_System_const_iterator_t = Ptr{ppl_Constraint_System_const_iterator_tag}

mutable struct ppl_Generator_tag end

const ppl_Generator_t = Ptr{ppl_Generator_tag}

const ppl_const_Generator_t = Ptr{ppl_Generator_tag}

mutable struct ppl_Generator_System_tag end

const ppl_Generator_System_t = Ptr{ppl_Generator_System_tag}

const ppl_const_Generator_System_t = Ptr{ppl_Generator_System_tag}

mutable struct ppl_Generator_System_const_iterator_tag end

const ppl_Generator_System_const_iterator_t = Ptr{ppl_Generator_System_const_iterator_tag}

const ppl_const_Generator_System_const_iterator_t = Ptr{ppl_Generator_System_const_iterator_tag}

mutable struct ppl_Congruence_tag end

const ppl_Congruence_t = Ptr{ppl_Congruence_tag}

const ppl_const_Congruence_t = Ptr{ppl_Congruence_tag}

mutable struct ppl_Congruence_System_tag end

const ppl_Congruence_System_t = Ptr{ppl_Congruence_System_tag}

const ppl_const_Congruence_System_t = Ptr{ppl_Congruence_System_tag}

mutable struct ppl_Congruence_System_const_iterator_tag end

const ppl_Congruence_System_const_iterator_t = Ptr{ppl_Congruence_System_const_iterator_tag}

const ppl_const_Congruence_System_const_iterator_t = Ptr{ppl_Congruence_System_const_iterator_tag}

mutable struct ppl_Grid_Generator_tag end

const ppl_Grid_Generator_t = Ptr{ppl_Grid_Generator_tag}

const ppl_const_Grid_Generator_t = Ptr{ppl_Grid_Generator_tag}

mutable struct ppl_Grid_Generator_System_tag end

const ppl_Grid_Generator_System_t = Ptr{ppl_Grid_Generator_System_tag}

const ppl_const_Grid_Generator_System_t = Ptr{ppl_Grid_Generator_System_tag}

mutable struct ppl_Grid_Generator_System_const_iterator_tag end

const ppl_Grid_Generator_System_const_iterator_t = Ptr{ppl_Grid_Generator_System_const_iterator_tag}

const ppl_const_Grid_Generator_System_const_iterator_t = Ptr{ppl_Grid_Generator_System_const_iterator_tag}

mutable struct ppl_MIP_Problem_tag end

const ppl_MIP_Problem_t = Ptr{ppl_MIP_Problem_tag}

const ppl_const_MIP_Problem_t = Ptr{ppl_MIP_Problem_tag}

mutable struct ppl_PIP_Problem_tag end

const ppl_PIP_Problem_t = Ptr{ppl_PIP_Problem_tag}

const ppl_const_PIP_Problem_t = Ptr{ppl_PIP_Problem_tag}

mutable struct ppl_PIP_Tree_Node_tag end

const ppl_PIP_Tree_Node_t = Ptr{ppl_PIP_Tree_Node_tag}

const ppl_const_PIP_Tree_Node_t = Ptr{ppl_PIP_Tree_Node_tag}

mutable struct ppl_PIP_Decision_Node_tag end

const ppl_PIP_Decision_Node_t = Ptr{ppl_PIP_Decision_Node_tag}

const ppl_const_PIP_Decision_Node_t = Ptr{ppl_PIP_Decision_Node_tag}

mutable struct ppl_PIP_Solution_Node_tag end

const ppl_PIP_Solution_Node_t = Ptr{ppl_PIP_Solution_Node_tag}

const ppl_const_PIP_Solution_Node_t = Ptr{ppl_PIP_Solution_Node_tag}

mutable struct ppl_Artificial_Parameter_tag end

const ppl_Artificial_Parameter_t = Ptr{ppl_Artificial_Parameter_tag}

const ppl_const_Artificial_Parameter_t = Ptr{ppl_Artificial_Parameter_tag}

mutable struct ppl_Artificial_Parameter_Sequence_tag end

const ppl_Artificial_Parameter_Sequence_t = Ptr{ppl_Artificial_Parameter_Sequence_tag}

const ppl_const_Artificial_Parameter_Sequence_t = Ptr{ppl_Artificial_Parameter_Sequence_tag}

mutable struct ppl_Artificial_Parameter_Sequence_const_iterator_tag end

const ppl_Artificial_Parameter_Sequence_const_iterator_t = Ptr{ppl_Artificial_Parameter_Sequence_const_iterator_tag}

const ppl_const_Artificial_Parameter_Sequence_const_iterator_t = Ptr{ppl_Artificial_Parameter_Sequence_const_iterator_tag}

function ppl_new_Coefficient(pc)
    ccall((:ppl_new_Coefficient, libppl_c), Cint, (Ptr{ppl_Coefficient_t},), pc)
end

function ppl_new_Coefficient_from_mpz_t(pc, z)
    ccall((:ppl_new_Coefficient_from_mpz_t, libppl_c), Cint, (Ptr{ppl_Coefficient_t}, Base.GMP.MPZ.mpz_t), pc, z)
end

function ppl_new_Coefficient_from_Coefficient(pc, c)
    ccall((:ppl_new_Coefficient_from_Coefficient, libppl_c), Cint, (Ptr{ppl_Coefficient_t}, ppl_const_Coefficient_t), pc, c)
end

function ppl_assign_Coefficient_from_mpz_t(dst, z)
    ccall((:ppl_assign_Coefficient_from_mpz_t, libppl_c), Cint, (ppl_Coefficient_t, Base.GMP.MPZ.mpz_t), dst, z)
end

function ppl_assign_Coefficient_from_Coefficient(dst, src)
    ccall((:ppl_assign_Coefficient_from_Coefficient, libppl_c), Cint, (ppl_Coefficient_t, ppl_const_Coefficient_t), dst, src)
end

function ppl_delete_Coefficient(c)
    ccall((:ppl_delete_Coefficient, libppl_c), Cint, (ppl_const_Coefficient_t,), c)
end

function ppl_Coefficient_to_mpz_t(c, z)
    ccall((:ppl_Coefficient_to_mpz_t, libppl_c), Cint, (ppl_const_Coefficient_t, Cint), c, z)
end

function ppl_Coefficient_OK(c)
    ccall((:ppl_Coefficient_OK, libppl_c), Cint, (ppl_const_Coefficient_t,), c)
end

function ppl_Coefficient_is_bounded()
    ccall((:ppl_Coefficient_is_bounded, libppl_c), Cint, ())
end

function ppl_Coefficient_min(min)
    ccall((:ppl_Coefficient_min, libppl_c), Cint, (Cint,), min)
end

function ppl_Coefficient_max(max)
    ccall((:ppl_Coefficient_max, libppl_c), Cint, (Cint,), max)
end

function ppl_io_print_Coefficient(x)
    ccall((:ppl_io_print_Coefficient, libppl_c), Cint, (ppl_const_Coefficient_t,), x)
end

function ppl_io_fprint_Coefficient(stream, x)
    ccall((:ppl_io_fprint_Coefficient, libppl_c), Cint, (Ptr{Libc.FILE}, ppl_const_Coefficient_t), stream, x)
end

function ppl_io_asprint_Coefficient(strp, x)
    ccall((:ppl_io_asprint_Coefficient, libppl_c), Cint, (Ptr{Ptr{Cchar}}, ppl_const_Coefficient_t), strp, x)
end

function ppl_new_Linear_Expression(ple)
    ccall((:ppl_new_Linear_Expression, libppl_c), Cint, (Ptr{ppl_Linear_Expression_t},), ple)
end

function ppl_new_Linear_Expression_with_dimension(ple, d)
    ccall((:ppl_new_Linear_Expression_with_dimension, libppl_c), Cint, (Ptr{ppl_Linear_Expression_t}, ppl_dimension_type), ple, d)
end

function ppl_new_Linear_Expression_from_Linear_Expression(ple, le)
    ccall((:ppl_new_Linear_Expression_from_Linear_Expression, libppl_c), Cint, (Ptr{ppl_Linear_Expression_t}, ppl_const_Linear_Expression_t), ple, le)
end

function ppl_new_Linear_Expression_from_Constraint(ple, c)
    ccall((:ppl_new_Linear_Expression_from_Constraint, libppl_c), Cint, (Ptr{ppl_Linear_Expression_t}, ppl_const_Constraint_t), ple, c)
end

function ppl_new_Linear_Expression_from_Generator(ple, g)
    ccall((:ppl_new_Linear_Expression_from_Generator, libppl_c), Cint, (Ptr{ppl_Linear_Expression_t}, ppl_const_Generator_t), ple, g)
end

function ppl_new_Linear_Expression_from_Congruence(ple, c)
    ccall((:ppl_new_Linear_Expression_from_Congruence, libppl_c), Cint, (Ptr{ppl_Linear_Expression_t}, ppl_const_Congruence_t), ple, c)
end

function ppl_new_Linear_Expression_from_Grid_Generator(ple, g)
    ccall((:ppl_new_Linear_Expression_from_Grid_Generator, libppl_c), Cint, (Ptr{ppl_Linear_Expression_t}, ppl_const_Grid_Generator_t), ple, g)
end

function ppl_assign_Linear_Expression_from_Linear_Expression(dst, src)
    ccall((:ppl_assign_Linear_Expression_from_Linear_Expression, libppl_c), Cint, (ppl_Linear_Expression_t, ppl_const_Linear_Expression_t), dst, src)
end

function ppl_delete_Linear_Expression(le)
    ccall((:ppl_delete_Linear_Expression, libppl_c), Cint, (ppl_const_Linear_Expression_t,), le)
end

function ppl_Linear_Expression_space_dimension(le, m)
    ccall((:ppl_Linear_Expression_space_dimension, libppl_c), Cint, (ppl_const_Linear_Expression_t, Ptr{ppl_dimension_type}), le, m)
end

function ppl_Linear_Expression_coefficient(le, var, n)
    ccall((:ppl_Linear_Expression_coefficient, libppl_c), Cint, (ppl_const_Linear_Expression_t, ppl_dimension_type, ppl_Coefficient_t), le, var, n)
end

function ppl_Linear_Expression_inhomogeneous_term(le, n)
    ccall((:ppl_Linear_Expression_inhomogeneous_term, libppl_c), Cint, (ppl_const_Linear_Expression_t, ppl_Coefficient_t), le, n)
end

function ppl_Linear_Expression_OK(le)
    ccall((:ppl_Linear_Expression_OK, libppl_c), Cint, (ppl_const_Linear_Expression_t,), le)
end

function ppl_Linear_Expression_is_zero(le)
    ccall((:ppl_Linear_Expression_is_zero, libppl_c), Cint, (ppl_const_Linear_Expression_t,), le)
end

function ppl_Linear_Expression_all_homogeneous_terms_are_zero(le)
    ccall((:ppl_Linear_Expression_all_homogeneous_terms_are_zero, libppl_c), Cint, (ppl_const_Linear_Expression_t,), le)
end

function ppl_Linear_Expression_add_to_coefficient(le, var, n)
    ccall((:ppl_Linear_Expression_add_to_coefficient, libppl_c), Cint, (ppl_Linear_Expression_t, ppl_dimension_type, ppl_const_Coefficient_t), le, var, n)
end

function ppl_Linear_Expression_add_to_inhomogeneous(le, n)
    ccall((:ppl_Linear_Expression_add_to_inhomogeneous, libppl_c), Cint, (ppl_Linear_Expression_t, ppl_const_Coefficient_t), le, n)
end

function ppl_add_Linear_Expression_to_Linear_Expression(dst, src)
    ccall((:ppl_add_Linear_Expression_to_Linear_Expression, libppl_c), Cint, (ppl_Linear_Expression_t, ppl_const_Linear_Expression_t), dst, src)
end

function ppl_subtract_Linear_Expression_from_Linear_Expression(dst, src)
    ccall((:ppl_subtract_Linear_Expression_from_Linear_Expression, libppl_c), Cint, (ppl_Linear_Expression_t, ppl_const_Linear_Expression_t), dst, src)
end

function ppl_multiply_Linear_Expression_by_Coefficient(le, n)
    ccall((:ppl_multiply_Linear_Expression_by_Coefficient, libppl_c), Cint, (ppl_Linear_Expression_t, ppl_const_Coefficient_t), le, n)
end

function ppl_io_print_Linear_Expression(x)
    ccall((:ppl_io_print_Linear_Expression, libppl_c), Cint, (ppl_const_Linear_Expression_t,), x)
end

function ppl_io_fprint_Linear_Expression(stream, x)
    ccall((:ppl_io_fprint_Linear_Expression, libppl_c), Cint, (Ptr{Libc.FILE}, ppl_const_Linear_Expression_t), stream, x)
end

function ppl_io_asprint_Linear_Expression(strp, x)
    ccall((:ppl_io_asprint_Linear_Expression, libppl_c), Cint, (Ptr{Ptr{Cchar}}, ppl_const_Linear_Expression_t), strp, x)
end

function ppl_Linear_Expression_ascii_dump(x, stream)
    ccall((:ppl_Linear_Expression_ascii_dump, libppl_c), Cint, (ppl_const_Linear_Expression_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_Linear_Expression_ascii_load(x, stream)
    ccall((:ppl_Linear_Expression_ascii_load, libppl_c), Cint, (ppl_Linear_Expression_t, Ptr{Libc.FILE}), x, stream)
end

@cenum ppl_enum_Constraint_Type::UInt32 begin
    PPL_CONSTRAINT_TYPE_LESS_THAN = 0
    PPL_CONSTRAINT_TYPE_LESS_OR_EQUAL = 1
    PPL_CONSTRAINT_TYPE_EQUAL = 2
    PPL_CONSTRAINT_TYPE_GREATER_OR_EQUAL = 3
    PPL_CONSTRAINT_TYPE_GREATER_THAN = 4
end

function ppl_new_Constraint(pc, le, rel)
    ccall((:ppl_new_Constraint, libppl_c), Cint, (Ptr{ppl_Constraint_t}, ppl_const_Linear_Expression_t, ppl_enum_Constraint_Type), pc, le, rel)
end

function ppl_new_Constraint_zero_dim_false(pc)
    ccall((:ppl_new_Constraint_zero_dim_false, libppl_c), Cint, (Ptr{ppl_Constraint_t},), pc)
end

function ppl_new_Constraint_zero_dim_positivity(pc)
    ccall((:ppl_new_Constraint_zero_dim_positivity, libppl_c), Cint, (Ptr{ppl_Constraint_t},), pc)
end

function ppl_new_Constraint_from_Constraint(pc, c)
    ccall((:ppl_new_Constraint_from_Constraint, libppl_c), Cint, (Ptr{ppl_Constraint_t}, ppl_const_Constraint_t), pc, c)
end

function ppl_assign_Constraint_from_Constraint(dst, src)
    ccall((:ppl_assign_Constraint_from_Constraint, libppl_c), Cint, (ppl_Constraint_t, ppl_const_Constraint_t), dst, src)
end

function ppl_delete_Constraint(c)
    ccall((:ppl_delete_Constraint, libppl_c), Cint, (ppl_const_Constraint_t,), c)
end

function ppl_Constraint_space_dimension(c, m)
    ccall((:ppl_Constraint_space_dimension, libppl_c), Cint, (ppl_const_Constraint_t, Ptr{ppl_dimension_type}), c, m)
end

function ppl_Constraint_type(c)
    ccall((:ppl_Constraint_type, libppl_c), Cint, (ppl_const_Constraint_t,), c)
end

function ppl_Constraint_coefficient(c, var, n)
    ccall((:ppl_Constraint_coefficient, libppl_c), Cint, (ppl_const_Constraint_t, ppl_dimension_type, ppl_Coefficient_t), c, var, n)
end

function ppl_Constraint_inhomogeneous_term(c, n)
    ccall((:ppl_Constraint_inhomogeneous_term, libppl_c), Cint, (ppl_const_Constraint_t, ppl_Coefficient_t), c, n)
end

function ppl_Constraint_OK(c)
    ccall((:ppl_Constraint_OK, libppl_c), Cint, (ppl_const_Constraint_t,), c)
end

function ppl_io_print_Constraint(x)
    ccall((:ppl_io_print_Constraint, libppl_c), Cint, (ppl_const_Constraint_t,), x)
end

function ppl_io_fprint_Constraint(stream, x)
    ccall((:ppl_io_fprint_Constraint, libppl_c), Cint, (Ptr{Libc.FILE}, ppl_const_Constraint_t), stream, x)
end

function ppl_io_asprint_Constraint(strp, x)
    ccall((:ppl_io_asprint_Constraint, libppl_c), Cint, (Ptr{Ptr{Cchar}}, ppl_const_Constraint_t), strp, x)
end

function ppl_Constraint_ascii_dump(x, stream)
    ccall((:ppl_Constraint_ascii_dump, libppl_c), Cint, (ppl_const_Constraint_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_Constraint_ascii_load(x, stream)
    ccall((:ppl_Constraint_ascii_load, libppl_c), Cint, (ppl_Constraint_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_new_Constraint_System(pcs)
    ccall((:ppl_new_Constraint_System, libppl_c), Cint, (Ptr{ppl_Constraint_System_t},), pcs)
end

function ppl_new_Constraint_System_zero_dim_empty(pcs)
    ccall((:ppl_new_Constraint_System_zero_dim_empty, libppl_c), Cint, (Ptr{ppl_Constraint_System_t},), pcs)
end

function ppl_new_Constraint_System_from_Constraint(pcs, c)
    ccall((:ppl_new_Constraint_System_from_Constraint, libppl_c), Cint, (Ptr{ppl_Constraint_System_t}, ppl_const_Constraint_t), pcs, c)
end

function ppl_new_Constraint_System_from_Constraint_System(pcs, cs)
    ccall((:ppl_new_Constraint_System_from_Constraint_System, libppl_c), Cint, (Ptr{ppl_Constraint_System_t}, ppl_const_Constraint_System_t), pcs, cs)
end

function ppl_assign_Constraint_System_from_Constraint_System(dst, src)
    ccall((:ppl_assign_Constraint_System_from_Constraint_System, libppl_c), Cint, (ppl_Constraint_System_t, ppl_const_Constraint_System_t), dst, src)
end

function ppl_delete_Constraint_System(cs)
    ccall((:ppl_delete_Constraint_System, libppl_c), Cint, (ppl_const_Constraint_System_t,), cs)
end

function ppl_Constraint_System_space_dimension(cs, m)
    ccall((:ppl_Constraint_System_space_dimension, libppl_c), Cint, (ppl_const_Constraint_System_t, Ptr{ppl_dimension_type}), cs, m)
end

function ppl_Constraint_System_empty(cs)
    ccall((:ppl_Constraint_System_empty, libppl_c), Cint, (ppl_const_Constraint_System_t,), cs)
end

function ppl_Constraint_System_has_strict_inequalities(cs)
    ccall((:ppl_Constraint_System_has_strict_inequalities, libppl_c), Cint, (ppl_const_Constraint_System_t,), cs)
end

function ppl_Constraint_System_begin(cs, cit)
    ccall((:ppl_Constraint_System_begin, libppl_c), Cint, (ppl_const_Constraint_System_t, ppl_Constraint_System_const_iterator_t), cs, cit)
end

function ppl_Constraint_System_end(cs, cit)
    ccall((:ppl_Constraint_System_end, libppl_c), Cint, (ppl_const_Constraint_System_t, ppl_Constraint_System_const_iterator_t), cs, cit)
end

function ppl_Constraint_System_OK(cs)
    ccall((:ppl_Constraint_System_OK, libppl_c), Cint, (ppl_const_Constraint_System_t,), cs)
end

function ppl_Constraint_System_clear(cs)
    ccall((:ppl_Constraint_System_clear, libppl_c), Cint, (ppl_Constraint_System_t,), cs)
end

function ppl_Constraint_System_insert_Constraint(cs, c)
    ccall((:ppl_Constraint_System_insert_Constraint, libppl_c), Cint, (ppl_Constraint_System_t, ppl_const_Constraint_t), cs, c)
end

function ppl_io_print_Constraint_System(x)
    ccall((:ppl_io_print_Constraint_System, libppl_c), Cint, (ppl_const_Constraint_System_t,), x)
end

function ppl_io_fprint_Constraint_System(stream, x)
    ccall((:ppl_io_fprint_Constraint_System, libppl_c), Cint, (Ptr{Libc.FILE}, ppl_const_Constraint_System_t), stream, x)
end

function ppl_io_asprint_Constraint_System(strp, x)
    ccall((:ppl_io_asprint_Constraint_System, libppl_c), Cint, (Ptr{Ptr{Cchar}}, ppl_const_Constraint_System_t), strp, x)
end

function ppl_Constraint_System_ascii_dump(x, stream)
    ccall((:ppl_Constraint_System_ascii_dump, libppl_c), Cint, (ppl_const_Constraint_System_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_Constraint_System_ascii_load(x, stream)
    ccall((:ppl_Constraint_System_ascii_load, libppl_c), Cint, (ppl_Constraint_System_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_new_Constraint_System_const_iterator(pcit)
    ccall((:ppl_new_Constraint_System_const_iterator, libppl_c), Cint, (Ptr{ppl_Constraint_System_const_iterator_t},), pcit)
end

function ppl_new_Constraint_System_const_iterator_from_Constraint_System_const_iterator(pcit, cit)
    ccall((:ppl_new_Constraint_System_const_iterator_from_Constraint_System_const_iterator, libppl_c), Cint, (Ptr{ppl_Constraint_System_const_iterator_t}, ppl_const_Constraint_System_const_iterator_t), pcit, cit)
end

function ppl_assign_Constraint_System_const_iterator_from_Constraint_System_const_iterator(dst, src)
    ccall((:ppl_assign_Constraint_System_const_iterator_from_Constraint_System_const_iterator, libppl_c), Cint, (ppl_Constraint_System_const_iterator_t, ppl_const_Constraint_System_const_iterator_t), dst, src)
end

function ppl_delete_Constraint_System_const_iterator(cit)
    ccall((:ppl_delete_Constraint_System_const_iterator, libppl_c), Cint, (ppl_const_Constraint_System_const_iterator_t,), cit)
end

function ppl_Constraint_System_const_iterator_dereference(cit, pc)
    ccall((:ppl_Constraint_System_const_iterator_dereference, libppl_c), Cint, (ppl_const_Constraint_System_const_iterator_t, Ptr{ppl_const_Constraint_t}), cit, pc)
end

function ppl_Constraint_System_const_iterator_increment(cit)
    ccall((:ppl_Constraint_System_const_iterator_increment, libppl_c), Cint, (ppl_Constraint_System_const_iterator_t,), cit)
end

function ppl_Constraint_System_const_iterator_equal_test(x, y)
    ccall((:ppl_Constraint_System_const_iterator_equal_test, libppl_c), Cint, (ppl_const_Constraint_System_const_iterator_t, ppl_const_Constraint_System_const_iterator_t), x, y)
end

@cenum ppl_enum_Generator_Type::UInt32 begin
    PPL_GENERATOR_TYPE_LINE = 0
    PPL_GENERATOR_TYPE_RAY = 1
    PPL_GENERATOR_TYPE_POINT = 2
    PPL_GENERATOR_TYPE_CLOSURE_POINT = 3
end

function ppl_new_Generator(pg, le, t, d)
    ccall((:ppl_new_Generator, libppl_c), Cint, (Ptr{ppl_Generator_t}, ppl_const_Linear_Expression_t, ppl_enum_Generator_Type, ppl_const_Coefficient_t), pg, le, t, d)
end

function ppl_new_Generator_zero_dim_point(pg)
    ccall((:ppl_new_Generator_zero_dim_point, libppl_c), Cint, (Ptr{ppl_Generator_t},), pg)
end

function ppl_new_Generator_zero_dim_closure_point(pg)
    ccall((:ppl_new_Generator_zero_dim_closure_point, libppl_c), Cint, (Ptr{ppl_Generator_t},), pg)
end

function ppl_new_Generator_from_Generator(pg, g)
    ccall((:ppl_new_Generator_from_Generator, libppl_c), Cint, (Ptr{ppl_Generator_t}, ppl_const_Generator_t), pg, g)
end

function ppl_assign_Generator_from_Generator(dst, src)
    ccall((:ppl_assign_Generator_from_Generator, libppl_c), Cint, (ppl_Generator_t, ppl_const_Generator_t), dst, src)
end

function ppl_delete_Generator(g)
    ccall((:ppl_delete_Generator, libppl_c), Cint, (ppl_const_Generator_t,), g)
end

function ppl_Generator_space_dimension(g, m)
    ccall((:ppl_Generator_space_dimension, libppl_c), Cint, (ppl_const_Generator_t, Ptr{ppl_dimension_type}), g, m)
end

function ppl_Generator_type(g)
    ccall((:ppl_Generator_type, libppl_c), Cint, (ppl_const_Generator_t,), g)
end

function ppl_Generator_coefficient(g, var, n)
    ccall((:ppl_Generator_coefficient, libppl_c), Cint, (ppl_const_Generator_t, ppl_dimension_type, ppl_Coefficient_t), g, var, n)
end

function ppl_Generator_divisor(g, n)
    ccall((:ppl_Generator_divisor, libppl_c), Cint, (ppl_const_Generator_t, ppl_Coefficient_t), g, n)
end

function ppl_Generator_OK(g)
    ccall((:ppl_Generator_OK, libppl_c), Cint, (ppl_const_Generator_t,), g)
end

function ppl_io_print_Generator(x)
    ccall((:ppl_io_print_Generator, libppl_c), Cint, (ppl_const_Generator_t,), x)
end

function ppl_io_fprint_Generator(stream, x)
    ccall((:ppl_io_fprint_Generator, libppl_c), Cint, (Ptr{Libc.FILE}, ppl_const_Generator_t), stream, x)
end

function ppl_io_asprint_Generator(strp, x)
    ccall((:ppl_io_asprint_Generator, libppl_c), Cint, (Ptr{Ptr{Cchar}}, ppl_const_Generator_t), strp, x)
end

function ppl_Generator_ascii_dump(x, stream)
    ccall((:ppl_Generator_ascii_dump, libppl_c), Cint, (ppl_const_Generator_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_Generator_ascii_load(x, stream)
    ccall((:ppl_Generator_ascii_load, libppl_c), Cint, (ppl_Generator_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_new_Generator_System(pgs)
    ccall((:ppl_new_Generator_System, libppl_c), Cint, (Ptr{ppl_Generator_System_t},), pgs)
end

function ppl_new_Generator_System_zero_dim_univ(pgs)
    ccall((:ppl_new_Generator_System_zero_dim_univ, libppl_c), Cint, (Ptr{ppl_Generator_System_t},), pgs)
end

function ppl_new_Generator_System_from_Generator(pgs, g)
    ccall((:ppl_new_Generator_System_from_Generator, libppl_c), Cint, (Ptr{ppl_Generator_System_t}, ppl_const_Generator_t), pgs, g)
end

function ppl_new_Generator_System_from_Generator_System(pgs, gs)
    ccall((:ppl_new_Generator_System_from_Generator_System, libppl_c), Cint, (Ptr{ppl_Generator_System_t}, ppl_const_Generator_System_t), pgs, gs)
end

function ppl_assign_Generator_System_from_Generator_System(dst, src)
    ccall((:ppl_assign_Generator_System_from_Generator_System, libppl_c), Cint, (ppl_Generator_System_t, ppl_const_Generator_System_t), dst, src)
end

function ppl_delete_Generator_System(gs)
    ccall((:ppl_delete_Generator_System, libppl_c), Cint, (ppl_const_Generator_System_t,), gs)
end

function ppl_Generator_System_space_dimension(gs, m)
    ccall((:ppl_Generator_System_space_dimension, libppl_c), Cint, (ppl_const_Generator_System_t, Ptr{ppl_dimension_type}), gs, m)
end

function ppl_Generator_System_empty(gs)
    ccall((:ppl_Generator_System_empty, libppl_c), Cint, (ppl_const_Generator_System_t,), gs)
end

function ppl_Generator_System_begin(gs, git)
    ccall((:ppl_Generator_System_begin, libppl_c), Cint, (ppl_const_Generator_System_t, ppl_Generator_System_const_iterator_t), gs, git)
end

function ppl_Generator_System_end(gs, git)
    ccall((:ppl_Generator_System_end, libppl_c), Cint, (ppl_const_Generator_System_t, ppl_Generator_System_const_iterator_t), gs, git)
end

function ppl_Generator_System_OK(gs)
    ccall((:ppl_Generator_System_OK, libppl_c), Cint, (ppl_const_Generator_System_t,), gs)
end

function ppl_Generator_System_clear(gs)
    ccall((:ppl_Generator_System_clear, libppl_c), Cint, (ppl_Generator_System_t,), gs)
end

function ppl_Generator_System_insert_Generator(gs, g)
    ccall((:ppl_Generator_System_insert_Generator, libppl_c), Cint, (ppl_Generator_System_t, ppl_const_Generator_t), gs, g)
end

function ppl_io_print_Generator_System(x)
    ccall((:ppl_io_print_Generator_System, libppl_c), Cint, (ppl_const_Generator_System_t,), x)
end

function ppl_io_fprint_Generator_System(stream, x)
    ccall((:ppl_io_fprint_Generator_System, libppl_c), Cint, (Ptr{Libc.FILE}, ppl_const_Generator_System_t), stream, x)
end

function ppl_io_asprint_Generator_System(strp, x)
    ccall((:ppl_io_asprint_Generator_System, libppl_c), Cint, (Ptr{Ptr{Cchar}}, ppl_const_Generator_System_t), strp, x)
end

function ppl_Generator_System_ascii_dump(x, stream)
    ccall((:ppl_Generator_System_ascii_dump, libppl_c), Cint, (ppl_const_Generator_System_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_Generator_System_ascii_load(x, stream)
    ccall((:ppl_Generator_System_ascii_load, libppl_c), Cint, (ppl_Generator_System_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_new_Generator_System_const_iterator(pgit)
    ccall((:ppl_new_Generator_System_const_iterator, libppl_c), Cint, (Ptr{ppl_Generator_System_const_iterator_t},), pgit)
end

function ppl_new_Generator_System_const_iterator_from_Generator_System_const_iterator(pgit, git)
    ccall((:ppl_new_Generator_System_const_iterator_from_Generator_System_const_iterator, libppl_c), Cint, (Ptr{ppl_Generator_System_const_iterator_t}, ppl_const_Generator_System_const_iterator_t), pgit, git)
end

function ppl_assign_Generator_System_const_iterator_from_Generator_System_const_iterator(dst, src)
    ccall((:ppl_assign_Generator_System_const_iterator_from_Generator_System_const_iterator, libppl_c), Cint, (ppl_Generator_System_const_iterator_t, ppl_const_Generator_System_const_iterator_t), dst, src)
end

function ppl_delete_Generator_System_const_iterator(git)
    ccall((:ppl_delete_Generator_System_const_iterator, libppl_c), Cint, (ppl_const_Generator_System_const_iterator_t,), git)
end

function ppl_Generator_System_const_iterator_dereference(git, pg)
    ccall((:ppl_Generator_System_const_iterator_dereference, libppl_c), Cint, (ppl_const_Generator_System_const_iterator_t, Ptr{ppl_const_Generator_t}), git, pg)
end

function ppl_Generator_System_const_iterator_increment(git)
    ccall((:ppl_Generator_System_const_iterator_increment, libppl_c), Cint, (ppl_Generator_System_const_iterator_t,), git)
end

function ppl_Generator_System_const_iterator_equal_test(x, y)
    ccall((:ppl_Generator_System_const_iterator_equal_test, libppl_c), Cint, (ppl_const_Generator_System_const_iterator_t, ppl_const_Generator_System_const_iterator_t), x, y)
end

function ppl_new_Congruence(pc, le, m)
    ccall((:ppl_new_Congruence, libppl_c), Cint, (Ptr{ppl_Congruence_t}, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), pc, le, m)
end

function ppl_new_Congruence_zero_dim_false(pc)
    ccall((:ppl_new_Congruence_zero_dim_false, libppl_c), Cint, (Ptr{ppl_Congruence_t},), pc)
end

function ppl_new_Congruence_zero_dim_integrality(pc)
    ccall((:ppl_new_Congruence_zero_dim_integrality, libppl_c), Cint, (Ptr{ppl_Congruence_t},), pc)
end

function ppl_new_Congruence_from_Congruence(pc, c)
    ccall((:ppl_new_Congruence_from_Congruence, libppl_c), Cint, (Ptr{ppl_Congruence_t}, ppl_const_Congruence_t), pc, c)
end

function ppl_assign_Congruence_from_Congruence(dst, src)
    ccall((:ppl_assign_Congruence_from_Congruence, libppl_c), Cint, (ppl_Congruence_t, ppl_const_Congruence_t), dst, src)
end

function ppl_delete_Congruence(c)
    ccall((:ppl_delete_Congruence, libppl_c), Cint, (ppl_const_Congruence_t,), c)
end

function ppl_Congruence_space_dimension(c, m)
    ccall((:ppl_Congruence_space_dimension, libppl_c), Cint, (ppl_const_Congruence_t, Ptr{ppl_dimension_type}), c, m)
end

function ppl_Congruence_coefficient(c, var, n)
    ccall((:ppl_Congruence_coefficient, libppl_c), Cint, (ppl_const_Congruence_t, ppl_dimension_type, ppl_Coefficient_t), c, var, n)
end

function ppl_Congruence_inhomogeneous_term(c, n)
    ccall((:ppl_Congruence_inhomogeneous_term, libppl_c), Cint, (ppl_const_Congruence_t, ppl_Coefficient_t), c, n)
end

function ppl_Congruence_modulus(c, m)
    ccall((:ppl_Congruence_modulus, libppl_c), Cint, (ppl_const_Congruence_t, ppl_Coefficient_t), c, m)
end

function ppl_Congruence_OK(c)
    ccall((:ppl_Congruence_OK, libppl_c), Cint, (ppl_const_Congruence_t,), c)
end

function ppl_io_print_Congruence(x)
    ccall((:ppl_io_print_Congruence, libppl_c), Cint, (ppl_const_Congruence_t,), x)
end

function ppl_io_fprint_Congruence(stream, x)
    ccall((:ppl_io_fprint_Congruence, libppl_c), Cint, (Ptr{Libc.FILE}, ppl_const_Congruence_t), stream, x)
end

function ppl_io_asprint_Congruence(strp, x)
    ccall((:ppl_io_asprint_Congruence, libppl_c), Cint, (Ptr{Ptr{Cchar}}, ppl_const_Congruence_t), strp, x)
end

function ppl_Congruence_ascii_dump(x, stream)
    ccall((:ppl_Congruence_ascii_dump, libppl_c), Cint, (ppl_const_Congruence_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_Congruence_ascii_load(x, stream)
    ccall((:ppl_Congruence_ascii_load, libppl_c), Cint, (ppl_Congruence_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_new_Congruence_System(pcs)
    ccall((:ppl_new_Congruence_System, libppl_c), Cint, (Ptr{ppl_Congruence_System_t},), pcs)
end

function ppl_new_Congruence_System_zero_dim_empty(pcs)
    ccall((:ppl_new_Congruence_System_zero_dim_empty, libppl_c), Cint, (Ptr{ppl_Congruence_System_t},), pcs)
end

function ppl_new_Congruence_System_from_Congruence(pcs, c)
    ccall((:ppl_new_Congruence_System_from_Congruence, libppl_c), Cint, (Ptr{ppl_Congruence_System_t}, ppl_const_Congruence_t), pcs, c)
end

function ppl_new_Congruence_System_from_Congruence_System(pcs, cs)
    ccall((:ppl_new_Congruence_System_from_Congruence_System, libppl_c), Cint, (Ptr{ppl_Congruence_System_t}, ppl_const_Congruence_System_t), pcs, cs)
end

function ppl_assign_Congruence_System_from_Congruence_System(dst, src)
    ccall((:ppl_assign_Congruence_System_from_Congruence_System, libppl_c), Cint, (ppl_Congruence_System_t, ppl_const_Congruence_System_t), dst, src)
end

function ppl_delete_Congruence_System(cs)
    ccall((:ppl_delete_Congruence_System, libppl_c), Cint, (ppl_const_Congruence_System_t,), cs)
end

function ppl_Congruence_System_space_dimension(cs, m)
    ccall((:ppl_Congruence_System_space_dimension, libppl_c), Cint, (ppl_const_Congruence_System_t, Ptr{ppl_dimension_type}), cs, m)
end

function ppl_Congruence_System_empty(cs)
    ccall((:ppl_Congruence_System_empty, libppl_c), Cint, (ppl_const_Congruence_System_t,), cs)
end

function ppl_Congruence_System_begin(cs, cit)
    ccall((:ppl_Congruence_System_begin, libppl_c), Cint, (ppl_const_Congruence_System_t, ppl_Congruence_System_const_iterator_t), cs, cit)
end

function ppl_Congruence_System_end(cs, cit)
    ccall((:ppl_Congruence_System_end, libppl_c), Cint, (ppl_const_Congruence_System_t, ppl_Congruence_System_const_iterator_t), cs, cit)
end

function ppl_Congruence_System_OK(cs)
    ccall((:ppl_Congruence_System_OK, libppl_c), Cint, (ppl_const_Congruence_System_t,), cs)
end

function ppl_Congruence_System_clear(cs)
    ccall((:ppl_Congruence_System_clear, libppl_c), Cint, (ppl_Congruence_System_t,), cs)
end

function ppl_Congruence_System_insert_Congruence(cs, c)
    ccall((:ppl_Congruence_System_insert_Congruence, libppl_c), Cint, (ppl_Congruence_System_t, ppl_const_Congruence_t), cs, c)
end

function ppl_io_print_Congruence_System(x)
    ccall((:ppl_io_print_Congruence_System, libppl_c), Cint, (ppl_const_Congruence_System_t,), x)
end

function ppl_io_fprint_Congruence_System(stream, x)
    ccall((:ppl_io_fprint_Congruence_System, libppl_c), Cint, (Ptr{Libc.FILE}, ppl_const_Congruence_System_t), stream, x)
end

function ppl_io_asprint_Congruence_System(strp, x)
    ccall((:ppl_io_asprint_Congruence_System, libppl_c), Cint, (Ptr{Ptr{Cchar}}, ppl_const_Congruence_System_t), strp, x)
end

function ppl_Congruence_System_ascii_dump(x, stream)
    ccall((:ppl_Congruence_System_ascii_dump, libppl_c), Cint, (ppl_const_Congruence_System_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_Congruence_System_ascii_load(x, stream)
    ccall((:ppl_Congruence_System_ascii_load, libppl_c), Cint, (ppl_Congruence_System_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_new_Congruence_System_const_iterator(pcit)
    ccall((:ppl_new_Congruence_System_const_iterator, libppl_c), Cint, (Ptr{ppl_Congruence_System_const_iterator_t},), pcit)
end

function ppl_new_Congruence_System_const_iterator_from_Congruence_System_const_iterator(pcit, cit)
    ccall((:ppl_new_Congruence_System_const_iterator_from_Congruence_System_const_iterator, libppl_c), Cint, (Ptr{ppl_Congruence_System_const_iterator_t}, ppl_const_Congruence_System_const_iterator_t), pcit, cit)
end

function ppl_assign_Congruence_System_const_iterator_from_Congruence_System_const_iterator(dst, src)
    ccall((:ppl_assign_Congruence_System_const_iterator_from_Congruence_System_const_iterator, libppl_c), Cint, (ppl_Congruence_System_const_iterator_t, ppl_const_Congruence_System_const_iterator_t), dst, src)
end

function ppl_delete_Congruence_System_const_iterator(cit)
    ccall((:ppl_delete_Congruence_System_const_iterator, libppl_c), Cint, (ppl_const_Congruence_System_const_iterator_t,), cit)
end

function ppl_Congruence_System_const_iterator_dereference(cit, pc)
    ccall((:ppl_Congruence_System_const_iterator_dereference, libppl_c), Cint, (ppl_const_Congruence_System_const_iterator_t, Ptr{ppl_const_Congruence_t}), cit, pc)
end

function ppl_Congruence_System_const_iterator_increment(cit)
    ccall((:ppl_Congruence_System_const_iterator_increment, libppl_c), Cint, (ppl_Congruence_System_const_iterator_t,), cit)
end

function ppl_Congruence_System_const_iterator_equal_test(x, y)
    ccall((:ppl_Congruence_System_const_iterator_equal_test, libppl_c), Cint, (ppl_const_Congruence_System_const_iterator_t, ppl_const_Congruence_System_const_iterator_t), x, y)
end

@cenum ppl_enum_Grid_Generator_Type::UInt32 begin
    PPL_GRID_GENERATOR_TYPE_LINE = 0
    PPL_GRID_GENERATOR_TYPE_PARAMETER = 1
    PPL_GRID_GENERATOR_TYPE_POINT = 2
end

function ppl_new_Grid_Generator(pg, le, t, d)
    ccall((:ppl_new_Grid_Generator, libppl_c), Cint, (Ptr{ppl_Grid_Generator_t}, ppl_const_Linear_Expression_t, ppl_enum_Grid_Generator_Type, ppl_const_Coefficient_t), pg, le, t, d)
end

function ppl_new_Grid_Generator_zero_dim_point(pg)
    ccall((:ppl_new_Grid_Generator_zero_dim_point, libppl_c), Cint, (Ptr{ppl_Grid_Generator_t},), pg)
end

function ppl_new_Grid_Generator_from_Grid_Generator(pg, g)
    ccall((:ppl_new_Grid_Generator_from_Grid_Generator, libppl_c), Cint, (Ptr{ppl_Grid_Generator_t}, ppl_const_Grid_Generator_t), pg, g)
end

function ppl_assign_Grid_Generator_from_Grid_Generator(dst, src)
    ccall((:ppl_assign_Grid_Generator_from_Grid_Generator, libppl_c), Cint, (ppl_Grid_Generator_t, ppl_const_Grid_Generator_t), dst, src)
end

function ppl_delete_Grid_Generator(g)
    ccall((:ppl_delete_Grid_Generator, libppl_c), Cint, (ppl_const_Grid_Generator_t,), g)
end

function ppl_Grid_Generator_space_dimension(g, m)
    ccall((:ppl_Grid_Generator_space_dimension, libppl_c), Cint, (ppl_const_Grid_Generator_t, Ptr{ppl_dimension_type}), g, m)
end

function ppl_Grid_Generator_type(g)
    ccall((:ppl_Grid_Generator_type, libppl_c), Cint, (ppl_const_Grid_Generator_t,), g)
end

function ppl_Grid_Generator_coefficient(g, var, n)
    ccall((:ppl_Grid_Generator_coefficient, libppl_c), Cint, (ppl_const_Grid_Generator_t, ppl_dimension_type, ppl_Coefficient_t), g, var, n)
end

function ppl_Grid_Generator_divisor(g, n)
    ccall((:ppl_Grid_Generator_divisor, libppl_c), Cint, (ppl_const_Grid_Generator_t, ppl_Coefficient_t), g, n)
end

function ppl_Grid_Generator_OK(g)
    ccall((:ppl_Grid_Generator_OK, libppl_c), Cint, (ppl_const_Grid_Generator_t,), g)
end

function ppl_io_print_Grid_Generator(x)
    ccall((:ppl_io_print_Grid_Generator, libppl_c), Cint, (ppl_const_Grid_Generator_t,), x)
end

function ppl_io_fprint_Grid_Generator(stream, x)
    ccall((:ppl_io_fprint_Grid_Generator, libppl_c), Cint, (Ptr{Libc.FILE}, ppl_const_Grid_Generator_t), stream, x)
end

function ppl_io_asprint_Grid_Generator(strp, x)
    ccall((:ppl_io_asprint_Grid_Generator, libppl_c), Cint, (Ptr{Ptr{Cchar}}, ppl_const_Grid_Generator_t), strp, x)
end

function ppl_Grid_Generator_ascii_dump(x, stream)
    ccall((:ppl_Grid_Generator_ascii_dump, libppl_c), Cint, (ppl_const_Grid_Generator_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_Grid_Generator_ascii_load(x, stream)
    ccall((:ppl_Grid_Generator_ascii_load, libppl_c), Cint, (ppl_Grid_Generator_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_new_Grid_Generator_System(pgs)
    ccall((:ppl_new_Grid_Generator_System, libppl_c), Cint, (Ptr{ppl_Grid_Generator_System_t},), pgs)
end

function ppl_new_Grid_Generator_System_zero_dim_univ(pgs)
    ccall((:ppl_new_Grid_Generator_System_zero_dim_univ, libppl_c), Cint, (Ptr{ppl_Grid_Generator_System_t},), pgs)
end

function ppl_new_Grid_Generator_System_from_Grid_Generator(pgs, g)
    ccall((:ppl_new_Grid_Generator_System_from_Grid_Generator, libppl_c), Cint, (Ptr{ppl_Grid_Generator_System_t}, ppl_const_Grid_Generator_t), pgs, g)
end

function ppl_new_Grid_Generator_System_from_Grid_Generator_System(pgs, gs)
    ccall((:ppl_new_Grid_Generator_System_from_Grid_Generator_System, libppl_c), Cint, (Ptr{ppl_Grid_Generator_System_t}, ppl_const_Grid_Generator_System_t), pgs, gs)
end

function ppl_assign_Grid_Generator_System_from_Grid_Generator_System(dst, src)
    ccall((:ppl_assign_Grid_Generator_System_from_Grid_Generator_System, libppl_c), Cint, (ppl_Grid_Generator_System_t, ppl_const_Grid_Generator_System_t), dst, src)
end

function ppl_delete_Grid_Generator_System(gs)
    ccall((:ppl_delete_Grid_Generator_System, libppl_c), Cint, (ppl_const_Grid_Generator_System_t,), gs)
end

function ppl_Grid_Generator_System_space_dimension(gs, m)
    ccall((:ppl_Grid_Generator_System_space_dimension, libppl_c), Cint, (ppl_const_Grid_Generator_System_t, Ptr{ppl_dimension_type}), gs, m)
end

function ppl_Grid_Generator_System_empty(gs)
    ccall((:ppl_Grid_Generator_System_empty, libppl_c), Cint, (ppl_const_Grid_Generator_System_t,), gs)
end

function ppl_Grid_Generator_System_begin(gs, git)
    ccall((:ppl_Grid_Generator_System_begin, libppl_c), Cint, (ppl_const_Grid_Generator_System_t, ppl_Grid_Generator_System_const_iterator_t), gs, git)
end

function ppl_Grid_Generator_System_end(gs, git)
    ccall((:ppl_Grid_Generator_System_end, libppl_c), Cint, (ppl_const_Grid_Generator_System_t, ppl_Grid_Generator_System_const_iterator_t), gs, git)
end

function ppl_Grid_Generator_System_OK(gs)
    ccall((:ppl_Grid_Generator_System_OK, libppl_c), Cint, (ppl_const_Grid_Generator_System_t,), gs)
end

function ppl_Grid_Generator_System_clear(gs)
    ccall((:ppl_Grid_Generator_System_clear, libppl_c), Cint, (ppl_Grid_Generator_System_t,), gs)
end

function ppl_Grid_Generator_System_insert_Grid_Generator(gs, g)
    ccall((:ppl_Grid_Generator_System_insert_Grid_Generator, libppl_c), Cint, (ppl_Grid_Generator_System_t, ppl_const_Grid_Generator_t), gs, g)
end

function ppl_io_print_Grid_Generator_System(x)
    ccall((:ppl_io_print_Grid_Generator_System, libppl_c), Cint, (ppl_const_Grid_Generator_System_t,), x)
end

function ppl_io_fprint_Grid_Generator_System(stream, x)
    ccall((:ppl_io_fprint_Grid_Generator_System, libppl_c), Cint, (Ptr{Libc.FILE}, ppl_const_Grid_Generator_System_t), stream, x)
end

function ppl_io_asprint_Grid_Generator_System(strp, x)
    ccall((:ppl_io_asprint_Grid_Generator_System, libppl_c), Cint, (Ptr{Ptr{Cchar}}, ppl_const_Grid_Generator_System_t), strp, x)
end

function ppl_Grid_Generator_System_ascii_dump(x, stream)
    ccall((:ppl_Grid_Generator_System_ascii_dump, libppl_c), Cint, (ppl_const_Grid_Generator_System_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_Grid_Generator_System_ascii_load(x, stream)
    ccall((:ppl_Grid_Generator_System_ascii_load, libppl_c), Cint, (ppl_Grid_Generator_System_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_new_Grid_Generator_System_const_iterator(pgit)
    ccall((:ppl_new_Grid_Generator_System_const_iterator, libppl_c), Cint, (Ptr{ppl_Grid_Generator_System_const_iterator_t},), pgit)
end

function ppl_new_Grid_Generator_System_const_iterator_from_Grid_Generator_System_const_iterator(pgit, git)
    ccall((:ppl_new_Grid_Generator_System_const_iterator_from_Grid_Generator_System_const_iterator, libppl_c), Cint, (Ptr{ppl_Grid_Generator_System_const_iterator_t}, ppl_const_Grid_Generator_System_const_iterator_t), pgit, git)
end

function ppl_assign_Grid_Generator_System_const_iterator_from_Grid_Generator_System_const_iterator(dst, src)
    ccall((:ppl_assign_Grid_Generator_System_const_iterator_from_Grid_Generator_System_const_iterator, libppl_c), Cint, (ppl_Grid_Generator_System_const_iterator_t, ppl_const_Grid_Generator_System_const_iterator_t), dst, src)
end

function ppl_delete_Grid_Generator_System_const_iterator(git)
    ccall((:ppl_delete_Grid_Generator_System_const_iterator, libppl_c), Cint, (ppl_const_Grid_Generator_System_const_iterator_t,), git)
end

function ppl_Grid_Generator_System_const_iterator_dereference(git, pg)
    ccall((:ppl_Grid_Generator_System_const_iterator_dereference, libppl_c), Cint, (ppl_const_Grid_Generator_System_const_iterator_t, Ptr{ppl_const_Grid_Generator_t}), git, pg)
end

function ppl_Grid_Generator_System_const_iterator_increment(git)
    ccall((:ppl_Grid_Generator_System_const_iterator_increment, libppl_c), Cint, (ppl_Grid_Generator_System_const_iterator_t,), git)
end

function ppl_Grid_Generator_System_const_iterator_equal_test(x, y)
    ccall((:ppl_Grid_Generator_System_const_iterator_equal_test, libppl_c), Cint, (ppl_const_Grid_Generator_System_const_iterator_t, ppl_const_Grid_Generator_System_const_iterator_t), x, y)
end

@cenum ppl_enum_Bounded_Integer_Type_Width::UInt32 begin
    PPL_BITS_8 = 8
    PPL_BITS_16 = 16
    PPL_BITS_32 = 32
    PPL_BITS_64 = 64
    PPL_BITS_128 = 128
end

@cenum ppl_enum_Bounded_Integer_Type_Representation::UInt32 begin
    PPL_UNSIGNED = 0
    PPL_SIGNED_2_COMPLEMENT = 1
end

@cenum ppl_enum_Bounded_Integer_Type_Overflow::UInt32 begin
    PPL_OVERFLOW_WRAPS = 0
    PPL_OVERFLOW_UNDEFINED = 1
    PPL_OVERFLOW_IMPOSSIBLE = 2
end

function ppl_new_MIP_Problem_from_space_dimension(pmip, d)
    ccall((:ppl_new_MIP_Problem_from_space_dimension, libppl_c), Cint, (Ptr{ppl_MIP_Problem_t}, ppl_dimension_type), pmip, d)
end

function ppl_new_MIP_Problem(pmip, d, cs, le, m)
    ccall((:ppl_new_MIP_Problem, libppl_c), Cint, (Ptr{ppl_MIP_Problem_t}, ppl_dimension_type, ppl_const_Constraint_System_t, ppl_const_Linear_Expression_t, Cint), pmip, d, cs, le, m)
end

function ppl_new_MIP_Problem_from_MIP_Problem(pmip, mip)
    ccall((:ppl_new_MIP_Problem_from_MIP_Problem, libppl_c), Cint, (Ptr{ppl_MIP_Problem_t}, ppl_const_MIP_Problem_t), pmip, mip)
end

function ppl_assign_MIP_Problem_from_MIP_Problem(dst, src)
    ccall((:ppl_assign_MIP_Problem_from_MIP_Problem, libppl_c), Cint, (ppl_MIP_Problem_t, ppl_const_MIP_Problem_t), dst, src)
end

function ppl_delete_MIP_Problem(mip)
    ccall((:ppl_delete_MIP_Problem, libppl_c), Cint, (ppl_const_MIP_Problem_t,), mip)
end

function ppl_MIP_Problem_space_dimension(mip, m)
    ccall((:ppl_MIP_Problem_space_dimension, libppl_c), Cint, (ppl_const_MIP_Problem_t, Ptr{ppl_dimension_type}), mip, m)
end

function ppl_MIP_Problem_number_of_integer_space_dimensions(mip, m)
    ccall((:ppl_MIP_Problem_number_of_integer_space_dimensions, libppl_c), Cint, (ppl_const_MIP_Problem_t, Ptr{ppl_dimension_type}), mip, m)
end

function ppl_MIP_Problem_integer_space_dimensions(mip, ds)
    ccall((:ppl_MIP_Problem_integer_space_dimensions, libppl_c), Cint, (ppl_const_MIP_Problem_t, Ptr{ppl_dimension_type}), mip, ds)
end

function ppl_MIP_Problem_number_of_constraints(mip, m)
    ccall((:ppl_MIP_Problem_number_of_constraints, libppl_c), Cint, (ppl_const_MIP_Problem_t, Ptr{ppl_dimension_type}), mip, m)
end

function ppl_MIP_Problem_constraint_at_index(mip, i, pc)
    ccall((:ppl_MIP_Problem_constraint_at_index, libppl_c), Cint, (ppl_const_MIP_Problem_t, ppl_dimension_type, Ptr{ppl_const_Constraint_t}), mip, i, pc)
end

function ppl_MIP_Problem_objective_function(mip, ple)
    ccall((:ppl_MIP_Problem_objective_function, libppl_c), Cint, (ppl_const_MIP_Problem_t, Ptr{ppl_const_Linear_Expression_t}), mip, ple)
end

function ppl_MIP_Problem_optimization_mode(mip)
    ccall((:ppl_MIP_Problem_optimization_mode, libppl_c), Cint, (ppl_const_MIP_Problem_t,), mip)
end

function ppl_MIP_Problem_OK(mip)
    ccall((:ppl_MIP_Problem_OK, libppl_c), Cint, (ppl_const_MIP_Problem_t,), mip)
end

function ppl_MIP_Problem_clear(mip)
    ccall((:ppl_MIP_Problem_clear, libppl_c), Cint, (ppl_MIP_Problem_t,), mip)
end

function ppl_MIP_Problem_add_space_dimensions_and_embed(mip, d)
    ccall((:ppl_MIP_Problem_add_space_dimensions_and_embed, libppl_c), Cint, (ppl_MIP_Problem_t, ppl_dimension_type), mip, d)
end

function ppl_MIP_Problem_add_to_integer_space_dimensions(mip, ds, n)
    ccall((:ppl_MIP_Problem_add_to_integer_space_dimensions, libppl_c), Cint, (ppl_MIP_Problem_t, Ptr{ppl_dimension_type}, Csize_t), mip, ds, n)
end

function ppl_MIP_Problem_add_constraint(mip, c)
    ccall((:ppl_MIP_Problem_add_constraint, libppl_c), Cint, (ppl_MIP_Problem_t, ppl_const_Constraint_t), mip, c)
end

function ppl_MIP_Problem_add_constraints(mip, cs)
    ccall((:ppl_MIP_Problem_add_constraints, libppl_c), Cint, (ppl_MIP_Problem_t, ppl_const_Constraint_System_t), mip, cs)
end

function ppl_MIP_Problem_set_objective_function(mip, le)
    ccall((:ppl_MIP_Problem_set_objective_function, libppl_c), Cint, (ppl_MIP_Problem_t, ppl_const_Linear_Expression_t), mip, le)
end

function ppl_MIP_Problem_set_optimization_mode(mip, mode)
    ccall((:ppl_MIP_Problem_set_optimization_mode, libppl_c), Cint, (ppl_MIP_Problem_t, Cint), mip, mode)
end

function ppl_MIP_Problem_is_satisfiable(mip)
    ccall((:ppl_MIP_Problem_is_satisfiable, libppl_c), Cint, (ppl_const_MIP_Problem_t,), mip)
end

function ppl_MIP_Problem_solve(mip)
    ccall((:ppl_MIP_Problem_solve, libppl_c), Cint, (ppl_const_MIP_Problem_t,), mip)
end

function ppl_MIP_Problem_evaluate_objective_function(mip, g, num, den)
    ccall((:ppl_MIP_Problem_evaluate_objective_function, libppl_c), Cint, (ppl_const_MIP_Problem_t, ppl_const_Generator_t, ppl_Coefficient_t, ppl_Coefficient_t), mip, g, num, den)
end

function ppl_MIP_Problem_feasible_point(mip, pg)
    ccall((:ppl_MIP_Problem_feasible_point, libppl_c), Cint, (ppl_const_MIP_Problem_t, Ptr{ppl_const_Generator_t}), mip, pg)
end

function ppl_MIP_Problem_optimizing_point(mip, pg)
    ccall((:ppl_MIP_Problem_optimizing_point, libppl_c), Cint, (ppl_const_MIP_Problem_t, Ptr{ppl_const_Generator_t}), mip, pg)
end

function ppl_MIP_Problem_optimal_value(mip, num, den)
    ccall((:ppl_MIP_Problem_optimal_value, libppl_c), Cint, (ppl_const_MIP_Problem_t, ppl_Coefficient_t, ppl_Coefficient_t), mip, num, den)
end

function ppl_MIP_Problem_get_control_parameter(mip, name)
    ccall((:ppl_MIP_Problem_get_control_parameter, libppl_c), Cint, (ppl_const_MIP_Problem_t, Cint), mip, name)
end

function ppl_MIP_Problem_set_control_parameter(mip, value)
    ccall((:ppl_MIP_Problem_set_control_parameter, libppl_c), Cint, (ppl_MIP_Problem_t, Cint), mip, value)
end

function ppl_MIP_Problem_total_memory_in_bytes(mip, sz)
    ccall((:ppl_MIP_Problem_total_memory_in_bytes, libppl_c), Cint, (ppl_const_MIP_Problem_t, Ptr{Csize_t}), mip, sz)
end

function ppl_MIP_Problem_external_memory_in_bytes(mip, sz)
    ccall((:ppl_MIP_Problem_external_memory_in_bytes, libppl_c), Cint, (ppl_const_MIP_Problem_t, Ptr{Csize_t}), mip, sz)
end

function ppl_new_PIP_Problem_from_space_dimension(ppip, d)
    ccall((:ppl_new_PIP_Problem_from_space_dimension, libppl_c), Cint, (Ptr{ppl_PIP_Problem_t}, ppl_dimension_type), ppip, d)
end

function ppl_new_PIP_Problem_from_PIP_Problem(ppip, pip)
    ccall((:ppl_new_PIP_Problem_from_PIP_Problem, libppl_c), Cint, (Ptr{ppl_PIP_Problem_t}, ppl_const_PIP_Problem_t), ppip, pip)
end

function ppl_assign_PIP_Problem_from_PIP_Problem(dst, src)
    ccall((:ppl_assign_PIP_Problem_from_PIP_Problem, libppl_c), Cint, (ppl_PIP_Problem_t, ppl_const_PIP_Problem_t), dst, src)
end

function ppl_new_PIP_Problem_from_constraints(ppip, d, first, last, n, ds)
    ccall((:ppl_new_PIP_Problem_from_constraints, libppl_c), Cint, (Ptr{ppl_PIP_Problem_t}, ppl_dimension_type, ppl_Constraint_System_const_iterator_t, ppl_Constraint_System_const_iterator_t, Csize_t, Ptr{ppl_dimension_type}), ppip, d, first, last, n, ds)
end

function ppl_delete_PIP_Problem(pip)
    ccall((:ppl_delete_PIP_Problem, libppl_c), Cint, (ppl_const_PIP_Problem_t,), pip)
end

function ppl_PIP_Problem_space_dimension(pip, m)
    ccall((:ppl_PIP_Problem_space_dimension, libppl_c), Cint, (ppl_const_PIP_Problem_t, Ptr{ppl_dimension_type}), pip, m)
end

function ppl_PIP_Problem_number_of_parameter_space_dimensions(pip, m)
    ccall((:ppl_PIP_Problem_number_of_parameter_space_dimensions, libppl_c), Cint, (ppl_const_PIP_Problem_t, Ptr{ppl_dimension_type}), pip, m)
end

function ppl_PIP_Problem_parameter_space_dimensions(pip, ds)
    ccall((:ppl_PIP_Problem_parameter_space_dimensions, libppl_c), Cint, (ppl_const_PIP_Problem_t, Ptr{ppl_dimension_type}), pip, ds)
end

function ppl_PIP_Problem_get_big_parameter_dimension(pip, pd)
    ccall((:ppl_PIP_Problem_get_big_parameter_dimension, libppl_c), Cint, (ppl_const_PIP_Problem_t, Ptr{ppl_dimension_type}), pip, pd)
end

function ppl_PIP_Problem_number_of_constraints(pip, m)
    ccall((:ppl_PIP_Problem_number_of_constraints, libppl_c), Cint, (ppl_const_PIP_Problem_t, Ptr{ppl_dimension_type}), pip, m)
end

function ppl_PIP_Problem_constraint_at_index(pip, i, pc)
    ccall((:ppl_PIP_Problem_constraint_at_index, libppl_c), Cint, (ppl_const_PIP_Problem_t, ppl_dimension_type, Ptr{ppl_const_Constraint_t}), pip, i, pc)
end

function ppl_PIP_Problem_total_memory_in_bytes(pip, sz)
    ccall((:ppl_PIP_Problem_total_memory_in_bytes, libppl_c), Cint, (ppl_const_PIP_Problem_t, Ptr{Csize_t}), pip, sz)
end

function ppl_PIP_Problem_external_memory_in_bytes(pip, sz)
    ccall((:ppl_PIP_Problem_external_memory_in_bytes, libppl_c), Cint, (ppl_const_PIP_Problem_t, Ptr{Csize_t}), pip, sz)
end

function ppl_PIP_Problem_OK(pip)
    ccall((:ppl_PIP_Problem_OK, libppl_c), Cint, (ppl_const_PIP_Problem_t,), pip)
end

function ppl_PIP_Problem_clear(pip)
    ccall((:ppl_PIP_Problem_clear, libppl_c), Cint, (ppl_PIP_Problem_t,), pip)
end

function ppl_PIP_Problem_add_space_dimensions_and_embed(pip, pip_vars, pip_params)
    ccall((:ppl_PIP_Problem_add_space_dimensions_and_embed, libppl_c), Cint, (ppl_PIP_Problem_t, ppl_dimension_type, ppl_dimension_type), pip, pip_vars, pip_params)
end

function ppl_PIP_Problem_add_to_parameter_space_dimensions(pip, ds, n)
    ccall((:ppl_PIP_Problem_add_to_parameter_space_dimensions, libppl_c), Cint, (ppl_PIP_Problem_t, Ptr{ppl_dimension_type}, Csize_t), pip, ds, n)
end

function ppl_PIP_Problem_set_big_parameter_dimension(pip, d)
    ccall((:ppl_PIP_Problem_set_big_parameter_dimension, libppl_c), Cint, (ppl_PIP_Problem_t, ppl_dimension_type), pip, d)
end

function ppl_PIP_Problem_add_constraint(pip, c)
    ccall((:ppl_PIP_Problem_add_constraint, libppl_c), Cint, (ppl_PIP_Problem_t, ppl_const_Constraint_t), pip, c)
end

function ppl_PIP_Problem_add_constraints(pip, cs)
    ccall((:ppl_PIP_Problem_add_constraints, libppl_c), Cint, (ppl_PIP_Problem_t, ppl_const_Constraint_System_t), pip, cs)
end

function ppl_PIP_Problem_is_satisfiable(pip)
    ccall((:ppl_PIP_Problem_is_satisfiable, libppl_c), Cint, (ppl_const_PIP_Problem_t,), pip)
end

function ppl_PIP_Problem_solve(pip)
    ccall((:ppl_PIP_Problem_solve, libppl_c), Cint, (ppl_const_PIP_Problem_t,), pip)
end

function ppl_PIP_Problem_solution(pip, pip_tree)
    ccall((:ppl_PIP_Problem_solution, libppl_c), Cint, (ppl_const_PIP_Problem_t, Ptr{ppl_const_PIP_Tree_Node_t}), pip, pip_tree)
end

function ppl_PIP_Problem_optimizing_solution(pip, pip_tree)
    ccall((:ppl_PIP_Problem_optimizing_solution, libppl_c), Cint, (ppl_const_PIP_Problem_t, Ptr{ppl_const_PIP_Tree_Node_t}), pip, pip_tree)
end

function ppl_PIP_Problem_get_control_parameter(pip, name)
    ccall((:ppl_PIP_Problem_get_control_parameter, libppl_c), Cint, (ppl_const_PIP_Problem_t, Cint), pip, name)
end

function ppl_PIP_Problem_set_control_parameter(pip, value)
    ccall((:ppl_PIP_Problem_set_control_parameter, libppl_c), Cint, (ppl_PIP_Problem_t, Cint), pip, value)
end

function ppl_PIP_Tree_Node_as_solution(spip_tree, dpip_tree)
    ccall((:ppl_PIP_Tree_Node_as_solution, libppl_c), Cint, (ppl_const_PIP_Tree_Node_t, Ptr{ppl_const_PIP_Solution_Node_t}), spip_tree, dpip_tree)
end

function ppl_PIP_Tree_Node_as_decision(spip_tree, dpip_tree)
    ccall((:ppl_PIP_Tree_Node_as_decision, libppl_c), Cint, (ppl_const_PIP_Tree_Node_t, Ptr{ppl_const_PIP_Decision_Node_t}), spip_tree, dpip_tree)
end

function ppl_PIP_Tree_Node_get_constraints(pip_tree, pcs)
    ccall((:ppl_PIP_Tree_Node_get_constraints, libppl_c), Cint, (ppl_const_PIP_Tree_Node_t, Ptr{ppl_const_Constraint_System_t}), pip_tree, pcs)
end

function ppl_PIP_Tree_Node_OK(pip)
    ccall((:ppl_PIP_Tree_Node_OK, libppl_c), Cint, (ppl_const_PIP_Tree_Node_t,), pip)
end

function ppl_PIP_Tree_Node_number_of_artificials(pip_tree, m)
    ccall((:ppl_PIP_Tree_Node_number_of_artificials, libppl_c), Cint, (ppl_const_PIP_Tree_Node_t, Ptr{ppl_dimension_type}), pip_tree, m)
end

function ppl_PIP_Tree_Node_begin(pip_tree, pit)
    ccall((:ppl_PIP_Tree_Node_begin, libppl_c), Cint, (ppl_const_PIP_Tree_Node_t, ppl_Artificial_Parameter_Sequence_const_iterator_t), pip_tree, pit)
end

function ppl_PIP_Tree_Node_end(pip_tree, pit)
    ccall((:ppl_PIP_Tree_Node_end, libppl_c), Cint, (ppl_const_PIP_Tree_Node_t, ppl_Artificial_Parameter_Sequence_const_iterator_t), pip_tree, pit)
end

function ppl_PIP_Solution_Node_get_parametric_values(pip_sol, var, le)
    ccall((:ppl_PIP_Solution_Node_get_parametric_values, libppl_c), Cint, (ppl_const_PIP_Solution_Node_t, ppl_dimension_type, Ptr{ppl_const_Linear_Expression_t}), pip_sol, var, le)
end

function ppl_PIP_Decision_Node_get_child_node(pip_dec, b, pip_tree)
    ccall((:ppl_PIP_Decision_Node_get_child_node, libppl_c), Cint, (ppl_const_PIP_Decision_Node_t, Cint, Ptr{ppl_const_PIP_Tree_Node_t}), pip_dec, b, pip_tree)
end

function ppl_Artificial_Parameter_get_Linear_Expression(ap, le)
    ccall((:ppl_Artificial_Parameter_get_Linear_Expression, libppl_c), Cint, (ppl_const_Artificial_Parameter_t, ppl_Linear_Expression_t), ap, le)
end

function ppl_Artificial_Parameter_coefficient(ap, var, n)
    ccall((:ppl_Artificial_Parameter_coefficient, libppl_c), Cint, (ppl_const_Artificial_Parameter_t, ppl_dimension_type, ppl_Coefficient_t), ap, var, n)
end

function ppl_Artificial_Parameter_get_inhomogeneous_term(ap, n)
    ccall((:ppl_Artificial_Parameter_get_inhomogeneous_term, libppl_c), Cint, (ppl_const_Artificial_Parameter_t, ppl_Coefficient_t), ap, n)
end

function ppl_Artificial_Parameter_denominator(ap, n)
    ccall((:ppl_Artificial_Parameter_denominator, libppl_c), Cint, (ppl_const_Artificial_Parameter_t, ppl_Coefficient_t), ap, n)
end

function ppl_new_Artificial_Parameter_Sequence_const_iterator(papit)
    ccall((:ppl_new_Artificial_Parameter_Sequence_const_iterator, libppl_c), Cint, (Ptr{ppl_Artificial_Parameter_Sequence_const_iterator_t},), papit)
end

function ppl_new_Artificial_Parameter_Sequence_const_iterator_from_Artificial_Parameter_Sequence_const_iterator(papit, apit)
    ccall((:ppl_new_Artificial_Parameter_Sequence_const_iterator_from_Artificial_Parameter_Sequence_const_iterator, libppl_c), Cint, (Ptr{ppl_Artificial_Parameter_Sequence_const_iterator_t}, ppl_const_Artificial_Parameter_Sequence_const_iterator_t), papit, apit)
end

function ppl_assign_Artificial_Parameter_Sequence_const_iterator_from_Artificial_Parameter_Sequence_const_iterator(dst, src)
    ccall((:ppl_assign_Artificial_Parameter_Sequence_const_iterator_from_Artificial_Parameter_Sequence_const_iterator, libppl_c), Cint, (ppl_Artificial_Parameter_Sequence_const_iterator_t, ppl_const_Artificial_Parameter_Sequence_const_iterator_t), dst, src)
end

function ppl_delete_Artificial_Parameter_Sequence_const_iterator(apit)
    ccall((:ppl_delete_Artificial_Parameter_Sequence_const_iterator, libppl_c), Cint, (ppl_const_Artificial_Parameter_Sequence_const_iterator_t,), apit)
end

function ppl_Artificial_Parameter_Sequence_const_iterator_dereference(apit, pap)
    ccall((:ppl_Artificial_Parameter_Sequence_const_iterator_dereference, libppl_c), Cint, (ppl_const_Artificial_Parameter_Sequence_const_iterator_t, Ptr{ppl_const_Artificial_Parameter_t}), apit, pap)
end

function ppl_Artificial_Parameter_Sequence_const_iterator_increment(apit)
    ccall((:ppl_Artificial_Parameter_Sequence_const_iterator_increment, libppl_c), Cint, (ppl_Artificial_Parameter_Sequence_const_iterator_t,), apit)
end

function ppl_Artificial_Parameter_Sequence_const_iterator_equal_test(x, y)
    ccall((:ppl_Artificial_Parameter_Sequence_const_iterator_equal_test, libppl_c), Cint, (ppl_const_Artificial_Parameter_Sequence_const_iterator_t, ppl_const_Artificial_Parameter_Sequence_const_iterator_t), x, y)
end

function ppl_io_print_MIP_Problem(x)
    ccall((:ppl_io_print_MIP_Problem, libppl_c), Cint, (ppl_const_MIP_Problem_t,), x)
end

function ppl_io_fprint_MIP_Problem(stream, x)
    ccall((:ppl_io_fprint_MIP_Problem, libppl_c), Cint, (Ptr{Libc.FILE}, ppl_const_MIP_Problem_t), stream, x)
end

function ppl_io_asprint_MIP_Problem(strp, x)
    ccall((:ppl_io_asprint_MIP_Problem, libppl_c), Cint, (Ptr{Ptr{Cchar}}, ppl_const_MIP_Problem_t), strp, x)
end

function ppl_MIP_Problem_ascii_dump(x, stream)
    ccall((:ppl_MIP_Problem_ascii_dump, libppl_c), Cint, (ppl_const_MIP_Problem_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_MIP_Problem_ascii_load(x, stream)
    ccall((:ppl_MIP_Problem_ascii_load, libppl_c), Cint, (ppl_MIP_Problem_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_io_print_PIP_Problem(x)
    ccall((:ppl_io_print_PIP_Problem, libppl_c), Cint, (ppl_const_PIP_Problem_t,), x)
end

function ppl_io_fprint_PIP_Problem(stream, x)
    ccall((:ppl_io_fprint_PIP_Problem, libppl_c), Cint, (Ptr{Libc.FILE}, ppl_const_PIP_Problem_t), stream, x)
end

function ppl_io_asprint_PIP_Problem(strp, x)
    ccall((:ppl_io_asprint_PIP_Problem, libppl_c), Cint, (Ptr{Ptr{Cchar}}, ppl_const_PIP_Problem_t), strp, x)
end

function ppl_PIP_Problem_ascii_dump(x, stream)
    ccall((:ppl_PIP_Problem_ascii_dump, libppl_c), Cint, (ppl_const_PIP_Problem_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_PIP_Problem_ascii_load(x, stream)
    ccall((:ppl_PIP_Problem_ascii_load, libppl_c), Cint, (ppl_PIP_Problem_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_io_print_PIP_Tree_Node(x)
    ccall((:ppl_io_print_PIP_Tree_Node, libppl_c), Cint, (ppl_const_PIP_Tree_Node_t,), x)
end

function ppl_io_fprint_PIP_Tree_Node(stream, x)
    ccall((:ppl_io_fprint_PIP_Tree_Node, libppl_c), Cint, (Ptr{Libc.FILE}, ppl_const_PIP_Tree_Node_t), stream, x)
end

function ppl_io_asprint_PIP_Tree_Node(strp, x)
    ccall((:ppl_io_asprint_PIP_Tree_Node, libppl_c), Cint, (Ptr{Ptr{Cchar}}, ppl_const_PIP_Tree_Node_t), strp, x)
end

function ppl_PIP_Tree_Node_ascii_dump(x, stream)
    ccall((:ppl_PIP_Tree_Node_ascii_dump, libppl_c), Cint, (ppl_const_PIP_Tree_Node_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_PIP_Tree_Node_ascii_load(x, stream)
    ccall((:ppl_PIP_Tree_Node_ascii_load, libppl_c), Cint, (ppl_PIP_Tree_Node_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_io_print_PIP_Solution_Node(x)
    ccall((:ppl_io_print_PIP_Solution_Node, libppl_c), Cint, (ppl_const_PIP_Solution_Node_t,), x)
end

function ppl_io_fprint_PIP_Solution_Node(stream, x)
    ccall((:ppl_io_fprint_PIP_Solution_Node, libppl_c), Cint, (Ptr{Libc.FILE}, ppl_const_PIP_Solution_Node_t), stream, x)
end

function ppl_io_asprint_PIP_Solution_Node(strp, x)
    ccall((:ppl_io_asprint_PIP_Solution_Node, libppl_c), Cint, (Ptr{Ptr{Cchar}}, ppl_const_PIP_Solution_Node_t), strp, x)
end

function ppl_PIP_Solution_Node_ascii_dump(x, stream)
    ccall((:ppl_PIP_Solution_Node_ascii_dump, libppl_c), Cint, (ppl_const_PIP_Solution_Node_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_PIP_Solution_Node_ascii_load(x, stream)
    ccall((:ppl_PIP_Solution_Node_ascii_load, libppl_c), Cint, (ppl_PIP_Solution_Node_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_io_print_PIP_Decision_Node(x)
    ccall((:ppl_io_print_PIP_Decision_Node, libppl_c), Cint, (ppl_const_PIP_Decision_Node_t,), x)
end

function ppl_io_fprint_PIP_Decision_Node(stream, x)
    ccall((:ppl_io_fprint_PIP_Decision_Node, libppl_c), Cint, (Ptr{Libc.FILE}, ppl_const_PIP_Decision_Node_t), stream, x)
end

function ppl_io_asprint_PIP_Decision_Node(strp, x)
    ccall((:ppl_io_asprint_PIP_Decision_Node, libppl_c), Cint, (Ptr{Ptr{Cchar}}, ppl_const_PIP_Decision_Node_t), strp, x)
end

function ppl_PIP_Decision_Node_ascii_dump(x, stream)
    ccall((:ppl_PIP_Decision_Node_ascii_dump, libppl_c), Cint, (ppl_const_PIP_Decision_Node_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_PIP_Decision_Node_ascii_load(x, stream)
    ccall((:ppl_PIP_Decision_Node_ascii_load, libppl_c), Cint, (ppl_PIP_Decision_Node_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_io_print_Artificial_Parameter(x)
    ccall((:ppl_io_print_Artificial_Parameter, libppl_c), Cint, (ppl_const_Artificial_Parameter_t,), x)
end

function ppl_io_fprint_Artificial_Parameter(stream, x)
    ccall((:ppl_io_fprint_Artificial_Parameter, libppl_c), Cint, (Ptr{Libc.FILE}, ppl_const_Artificial_Parameter_t), stream, x)
end

function ppl_io_asprint_Artificial_Parameter(strp, x)
    ccall((:ppl_io_asprint_Artificial_Parameter, libppl_c), Cint, (Ptr{Ptr{Cchar}}, ppl_const_Artificial_Parameter_t), strp, x)
end

function ppl_Artificial_Parameter_ascii_dump(x, stream)
    ccall((:ppl_Artificial_Parameter_ascii_dump, libppl_c), Cint, (ppl_const_Artificial_Parameter_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_Artificial_Parameter_ascii_load(x, stream)
    ccall((:ppl_Artificial_Parameter_ascii_load, libppl_c), Cint, (ppl_Artificial_Parameter_t, Ptr{Libc.FILE}), x, stream)
end

mutable struct ppl_Polyhedron_tag end

const ppl_Polyhedron_t = Ptr{ppl_Polyhedron_tag}

const ppl_const_Polyhedron_t = Ptr{ppl_Polyhedron_tag}

mutable struct ppl_Grid_tag end

const ppl_Grid_t = Ptr{ppl_Grid_tag}

const ppl_const_Grid_t = Ptr{ppl_Grid_tag}

mutable struct ppl_Rational_Box_tag end

const ppl_Rational_Box_t = Ptr{ppl_Rational_Box_tag}

const ppl_const_Rational_Box_t = Ptr{ppl_Rational_Box_tag}

mutable struct ppl_BD_Shape_mpz_class_tag end

const ppl_BD_Shape_mpz_class_t = Ptr{ppl_BD_Shape_mpz_class_tag}

const ppl_const_BD_Shape_mpz_class_t = Ptr{ppl_BD_Shape_mpz_class_tag}

mutable struct ppl_BD_Shape_mpq_class_tag end

const ppl_BD_Shape_mpq_class_t = Ptr{ppl_BD_Shape_mpq_class_tag}

const ppl_const_BD_Shape_mpq_class_t = Ptr{ppl_BD_Shape_mpq_class_tag}

mutable struct ppl_Octagonal_Shape_mpz_class_tag end

const ppl_Octagonal_Shape_mpz_class_t = Ptr{ppl_Octagonal_Shape_mpz_class_tag}

const ppl_const_Octagonal_Shape_mpz_class_t = Ptr{ppl_Octagonal_Shape_mpz_class_tag}

mutable struct ppl_Octagonal_Shape_mpq_class_tag end

const ppl_Octagonal_Shape_mpq_class_t = Ptr{ppl_Octagonal_Shape_mpq_class_tag}

const ppl_const_Octagonal_Shape_mpq_class_t = Ptr{ppl_Octagonal_Shape_mpq_class_tag}

mutable struct ppl_Constraints_Product_C_Polyhedron_Grid_tag end

const ppl_Constraints_Product_C_Polyhedron_Grid_t = Ptr{ppl_Constraints_Product_C_Polyhedron_Grid_tag}

const ppl_const_Constraints_Product_C_Polyhedron_Grid_t = Ptr{ppl_Constraints_Product_C_Polyhedron_Grid_tag}

mutable struct ppl_Pointset_Powerset_C_Polyhedron_tag end

const ppl_Pointset_Powerset_C_Polyhedron_t = Ptr{ppl_Pointset_Powerset_C_Polyhedron_tag}

const ppl_const_Pointset_Powerset_C_Polyhedron_t = Ptr{ppl_Pointset_Powerset_C_Polyhedron_tag}

mutable struct ppl_Pointset_Powerset_NNC_Polyhedron_tag end

const ppl_Pointset_Powerset_NNC_Polyhedron_t = Ptr{ppl_Pointset_Powerset_NNC_Polyhedron_tag}

const ppl_const_Pointset_Powerset_NNC_Polyhedron_t = Ptr{ppl_Pointset_Powerset_NNC_Polyhedron_tag}

function ppl_delete_Polyhedron(ph)
    ccall((:ppl_delete_Polyhedron, libppl_c), Cint, (ppl_const_Polyhedron_t,), ph)
end

function ppl_new_C_Polyhedron_from_space_dimension(pph, d, empty)
    ccall((:ppl_new_C_Polyhedron_from_space_dimension, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_dimension_type, Cint), pph, d, empty)
end

function ppl_new_NNC_Polyhedron_from_space_dimension(pph, d, empty)
    ccall((:ppl_new_NNC_Polyhedron_from_space_dimension, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_dimension_type, Cint), pph, d, empty)
end

function ppl_new_C_Polyhedron_from_C_Polyhedron(pph, ph)
    ccall((:ppl_new_C_Polyhedron_from_C_Polyhedron, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_Polyhedron_t), pph, ph)
end

function ppl_new_NNC_Polyhedron_from_C_Polyhedron(pph, ph)
    ccall((:ppl_new_NNC_Polyhedron_from_C_Polyhedron, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_Polyhedron_t), pph, ph)
end

function ppl_new_C_Polyhedron_from_NNC_Polyhedron(pph, ph)
    ccall((:ppl_new_C_Polyhedron_from_NNC_Polyhedron, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_Polyhedron_t), pph, ph)
end

function ppl_new_NNC_Polyhedron_from_NNC_Polyhedron(pph, ph)
    ccall((:ppl_new_NNC_Polyhedron_from_NNC_Polyhedron, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_Polyhedron_t), pph, ph)
end

function ppl_new_C_Polyhedron_from_Grid(pph, ph)
    ccall((:ppl_new_C_Polyhedron_from_Grid, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_Grid_t), pph, ph)
end

function ppl_new_NNC_Polyhedron_from_Grid(pph, ph)
    ccall((:ppl_new_NNC_Polyhedron_from_Grid, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_Grid_t), pph, ph)
end

function ppl_new_C_Polyhedron_from_Rational_Box(pph, ph)
    ccall((:ppl_new_C_Polyhedron_from_Rational_Box, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_Rational_Box_t), pph, ph)
end

function ppl_new_NNC_Polyhedron_from_Rational_Box(pph, ph)
    ccall((:ppl_new_NNC_Polyhedron_from_Rational_Box, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_Rational_Box_t), pph, ph)
end

function ppl_new_C_Polyhedron_from_BD_Shape_mpz_class(pph, ph)
    ccall((:ppl_new_C_Polyhedron_from_BD_Shape_mpz_class, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_BD_Shape_mpz_class_t), pph, ph)
end

function ppl_new_NNC_Polyhedron_from_BD_Shape_mpz_class(pph, ph)
    ccall((:ppl_new_NNC_Polyhedron_from_BD_Shape_mpz_class, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_BD_Shape_mpz_class_t), pph, ph)
end

function ppl_new_C_Polyhedron_from_BD_Shape_mpq_class(pph, ph)
    ccall((:ppl_new_C_Polyhedron_from_BD_Shape_mpq_class, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_BD_Shape_mpq_class_t), pph, ph)
end

function ppl_new_NNC_Polyhedron_from_BD_Shape_mpq_class(pph, ph)
    ccall((:ppl_new_NNC_Polyhedron_from_BD_Shape_mpq_class, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_BD_Shape_mpq_class_t), pph, ph)
end

function ppl_new_C_Polyhedron_from_Octagonal_Shape_mpz_class(pph, ph)
    ccall((:ppl_new_C_Polyhedron_from_Octagonal_Shape_mpz_class, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_Octagonal_Shape_mpz_class_t), pph, ph)
end

function ppl_new_NNC_Polyhedron_from_Octagonal_Shape_mpz_class(pph, ph)
    ccall((:ppl_new_NNC_Polyhedron_from_Octagonal_Shape_mpz_class, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_Octagonal_Shape_mpz_class_t), pph, ph)
end

function ppl_new_C_Polyhedron_from_Octagonal_Shape_mpq_class(pph, ph)
    ccall((:ppl_new_C_Polyhedron_from_Octagonal_Shape_mpq_class, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_Octagonal_Shape_mpq_class_t), pph, ph)
end

function ppl_new_NNC_Polyhedron_from_Octagonal_Shape_mpq_class(pph, ph)
    ccall((:ppl_new_NNC_Polyhedron_from_Octagonal_Shape_mpq_class, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_Octagonal_Shape_mpq_class_t), pph, ph)
end

function ppl_new_C_Polyhedron_from_C_Polyhedron_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_C_Polyhedron_from_C_Polyhedron_with_complexity, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_Polyhedron_t, Cint), pph, ph, complexity)
end

function ppl_new_NNC_Polyhedron_from_C_Polyhedron_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_NNC_Polyhedron_from_C_Polyhedron_with_complexity, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_Polyhedron_t, Cint), pph, ph, complexity)
end

function ppl_new_C_Polyhedron_from_NNC_Polyhedron_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_C_Polyhedron_from_NNC_Polyhedron_with_complexity, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_Polyhedron_t, Cint), pph, ph, complexity)
end

function ppl_new_NNC_Polyhedron_from_NNC_Polyhedron_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_NNC_Polyhedron_from_NNC_Polyhedron_with_complexity, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_Polyhedron_t, Cint), pph, ph, complexity)
end

function ppl_new_C_Polyhedron_from_Grid_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_C_Polyhedron_from_Grid_with_complexity, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_Grid_t, Cint), pph, ph, complexity)
end

function ppl_new_NNC_Polyhedron_from_Grid_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_NNC_Polyhedron_from_Grid_with_complexity, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_Grid_t, Cint), pph, ph, complexity)
end

function ppl_new_C_Polyhedron_from_Rational_Box_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_C_Polyhedron_from_Rational_Box_with_complexity, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_Rational_Box_t, Cint), pph, ph, complexity)
end

function ppl_new_NNC_Polyhedron_from_Rational_Box_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_NNC_Polyhedron_from_Rational_Box_with_complexity, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_Rational_Box_t, Cint), pph, ph, complexity)
end

function ppl_new_C_Polyhedron_from_BD_Shape_mpz_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_C_Polyhedron_from_BD_Shape_mpz_class_with_complexity, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_BD_Shape_mpz_class_t, Cint), pph, ph, complexity)
end

function ppl_new_NNC_Polyhedron_from_BD_Shape_mpz_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_NNC_Polyhedron_from_BD_Shape_mpz_class_with_complexity, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_BD_Shape_mpz_class_t, Cint), pph, ph, complexity)
end

function ppl_new_C_Polyhedron_from_BD_Shape_mpq_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_C_Polyhedron_from_BD_Shape_mpq_class_with_complexity, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_BD_Shape_mpq_class_t, Cint), pph, ph, complexity)
end

function ppl_new_NNC_Polyhedron_from_BD_Shape_mpq_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_NNC_Polyhedron_from_BD_Shape_mpq_class_with_complexity, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_BD_Shape_mpq_class_t, Cint), pph, ph, complexity)
end

function ppl_new_C_Polyhedron_from_Octagonal_Shape_mpz_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_C_Polyhedron_from_Octagonal_Shape_mpz_class_with_complexity, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_Octagonal_Shape_mpz_class_t, Cint), pph, ph, complexity)
end

function ppl_new_NNC_Polyhedron_from_Octagonal_Shape_mpz_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_NNC_Polyhedron_from_Octagonal_Shape_mpz_class_with_complexity, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_Octagonal_Shape_mpz_class_t, Cint), pph, ph, complexity)
end

function ppl_new_C_Polyhedron_from_Octagonal_Shape_mpq_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_C_Polyhedron_from_Octagonal_Shape_mpq_class_with_complexity, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_Octagonal_Shape_mpq_class_t, Cint), pph, ph, complexity)
end

function ppl_new_NNC_Polyhedron_from_Octagonal_Shape_mpq_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_NNC_Polyhedron_from_Octagonal_Shape_mpq_class_with_complexity, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_Octagonal_Shape_mpq_class_t, Cint), pph, ph, complexity)
end

function ppl_new_C_Polyhedron_from_Constraint_System(pph, cs)
    ccall((:ppl_new_C_Polyhedron_from_Constraint_System, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_Constraint_System_t), pph, cs)
end

function ppl_new_NNC_Polyhedron_from_Constraint_System(pph, cs)
    ccall((:ppl_new_NNC_Polyhedron_from_Constraint_System, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_Constraint_System_t), pph, cs)
end

function ppl_new_C_Polyhedron_from_Congruence_System(pph, cs)
    ccall((:ppl_new_C_Polyhedron_from_Congruence_System, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_Congruence_System_t), pph, cs)
end

function ppl_new_NNC_Polyhedron_from_Congruence_System(pph, cs)
    ccall((:ppl_new_NNC_Polyhedron_from_Congruence_System, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_Congruence_System_t), pph, cs)
end

function ppl_new_C_Polyhedron_from_Generator_System(pph, cs)
    ccall((:ppl_new_C_Polyhedron_from_Generator_System, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_Generator_System_t), pph, cs)
end

function ppl_new_NNC_Polyhedron_from_Generator_System(pph, cs)
    ccall((:ppl_new_NNC_Polyhedron_from_Generator_System, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_const_Generator_System_t), pph, cs)
end

function ppl_Polyhedron_space_dimension(ph, m)
    ccall((:ppl_Polyhedron_space_dimension, libppl_c), Cint, (ppl_const_Polyhedron_t, Ptr{ppl_dimension_type}), ph, m)
end

function ppl_Polyhedron_affine_dimension(ph, m)
    ccall((:ppl_Polyhedron_affine_dimension, libppl_c), Cint, (ppl_const_Polyhedron_t, Ptr{ppl_dimension_type}), ph, m)
end

function ppl_Polyhedron_relation_with_Constraint(ph, c)
    ccall((:ppl_Polyhedron_relation_with_Constraint, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_const_Constraint_t), ph, c)
end

function ppl_Polyhedron_relation_with_Generator(ph, c)
    ccall((:ppl_Polyhedron_relation_with_Generator, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_const_Generator_t), ph, c)
end

function ppl_Polyhedron_relation_with_Congruence(ph, c)
    ccall((:ppl_Polyhedron_relation_with_Congruence, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_const_Congruence_t), ph, c)
end

function ppl_Polyhedron_get_constraints(ph, pcs)
    ccall((:ppl_Polyhedron_get_constraints, libppl_c), Cint, (ppl_const_Polyhedron_t, Ptr{ppl_const_Constraint_System_t}), ph, pcs)
end

function ppl_Polyhedron_get_congruences(ph, pcs)
    ccall((:ppl_Polyhedron_get_congruences, libppl_c), Cint, (ppl_const_Polyhedron_t, Ptr{ppl_const_Congruence_System_t}), ph, pcs)
end

function ppl_Polyhedron_get_generators(ph, pcs)
    ccall((:ppl_Polyhedron_get_generators, libppl_c), Cint, (ppl_const_Polyhedron_t, Ptr{ppl_const_Generator_System_t}), ph, pcs)
end

function ppl_Polyhedron_get_minimized_constraints(ph, pcs)
    ccall((:ppl_Polyhedron_get_minimized_constraints, libppl_c), Cint, (ppl_const_Polyhedron_t, Ptr{ppl_const_Constraint_System_t}), ph, pcs)
end

function ppl_Polyhedron_get_minimized_congruences(ph, pcs)
    ccall((:ppl_Polyhedron_get_minimized_congruences, libppl_c), Cint, (ppl_const_Polyhedron_t, Ptr{ppl_const_Congruence_System_t}), ph, pcs)
end

function ppl_Polyhedron_get_minimized_generators(ph, pcs)
    ccall((:ppl_Polyhedron_get_minimized_generators, libppl_c), Cint, (ppl_const_Polyhedron_t, Ptr{ppl_const_Generator_System_t}), ph, pcs)
end

function ppl_Polyhedron_is_empty(ph)
    ccall((:ppl_Polyhedron_is_empty, libppl_c), Cint, (ppl_const_Polyhedron_t,), ph)
end

function ppl_Polyhedron_is_universe(ph)
    ccall((:ppl_Polyhedron_is_universe, libppl_c), Cint, (ppl_const_Polyhedron_t,), ph)
end

function ppl_Polyhedron_is_bounded(ph)
    ccall((:ppl_Polyhedron_is_bounded, libppl_c), Cint, (ppl_const_Polyhedron_t,), ph)
end

function ppl_Polyhedron_contains_integer_point(ph)
    ccall((:ppl_Polyhedron_contains_integer_point, libppl_c), Cint, (ppl_const_Polyhedron_t,), ph)
end

function ppl_Polyhedron_is_topologically_closed(ph)
    ccall((:ppl_Polyhedron_is_topologically_closed, libppl_c), Cint, (ppl_const_Polyhedron_t,), ph)
end

function ppl_Polyhedron_is_discrete(ph)
    ccall((:ppl_Polyhedron_is_discrete, libppl_c), Cint, (ppl_const_Polyhedron_t,), ph)
end

function ppl_Polyhedron_topological_closure_assign(ph)
    ccall((:ppl_Polyhedron_topological_closure_assign, libppl_c), Cint, (ppl_Polyhedron_t,), ph)
end

function ppl_Polyhedron_bounds_from_above(ph, le)
    ccall((:ppl_Polyhedron_bounds_from_above, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_const_Linear_Expression_t), ph, le)
end

function ppl_Polyhedron_bounds_from_below(ph, le)
    ccall((:ppl_Polyhedron_bounds_from_below, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_const_Linear_Expression_t), ph, le)
end

function ppl_Polyhedron_maximize(ph, le, ext_n, ext_d, poptimum)
    ccall((:ppl_Polyhedron_maximize, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}), ph, le, ext_n, ext_d, poptimum)
end

function ppl_Polyhedron_minimize(ph, le, ext_n, ext_d, poptimum)
    ccall((:ppl_Polyhedron_minimize, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}), ph, le, ext_n, ext_d, poptimum)
end

function ppl_Polyhedron_maximize_with_point(ph, le, ext_n, ext_d, poptimum, point)
    ccall((:ppl_Polyhedron_maximize_with_point, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}, ppl_Generator_t), ph, le, ext_n, ext_d, poptimum, point)
end

function ppl_Polyhedron_minimize_with_point(ph, le, ext_n, ext_d, poptimum, point)
    ccall((:ppl_Polyhedron_minimize_with_point, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}, ppl_Generator_t), ph, le, ext_n, ext_d, poptimum, point)
end

function ppl_Polyhedron_frequency(ph, le, ext_fn, ext_fd, ext_vn, ext_vd)
    ccall((:ppl_Polyhedron_frequency, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, ppl_Coefficient_t, ppl_Coefficient_t), ph, le, ext_fn, ext_fd, ext_vn, ext_vd)
end

function ppl_Polyhedron_contains_Polyhedron(x, y)
    ccall((:ppl_Polyhedron_contains_Polyhedron, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_const_Polyhedron_t), x, y)
end

function ppl_Polyhedron_strictly_contains_Polyhedron(x, y)
    ccall((:ppl_Polyhedron_strictly_contains_Polyhedron, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_const_Polyhedron_t), x, y)
end

function ppl_Polyhedron_is_disjoint_from_Polyhedron(x, y)
    ccall((:ppl_Polyhedron_is_disjoint_from_Polyhedron, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_const_Polyhedron_t), x, y)
end

function ppl_Polyhedron_equals_Polyhedron(x, y)
    ccall((:ppl_Polyhedron_equals_Polyhedron, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_const_Polyhedron_t), x, y)
end

function ppl_Polyhedron_OK(ph)
    ccall((:ppl_Polyhedron_OK, libppl_c), Cint, (ppl_const_Polyhedron_t,), ph)
end

function ppl_Polyhedron_add_constraint(ph, c)
    ccall((:ppl_Polyhedron_add_constraint, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Constraint_t), ph, c)
end

function ppl_Polyhedron_add_congruence(ph, c)
    ccall((:ppl_Polyhedron_add_congruence, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Congruence_t), ph, c)
end

function ppl_Polyhedron_add_generator(ph, c)
    ccall((:ppl_Polyhedron_add_generator, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Generator_t), ph, c)
end

function ppl_Polyhedron_add_constraints(ph, cs)
    ccall((:ppl_Polyhedron_add_constraints, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Constraint_System_t), ph, cs)
end

function ppl_Polyhedron_add_congruences(ph, cs)
    ccall((:ppl_Polyhedron_add_congruences, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Congruence_System_t), ph, cs)
end

function ppl_Polyhedron_add_generators(ph, cs)
    ccall((:ppl_Polyhedron_add_generators, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Generator_System_t), ph, cs)
end

function ppl_Polyhedron_refine_with_constraint(ph, c)
    ccall((:ppl_Polyhedron_refine_with_constraint, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Constraint_t), ph, c)
end

function ppl_Polyhedron_refine_with_congruence(ph, c)
    ccall((:ppl_Polyhedron_refine_with_congruence, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Congruence_t), ph, c)
end

function ppl_Polyhedron_refine_with_constraints(ph, cs)
    ccall((:ppl_Polyhedron_refine_with_constraints, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Constraint_System_t), ph, cs)
end

function ppl_Polyhedron_refine_with_congruences(ph, cs)
    ccall((:ppl_Polyhedron_refine_with_congruences, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Congruence_System_t), ph, cs)
end

function ppl_Polyhedron_intersection_assign(x, y)
    ccall((:ppl_Polyhedron_intersection_assign, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Polyhedron_t), x, y)
end

function ppl_Polyhedron_upper_bound_assign(x, y)
    ccall((:ppl_Polyhedron_upper_bound_assign, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Polyhedron_t), x, y)
end

function ppl_Polyhedron_difference_assign(x, y)
    ccall((:ppl_Polyhedron_difference_assign, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Polyhedron_t), x, y)
end

function ppl_Polyhedron_concatenate_assign(x, y)
    ccall((:ppl_Polyhedron_concatenate_assign, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Polyhedron_t), x, y)
end

function ppl_Polyhedron_time_elapse_assign(x, y)
    ccall((:ppl_Polyhedron_time_elapse_assign, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Polyhedron_t), x, y)
end

function ppl_Polyhedron_poly_hull_assign(x, y)
    ccall((:ppl_Polyhedron_poly_hull_assign, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Polyhedron_t), x, y)
end

function ppl_Polyhedron_poly_difference_assign(x, y)
    ccall((:ppl_Polyhedron_poly_difference_assign, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Polyhedron_t), x, y)
end

function ppl_Polyhedron_upper_bound_assign_if_exact(x, y)
    ccall((:ppl_Polyhedron_upper_bound_assign_if_exact, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Polyhedron_t), x, y)
end

function ppl_Polyhedron_poly_hull_assign_if_exact(x, y)
    ccall((:ppl_Polyhedron_poly_hull_assign_if_exact, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Polyhedron_t), x, y)
end

function ppl_Polyhedron_positive_time_elapse_assign(x, y)
    ccall((:ppl_Polyhedron_positive_time_elapse_assign, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Polyhedron_t), x, y)
end

function ppl_Polyhedron_simplify_using_context_assign(x, y)
    ccall((:ppl_Polyhedron_simplify_using_context_assign, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Polyhedron_t), x, y)
end

function ppl_Polyhedron_constrains(ph, var)
    ccall((:ppl_Polyhedron_constrains, libppl_c), Cint, (ppl_Polyhedron_t, ppl_dimension_type), ph, var)
end

function ppl_Polyhedron_unconstrain_space_dimension(ph, var)
    ccall((:ppl_Polyhedron_unconstrain_space_dimension, libppl_c), Cint, (ppl_Polyhedron_t, ppl_dimension_type), ph, var)
end

function ppl_Polyhedron_unconstrain_space_dimensions(ph, ds, n)
    ccall((:ppl_Polyhedron_unconstrain_space_dimensions, libppl_c), Cint, (ppl_Polyhedron_t, Ptr{ppl_dimension_type}, Csize_t), ph, ds, n)
end

function ppl_Polyhedron_affine_image(ph, var, le, d)
    ccall((:ppl_Polyhedron_affine_image, libppl_c), Cint, (ppl_Polyhedron_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, le, d)
end

function ppl_Polyhedron_affine_preimage(ph, var, le, d)
    ccall((:ppl_Polyhedron_affine_preimage, libppl_c), Cint, (ppl_Polyhedron_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, le, d)
end

function ppl_Polyhedron_bounded_affine_image(ph, var, lb, ub, d)
    ccall((:ppl_Polyhedron_bounded_affine_image, libppl_c), Cint, (ppl_Polyhedron_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, lb, ub, d)
end

function ppl_Polyhedron_bounded_affine_preimage(ph, var, lb, ub, d)
    ccall((:ppl_Polyhedron_bounded_affine_preimage, libppl_c), Cint, (ppl_Polyhedron_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, lb, ub, d)
end

function ppl_Polyhedron_generalized_affine_image(ph, var, relsym, le, d)
    ccall((:ppl_Polyhedron_generalized_affine_image, libppl_c), Cint, (ppl_Polyhedron_t, ppl_dimension_type, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, relsym, le, d)
end

function ppl_Polyhedron_generalized_affine_preimage(ph, var, relsym, le, d)
    ccall((:ppl_Polyhedron_generalized_affine_preimage, libppl_c), Cint, (ppl_Polyhedron_t, ppl_dimension_type, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, relsym, le, d)
end

function ppl_Polyhedron_generalized_affine_image_lhs_rhs(ph, lhs, relsym, rhs)
    ccall((:ppl_Polyhedron_generalized_affine_image_lhs_rhs, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Linear_Expression_t, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t), ph, lhs, relsym, rhs)
end

function ppl_Polyhedron_generalized_affine_preimage_lhs_rhs(ph, lhs, relsym, rhs)
    ccall((:ppl_Polyhedron_generalized_affine_preimage_lhs_rhs, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Linear_Expression_t, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t), ph, lhs, relsym, rhs)
end

function ppl_Polyhedron_add_space_dimensions_and_embed(ph, d)
    ccall((:ppl_Polyhedron_add_space_dimensions_and_embed, libppl_c), Cint, (ppl_Polyhedron_t, ppl_dimension_type), ph, d)
end

function ppl_Polyhedron_add_space_dimensions_and_project(ph, d)
    ccall((:ppl_Polyhedron_add_space_dimensions_and_project, libppl_c), Cint, (ppl_Polyhedron_t, ppl_dimension_type), ph, d)
end

function ppl_Polyhedron_remove_space_dimensions(ph, ds, n)
    ccall((:ppl_Polyhedron_remove_space_dimensions, libppl_c), Cint, (ppl_Polyhedron_t, Ptr{ppl_dimension_type}, Csize_t), ph, ds, n)
end

function ppl_Polyhedron_remove_higher_space_dimensions(ph, d)
    ccall((:ppl_Polyhedron_remove_higher_space_dimensions, libppl_c), Cint, (ppl_Polyhedron_t, ppl_dimension_type), ph, d)
end

function ppl_Polyhedron_expand_space_dimension(ph, d, m)
    ccall((:ppl_Polyhedron_expand_space_dimension, libppl_c), Cint, (ppl_Polyhedron_t, ppl_dimension_type, ppl_dimension_type), ph, d, m)
end

function ppl_Polyhedron_fold_space_dimensions(ph, ds, n, d)
    ccall((:ppl_Polyhedron_fold_space_dimensions, libppl_c), Cint, (ppl_Polyhedron_t, Ptr{ppl_dimension_type}, Csize_t, ppl_dimension_type), ph, ds, n, d)
end

function ppl_Polyhedron_map_space_dimensions(ph, maps, n)
    ccall((:ppl_Polyhedron_map_space_dimensions, libppl_c), Cint, (ppl_Polyhedron_t, Ptr{ppl_dimension_type}, Csize_t), ph, maps, n)
end

function ppl_Polyhedron_drop_some_non_integer_points(ph, complexity)
    ccall((:ppl_Polyhedron_drop_some_non_integer_points, libppl_c), Cint, (ppl_Polyhedron_t, Cint), ph, complexity)
end

function ppl_Polyhedron_drop_some_non_integer_points_2(ph, ds, n, complexity)
    ccall((:ppl_Polyhedron_drop_some_non_integer_points_2, libppl_c), Cint, (ppl_Polyhedron_t, Ptr{ppl_dimension_type}, Csize_t, Cint), ph, ds, n, complexity)
end

function ppl_Polyhedron_external_memory_in_bytes(ps, sz)
    ccall((:ppl_Polyhedron_external_memory_in_bytes, libppl_c), Cint, (ppl_const_Polyhedron_t, Ptr{Csize_t}), ps, sz)
end

function ppl_Polyhedron_total_memory_in_bytes(ps, sz)
    ccall((:ppl_Polyhedron_total_memory_in_bytes, libppl_c), Cint, (ppl_const_Polyhedron_t, Ptr{Csize_t}), ps, sz)
end

function ppl_Polyhedron_BHRZ03_widening_assign_with_tokens(x, y, tp)
    ccall((:ppl_Polyhedron_BHRZ03_widening_assign_with_tokens, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Polyhedron_t, Ptr{Cuint}), x, y, tp)
end

function ppl_Polyhedron_H79_widening_assign_with_tokens(x, y, tp)
    ccall((:ppl_Polyhedron_H79_widening_assign_with_tokens, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Polyhedron_t, Ptr{Cuint}), x, y, tp)
end

function ppl_Polyhedron_BHRZ03_widening_assign(x, y)
    ccall((:ppl_Polyhedron_BHRZ03_widening_assign, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Polyhedron_t), x, y)
end

function ppl_Polyhedron_H79_widening_assign(x, y)
    ccall((:ppl_Polyhedron_H79_widening_assign, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Polyhedron_t), x, y)
end

function ppl_Polyhedron_widening_assign_with_tokens(x, y, tp)
    ccall((:ppl_Polyhedron_widening_assign_with_tokens, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Polyhedron_t, Ptr{Cuint}), x, y, tp)
end

function ppl_Polyhedron_widening_assign(x, y)
    ccall((:ppl_Polyhedron_widening_assign, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Polyhedron_t), x, y)
end

function ppl_Polyhedron_limited_BHRZ03_extrapolation_assign_with_tokens(x, y, cs, tp)
    ccall((:ppl_Polyhedron_limited_BHRZ03_extrapolation_assign_with_tokens, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Polyhedron_t, ppl_const_Constraint_System_t, Ptr{Cuint}), x, y, cs, tp)
end

function ppl_Polyhedron_bounded_BHRZ03_extrapolation_assign_with_tokens(x, y, cs, tp)
    ccall((:ppl_Polyhedron_bounded_BHRZ03_extrapolation_assign_with_tokens, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Polyhedron_t, ppl_const_Constraint_System_t, Ptr{Cuint}), x, y, cs, tp)
end

function ppl_Polyhedron_limited_H79_extrapolation_assign_with_tokens(x, y, cs, tp)
    ccall((:ppl_Polyhedron_limited_H79_extrapolation_assign_with_tokens, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Polyhedron_t, ppl_const_Constraint_System_t, Ptr{Cuint}), x, y, cs, tp)
end

function ppl_Polyhedron_bounded_H79_extrapolation_assign_with_tokens(x, y, cs, tp)
    ccall((:ppl_Polyhedron_bounded_H79_extrapolation_assign_with_tokens, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Polyhedron_t, ppl_const_Constraint_System_t, Ptr{Cuint}), x, y, cs, tp)
end

function ppl_Polyhedron_limited_BHRZ03_extrapolation_assign(x, y, cs)
    ccall((:ppl_Polyhedron_limited_BHRZ03_extrapolation_assign, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Polyhedron_t, ppl_const_Constraint_System_t), x, y, cs)
end

function ppl_Polyhedron_bounded_BHRZ03_extrapolation_assign(x, y, cs)
    ccall((:ppl_Polyhedron_bounded_BHRZ03_extrapolation_assign, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Polyhedron_t, ppl_const_Constraint_System_t), x, y, cs)
end

function ppl_Polyhedron_limited_H79_extrapolation_assign(x, y, cs)
    ccall((:ppl_Polyhedron_limited_H79_extrapolation_assign, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Polyhedron_t, ppl_const_Constraint_System_t), x, y, cs)
end

function ppl_Polyhedron_bounded_H79_extrapolation_assign(x, y, cs)
    ccall((:ppl_Polyhedron_bounded_H79_extrapolation_assign, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Polyhedron_t, ppl_const_Constraint_System_t), x, y, cs)
end

function ppl_Polyhedron_linear_partition(x, y, p_inters, p_rest)
    ccall((:ppl_Polyhedron_linear_partition, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_const_Polyhedron_t, Ptr{ppl_Polyhedron_t}, Ptr{ppl_Pointset_Powerset_NNC_Polyhedron_t}), x, y, p_inters, p_rest)
end

function ppl_Polyhedron_wrap_assign(ph, ds, n, w, r, o, pcs, complexity_threshold, wrap_individually)
    ccall((:ppl_Polyhedron_wrap_assign, libppl_c), Cint, (ppl_Polyhedron_t, Ptr{ppl_dimension_type}, Csize_t, ppl_enum_Bounded_Integer_Type_Width, ppl_enum_Bounded_Integer_Type_Representation, ppl_enum_Bounded_Integer_Type_Overflow, Ptr{ppl_const_Constraint_System_t}, Cuint, Cint), ph, ds, n, w, r, o, pcs, complexity_threshold, wrap_individually)
end

function ppl_new_C_Polyhedron_recycle_Constraint_System(pph, cs)
    ccall((:ppl_new_C_Polyhedron_recycle_Constraint_System, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_Constraint_System_t), pph, cs)
end

function ppl_new_NNC_Polyhedron_recycle_Constraint_System(pph, cs)
    ccall((:ppl_new_NNC_Polyhedron_recycle_Constraint_System, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_Constraint_System_t), pph, cs)
end

function ppl_new_C_Polyhedron_recycle_Congruence_System(pph, cs)
    ccall((:ppl_new_C_Polyhedron_recycle_Congruence_System, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_Congruence_System_t), pph, cs)
end

function ppl_new_NNC_Polyhedron_recycle_Congruence_System(pph, cs)
    ccall((:ppl_new_NNC_Polyhedron_recycle_Congruence_System, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_Congruence_System_t), pph, cs)
end

function ppl_new_C_Polyhedron_recycle_Generator_System(pph, cs)
    ccall((:ppl_new_C_Polyhedron_recycle_Generator_System, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_Generator_System_t), pph, cs)
end

function ppl_new_NNC_Polyhedron_recycle_Generator_System(pph, cs)
    ccall((:ppl_new_NNC_Polyhedron_recycle_Generator_System, libppl_c), Cint, (Ptr{ppl_Polyhedron_t}, ppl_Generator_System_t), pph, cs)
end

function ppl_assign_C_Polyhedron_from_C_Polyhedron(dst, src)
    ccall((:ppl_assign_C_Polyhedron_from_C_Polyhedron, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Polyhedron_t), dst, src)
end

function ppl_assign_NNC_Polyhedron_from_NNC_Polyhedron(dst, src)
    ccall((:ppl_assign_NNC_Polyhedron_from_NNC_Polyhedron, libppl_c), Cint, (ppl_Polyhedron_t, ppl_const_Polyhedron_t), dst, src)
end

function ppl_Polyhedron_add_recycled_constraints(ph, cs)
    ccall((:ppl_Polyhedron_add_recycled_constraints, libppl_c), Cint, (ppl_Polyhedron_t, ppl_Constraint_System_t), ph, cs)
end

function ppl_Polyhedron_add_recycled_congruences(ph, cs)
    ccall((:ppl_Polyhedron_add_recycled_congruences, libppl_c), Cint, (ppl_Polyhedron_t, ppl_Congruence_System_t), ph, cs)
end

function ppl_Polyhedron_add_recycled_generators(ph, cs)
    ccall((:ppl_Polyhedron_add_recycled_generators, libppl_c), Cint, (ppl_Polyhedron_t, ppl_Generator_System_t), ph, cs)
end

function ppl_termination_test_MS_C_Polyhedron(pset)
    ccall((:ppl_termination_test_MS_C_Polyhedron, libppl_c), Cint, (ppl_const_Polyhedron_t,), pset)
end

function ppl_termination_test_PR_C_Polyhedron(pset)
    ccall((:ppl_termination_test_PR_C_Polyhedron, libppl_c), Cint, (ppl_const_Polyhedron_t,), pset)
end

function ppl_termination_test_MS_NNC_Polyhedron(pset)
    ccall((:ppl_termination_test_MS_NNC_Polyhedron, libppl_c), Cint, (ppl_const_Polyhedron_t,), pset)
end

function ppl_termination_test_PR_NNC_Polyhedron(pset)
    ccall((:ppl_termination_test_PR_NNC_Polyhedron, libppl_c), Cint, (ppl_const_Polyhedron_t,), pset)
end

function ppl_one_affine_ranking_function_MS_C_Polyhedron(pset, point)
    ccall((:ppl_one_affine_ranking_function_MS_C_Polyhedron, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_Generator_t), pset, point)
end

function ppl_one_affine_ranking_function_PR_C_Polyhedron(pset, point)
    ccall((:ppl_one_affine_ranking_function_PR_C_Polyhedron, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_Generator_t), pset, point)
end

function ppl_one_affine_ranking_function_MS_NNC_Polyhedron(pset, point)
    ccall((:ppl_one_affine_ranking_function_MS_NNC_Polyhedron, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_Generator_t), pset, point)
end

function ppl_one_affine_ranking_function_PR_NNC_Polyhedron(pset, point)
    ccall((:ppl_one_affine_ranking_function_PR_NNC_Polyhedron, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_Generator_t), pset, point)
end

function ppl_all_affine_ranking_functions_MS_C_Polyhedron(pset, ph)
    ccall((:ppl_all_affine_ranking_functions_MS_C_Polyhedron, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_Polyhedron_t), pset, ph)
end

function ppl_all_affine_ranking_functions_PR_C_Polyhedron(pset, ph)
    ccall((:ppl_all_affine_ranking_functions_PR_C_Polyhedron, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_Polyhedron_t), pset, ph)
end

function ppl_all_affine_ranking_functions_MS_NNC_Polyhedron(pset, ph)
    ccall((:ppl_all_affine_ranking_functions_MS_NNC_Polyhedron, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_Polyhedron_t), pset, ph)
end

function ppl_all_affine_ranking_functions_PR_NNC_Polyhedron(pset, ph)
    ccall((:ppl_all_affine_ranking_functions_PR_NNC_Polyhedron, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_Polyhedron_t), pset, ph)
end

function ppl_termination_test_MS_C_Polyhedron_2(pset_before, pset_after)
    ccall((:ppl_termination_test_MS_C_Polyhedron_2, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_const_Polyhedron_t), pset_before, pset_after)
end

function ppl_termination_test_PR_C_Polyhedron_2(pset_before, pset_after)
    ccall((:ppl_termination_test_PR_C_Polyhedron_2, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_const_Polyhedron_t), pset_before, pset_after)
end

function ppl_termination_test_MS_NNC_Polyhedron_2(pset_before, pset_after)
    ccall((:ppl_termination_test_MS_NNC_Polyhedron_2, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_const_Polyhedron_t), pset_before, pset_after)
end

function ppl_termination_test_PR_NNC_Polyhedron_2(pset_before, pset_after)
    ccall((:ppl_termination_test_PR_NNC_Polyhedron_2, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_const_Polyhedron_t), pset_before, pset_after)
end

function ppl_one_affine_ranking_function_MS_C_Polyhedron_2(pset_before, pset_after, point)
    ccall((:ppl_one_affine_ranking_function_MS_C_Polyhedron_2, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_const_Polyhedron_t, ppl_Generator_t), pset_before, pset_after, point)
end

function ppl_one_affine_ranking_function_PR_C_Polyhedron_2(pset_before, pset_after, point)
    ccall((:ppl_one_affine_ranking_function_PR_C_Polyhedron_2, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_const_Polyhedron_t, ppl_Generator_t), pset_before, pset_after, point)
end

function ppl_one_affine_ranking_function_MS_NNC_Polyhedron_2(pset_before, pset_after, point)
    ccall((:ppl_one_affine_ranking_function_MS_NNC_Polyhedron_2, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_const_Polyhedron_t, ppl_Generator_t), pset_before, pset_after, point)
end

function ppl_one_affine_ranking_function_PR_NNC_Polyhedron_2(pset_before, pset_after, point)
    ccall((:ppl_one_affine_ranking_function_PR_NNC_Polyhedron_2, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_const_Polyhedron_t, ppl_Generator_t), pset_before, pset_after, point)
end

function ppl_all_affine_ranking_functions_MS_C_Polyhedron_2(pset_before, pset_after, ph)
    ccall((:ppl_all_affine_ranking_functions_MS_C_Polyhedron_2, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_const_Polyhedron_t, ppl_Polyhedron_t), pset_before, pset_after, ph)
end

function ppl_all_affine_ranking_functions_PR_C_Polyhedron_2(pset_before, pset_after, ph)
    ccall((:ppl_all_affine_ranking_functions_PR_C_Polyhedron_2, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_const_Polyhedron_t, ppl_Polyhedron_t), pset_before, pset_after, ph)
end

function ppl_all_affine_ranking_functions_MS_NNC_Polyhedron_2(pset_before, pset_after, ph)
    ccall((:ppl_all_affine_ranking_functions_MS_NNC_Polyhedron_2, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_const_Polyhedron_t, ppl_Polyhedron_t), pset_before, pset_after, ph)
end

function ppl_all_affine_ranking_functions_PR_NNC_Polyhedron_2(pset_before, pset_after, ph)
    ccall((:ppl_all_affine_ranking_functions_PR_NNC_Polyhedron_2, libppl_c), Cint, (ppl_const_Polyhedron_t, ppl_const_Polyhedron_t, ppl_Polyhedron_t), pset_before, pset_after, ph)
end

function ppl_io_print_Polyhedron(x)
    ccall((:ppl_io_print_Polyhedron, libppl_c), Cint, (ppl_const_Polyhedron_t,), x)
end

function ppl_io_fprint_Polyhedron(stream, x)
    ccall((:ppl_io_fprint_Polyhedron, libppl_c), Cint, (Ptr{Libc.FILE}, ppl_const_Polyhedron_t), stream, x)
end

function ppl_io_asprint_Polyhedron(strp, x)
    ccall((:ppl_io_asprint_Polyhedron, libppl_c), Cint, (Ptr{Ptr{Cchar}}, ppl_const_Polyhedron_t), strp, x)
end

function ppl_Polyhedron_ascii_dump(x, stream)
    ccall((:ppl_Polyhedron_ascii_dump, libppl_c), Cint, (ppl_const_Polyhedron_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_Polyhedron_ascii_load(x, stream)
    ccall((:ppl_Polyhedron_ascii_load, libppl_c), Cint, (ppl_Polyhedron_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_delete_Grid(ph)
    ccall((:ppl_delete_Grid, libppl_c), Cint, (ppl_const_Grid_t,), ph)
end

function ppl_new_Grid_from_space_dimension(pph, d, empty)
    ccall((:ppl_new_Grid_from_space_dimension, libppl_c), Cint, (Ptr{ppl_Grid_t}, ppl_dimension_type, Cint), pph, d, empty)
end

function ppl_new_Grid_from_C_Polyhedron(pph, ph)
    ccall((:ppl_new_Grid_from_C_Polyhedron, libppl_c), Cint, (Ptr{ppl_Grid_t}, ppl_const_Polyhedron_t), pph, ph)
end

function ppl_new_Grid_from_NNC_Polyhedron(pph, ph)
    ccall((:ppl_new_Grid_from_NNC_Polyhedron, libppl_c), Cint, (Ptr{ppl_Grid_t}, ppl_const_Polyhedron_t), pph, ph)
end

function ppl_new_Grid_from_Grid(pph, ph)
    ccall((:ppl_new_Grid_from_Grid, libppl_c), Cint, (Ptr{ppl_Grid_t}, ppl_const_Grid_t), pph, ph)
end

function ppl_new_Grid_from_Rational_Box(pph, ph)
    ccall((:ppl_new_Grid_from_Rational_Box, libppl_c), Cint, (Ptr{ppl_Grid_t}, ppl_const_Rational_Box_t), pph, ph)
end

function ppl_new_Grid_from_BD_Shape_mpz_class(pph, ph)
    ccall((:ppl_new_Grid_from_BD_Shape_mpz_class, libppl_c), Cint, (Ptr{ppl_Grid_t}, ppl_const_BD_Shape_mpz_class_t), pph, ph)
end

function ppl_new_Grid_from_BD_Shape_mpq_class(pph, ph)
    ccall((:ppl_new_Grid_from_BD_Shape_mpq_class, libppl_c), Cint, (Ptr{ppl_Grid_t}, ppl_const_BD_Shape_mpq_class_t), pph, ph)
end

function ppl_new_Grid_from_Octagonal_Shape_mpz_class(pph, ph)
    ccall((:ppl_new_Grid_from_Octagonal_Shape_mpz_class, libppl_c), Cint, (Ptr{ppl_Grid_t}, ppl_const_Octagonal_Shape_mpz_class_t), pph, ph)
end

function ppl_new_Grid_from_Octagonal_Shape_mpq_class(pph, ph)
    ccall((:ppl_new_Grid_from_Octagonal_Shape_mpq_class, libppl_c), Cint, (Ptr{ppl_Grid_t}, ppl_const_Octagonal_Shape_mpq_class_t), pph, ph)
end

function ppl_new_Grid_from_C_Polyhedron_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Grid_from_C_Polyhedron_with_complexity, libppl_c), Cint, (Ptr{ppl_Grid_t}, ppl_const_Polyhedron_t, Cint), pph, ph, complexity)
end

function ppl_new_Grid_from_NNC_Polyhedron_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Grid_from_NNC_Polyhedron_with_complexity, libppl_c), Cint, (Ptr{ppl_Grid_t}, ppl_const_Polyhedron_t, Cint), pph, ph, complexity)
end

function ppl_new_Grid_from_Grid_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Grid_from_Grid_with_complexity, libppl_c), Cint, (Ptr{ppl_Grid_t}, ppl_const_Grid_t, Cint), pph, ph, complexity)
end

function ppl_new_Grid_from_Rational_Box_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Grid_from_Rational_Box_with_complexity, libppl_c), Cint, (Ptr{ppl_Grid_t}, ppl_const_Rational_Box_t, Cint), pph, ph, complexity)
end

function ppl_new_Grid_from_BD_Shape_mpz_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Grid_from_BD_Shape_mpz_class_with_complexity, libppl_c), Cint, (Ptr{ppl_Grid_t}, ppl_const_BD_Shape_mpz_class_t, Cint), pph, ph, complexity)
end

function ppl_new_Grid_from_BD_Shape_mpq_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Grid_from_BD_Shape_mpq_class_with_complexity, libppl_c), Cint, (Ptr{ppl_Grid_t}, ppl_const_BD_Shape_mpq_class_t, Cint), pph, ph, complexity)
end

function ppl_new_Grid_from_Octagonal_Shape_mpz_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Grid_from_Octagonal_Shape_mpz_class_with_complexity, libppl_c), Cint, (Ptr{ppl_Grid_t}, ppl_const_Octagonal_Shape_mpz_class_t, Cint), pph, ph, complexity)
end

function ppl_new_Grid_from_Octagonal_Shape_mpq_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Grid_from_Octagonal_Shape_mpq_class_with_complexity, libppl_c), Cint, (Ptr{ppl_Grid_t}, ppl_const_Octagonal_Shape_mpq_class_t, Cint), pph, ph, complexity)
end

function ppl_new_Grid_from_Constraint_System(pph, cs)
    ccall((:ppl_new_Grid_from_Constraint_System, libppl_c), Cint, (Ptr{ppl_Grid_t}, ppl_const_Constraint_System_t), pph, cs)
end

function ppl_new_Grid_from_Congruence_System(pph, cs)
    ccall((:ppl_new_Grid_from_Congruence_System, libppl_c), Cint, (Ptr{ppl_Grid_t}, ppl_const_Congruence_System_t), pph, cs)
end

function ppl_new_Grid_from_Grid_Generator_System(pph, cs)
    ccall((:ppl_new_Grid_from_Grid_Generator_System, libppl_c), Cint, (Ptr{ppl_Grid_t}, ppl_const_Grid_Generator_System_t), pph, cs)
end

function ppl_Grid_space_dimension(ph, m)
    ccall((:ppl_Grid_space_dimension, libppl_c), Cint, (ppl_const_Grid_t, Ptr{ppl_dimension_type}), ph, m)
end

function ppl_Grid_affine_dimension(ph, m)
    ccall((:ppl_Grid_affine_dimension, libppl_c), Cint, (ppl_const_Grid_t, Ptr{ppl_dimension_type}), ph, m)
end

function ppl_Grid_relation_with_Constraint(ph, c)
    ccall((:ppl_Grid_relation_with_Constraint, libppl_c), Cint, (ppl_const_Grid_t, ppl_const_Constraint_t), ph, c)
end

function ppl_Grid_relation_with_Generator(ph, c)
    ccall((:ppl_Grid_relation_with_Generator, libppl_c), Cint, (ppl_const_Grid_t, ppl_const_Generator_t), ph, c)
end

function ppl_Grid_relation_with_Congruence(ph, c)
    ccall((:ppl_Grid_relation_with_Congruence, libppl_c), Cint, (ppl_const_Grid_t, ppl_const_Congruence_t), ph, c)
end

function ppl_Grid_relation_with_Grid_Generator(ph, c)
    ccall((:ppl_Grid_relation_with_Grid_Generator, libppl_c), Cint, (ppl_const_Grid_t, ppl_const_Grid_Generator_t), ph, c)
end

function ppl_Grid_get_constraints(ph, pcs)
    ccall((:ppl_Grid_get_constraints, libppl_c), Cint, (ppl_const_Grid_t, Ptr{ppl_const_Constraint_System_t}), ph, pcs)
end

function ppl_Grid_get_congruences(ph, pcs)
    ccall((:ppl_Grid_get_congruences, libppl_c), Cint, (ppl_const_Grid_t, Ptr{ppl_const_Congruence_System_t}), ph, pcs)
end

function ppl_Grid_get_grid_generators(ph, pcs)
    ccall((:ppl_Grid_get_grid_generators, libppl_c), Cint, (ppl_const_Grid_t, Ptr{ppl_const_Grid_Generator_System_t}), ph, pcs)
end

function ppl_Grid_get_minimized_constraints(ph, pcs)
    ccall((:ppl_Grid_get_minimized_constraints, libppl_c), Cint, (ppl_const_Grid_t, Ptr{ppl_const_Constraint_System_t}), ph, pcs)
end

function ppl_Grid_get_minimized_congruences(ph, pcs)
    ccall((:ppl_Grid_get_minimized_congruences, libppl_c), Cint, (ppl_const_Grid_t, Ptr{ppl_const_Congruence_System_t}), ph, pcs)
end

function ppl_Grid_get_minimized_grid_generators(ph, pcs)
    ccall((:ppl_Grid_get_minimized_grid_generators, libppl_c), Cint, (ppl_const_Grid_t, Ptr{ppl_const_Grid_Generator_System_t}), ph, pcs)
end

function ppl_Grid_is_empty(ph)
    ccall((:ppl_Grid_is_empty, libppl_c), Cint, (ppl_const_Grid_t,), ph)
end

function ppl_Grid_is_universe(ph)
    ccall((:ppl_Grid_is_universe, libppl_c), Cint, (ppl_const_Grid_t,), ph)
end

function ppl_Grid_is_bounded(ph)
    ccall((:ppl_Grid_is_bounded, libppl_c), Cint, (ppl_const_Grid_t,), ph)
end

function ppl_Grid_contains_integer_point(ph)
    ccall((:ppl_Grid_contains_integer_point, libppl_c), Cint, (ppl_const_Grid_t,), ph)
end

function ppl_Grid_is_topologically_closed(ph)
    ccall((:ppl_Grid_is_topologically_closed, libppl_c), Cint, (ppl_const_Grid_t,), ph)
end

function ppl_Grid_is_discrete(ph)
    ccall((:ppl_Grid_is_discrete, libppl_c), Cint, (ppl_const_Grid_t,), ph)
end

function ppl_Grid_topological_closure_assign(ph)
    ccall((:ppl_Grid_topological_closure_assign, libppl_c), Cint, (ppl_Grid_t,), ph)
end

function ppl_Grid_bounds_from_above(ph, le)
    ccall((:ppl_Grid_bounds_from_above, libppl_c), Cint, (ppl_const_Grid_t, ppl_const_Linear_Expression_t), ph, le)
end

function ppl_Grid_bounds_from_below(ph, le)
    ccall((:ppl_Grid_bounds_from_below, libppl_c), Cint, (ppl_const_Grid_t, ppl_const_Linear_Expression_t), ph, le)
end

function ppl_Grid_maximize(ph, le, ext_n, ext_d, poptimum)
    ccall((:ppl_Grid_maximize, libppl_c), Cint, (ppl_const_Grid_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}), ph, le, ext_n, ext_d, poptimum)
end

function ppl_Grid_minimize(ph, le, ext_n, ext_d, poptimum)
    ccall((:ppl_Grid_minimize, libppl_c), Cint, (ppl_const_Grid_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}), ph, le, ext_n, ext_d, poptimum)
end

function ppl_Grid_maximize_with_point(ph, le, ext_n, ext_d, poptimum, point)
    ccall((:ppl_Grid_maximize_with_point, libppl_c), Cint, (ppl_const_Grid_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}, ppl_Generator_t), ph, le, ext_n, ext_d, poptimum, point)
end

function ppl_Grid_minimize_with_point(ph, le, ext_n, ext_d, poptimum, point)
    ccall((:ppl_Grid_minimize_with_point, libppl_c), Cint, (ppl_const_Grid_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}, ppl_Generator_t), ph, le, ext_n, ext_d, poptimum, point)
end

function ppl_Grid_frequency(ph, le, ext_fn, ext_fd, ext_vn, ext_vd)
    ccall((:ppl_Grid_frequency, libppl_c), Cint, (ppl_const_Grid_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, ppl_Coefficient_t, ppl_Coefficient_t), ph, le, ext_fn, ext_fd, ext_vn, ext_vd)
end

function ppl_Grid_contains_Grid(x, y)
    ccall((:ppl_Grid_contains_Grid, libppl_c), Cint, (ppl_const_Grid_t, ppl_const_Grid_t), x, y)
end

function ppl_Grid_strictly_contains_Grid(x, y)
    ccall((:ppl_Grid_strictly_contains_Grid, libppl_c), Cint, (ppl_const_Grid_t, ppl_const_Grid_t), x, y)
end

function ppl_Grid_is_disjoint_from_Grid(x, y)
    ccall((:ppl_Grid_is_disjoint_from_Grid, libppl_c), Cint, (ppl_const_Grid_t, ppl_const_Grid_t), x, y)
end

function ppl_Grid_equals_Grid(x, y)
    ccall((:ppl_Grid_equals_Grid, libppl_c), Cint, (ppl_const_Grid_t, ppl_const_Grid_t), x, y)
end

function ppl_Grid_OK(ph)
    ccall((:ppl_Grid_OK, libppl_c), Cint, (ppl_const_Grid_t,), ph)
end

function ppl_Grid_add_constraint(ph, c)
    ccall((:ppl_Grid_add_constraint, libppl_c), Cint, (ppl_Grid_t, ppl_const_Constraint_t), ph, c)
end

function ppl_Grid_add_congruence(ph, c)
    ccall((:ppl_Grid_add_congruence, libppl_c), Cint, (ppl_Grid_t, ppl_const_Congruence_t), ph, c)
end

function ppl_Grid_add_grid_generator(ph, c)
    ccall((:ppl_Grid_add_grid_generator, libppl_c), Cint, (ppl_Grid_t, ppl_const_Grid_Generator_t), ph, c)
end

function ppl_Grid_add_constraints(ph, cs)
    ccall((:ppl_Grid_add_constraints, libppl_c), Cint, (ppl_Grid_t, ppl_const_Constraint_System_t), ph, cs)
end

function ppl_Grid_add_congruences(ph, cs)
    ccall((:ppl_Grid_add_congruences, libppl_c), Cint, (ppl_Grid_t, ppl_const_Congruence_System_t), ph, cs)
end

function ppl_Grid_add_grid_generators(ph, cs)
    ccall((:ppl_Grid_add_grid_generators, libppl_c), Cint, (ppl_Grid_t, ppl_const_Grid_Generator_System_t), ph, cs)
end

function ppl_Grid_refine_with_constraint(ph, c)
    ccall((:ppl_Grid_refine_with_constraint, libppl_c), Cint, (ppl_Grid_t, ppl_const_Constraint_t), ph, c)
end

function ppl_Grid_refine_with_congruence(ph, c)
    ccall((:ppl_Grid_refine_with_congruence, libppl_c), Cint, (ppl_Grid_t, ppl_const_Congruence_t), ph, c)
end

function ppl_Grid_refine_with_constraints(ph, cs)
    ccall((:ppl_Grid_refine_with_constraints, libppl_c), Cint, (ppl_Grid_t, ppl_const_Constraint_System_t), ph, cs)
end

function ppl_Grid_refine_with_congruences(ph, cs)
    ccall((:ppl_Grid_refine_with_congruences, libppl_c), Cint, (ppl_Grid_t, ppl_const_Congruence_System_t), ph, cs)
end

function ppl_Grid_intersection_assign(x, y)
    ccall((:ppl_Grid_intersection_assign, libppl_c), Cint, (ppl_Grid_t, ppl_const_Grid_t), x, y)
end

function ppl_Grid_upper_bound_assign(x, y)
    ccall((:ppl_Grid_upper_bound_assign, libppl_c), Cint, (ppl_Grid_t, ppl_const_Grid_t), x, y)
end

function ppl_Grid_difference_assign(x, y)
    ccall((:ppl_Grid_difference_assign, libppl_c), Cint, (ppl_Grid_t, ppl_const_Grid_t), x, y)
end

function ppl_Grid_concatenate_assign(x, y)
    ccall((:ppl_Grid_concatenate_assign, libppl_c), Cint, (ppl_Grid_t, ppl_const_Grid_t), x, y)
end

function ppl_Grid_time_elapse_assign(x, y)
    ccall((:ppl_Grid_time_elapse_assign, libppl_c), Cint, (ppl_Grid_t, ppl_const_Grid_t), x, y)
end

function ppl_Grid_upper_bound_assign_if_exact(x, y)
    ccall((:ppl_Grid_upper_bound_assign_if_exact, libppl_c), Cint, (ppl_Grid_t, ppl_const_Grid_t), x, y)
end

function ppl_Grid_simplify_using_context_assign(x, y)
    ccall((:ppl_Grid_simplify_using_context_assign, libppl_c), Cint, (ppl_Grid_t, ppl_const_Grid_t), x, y)
end

function ppl_Grid_constrains(ph, var)
    ccall((:ppl_Grid_constrains, libppl_c), Cint, (ppl_Grid_t, ppl_dimension_type), ph, var)
end

function ppl_Grid_unconstrain_space_dimension(ph, var)
    ccall((:ppl_Grid_unconstrain_space_dimension, libppl_c), Cint, (ppl_Grid_t, ppl_dimension_type), ph, var)
end

function ppl_Grid_unconstrain_space_dimensions(ph, ds, n)
    ccall((:ppl_Grid_unconstrain_space_dimensions, libppl_c), Cint, (ppl_Grid_t, Ptr{ppl_dimension_type}, Csize_t), ph, ds, n)
end

function ppl_Grid_affine_image(ph, var, le, d)
    ccall((:ppl_Grid_affine_image, libppl_c), Cint, (ppl_Grid_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, le, d)
end

function ppl_Grid_affine_preimage(ph, var, le, d)
    ccall((:ppl_Grid_affine_preimage, libppl_c), Cint, (ppl_Grid_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, le, d)
end

function ppl_Grid_bounded_affine_image(ph, var, lb, ub, d)
    ccall((:ppl_Grid_bounded_affine_image, libppl_c), Cint, (ppl_Grid_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, lb, ub, d)
end

function ppl_Grid_bounded_affine_preimage(ph, var, lb, ub, d)
    ccall((:ppl_Grid_bounded_affine_preimage, libppl_c), Cint, (ppl_Grid_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, lb, ub, d)
end

function ppl_Grid_generalized_affine_image(ph, var, relsym, le, d)
    ccall((:ppl_Grid_generalized_affine_image, libppl_c), Cint, (ppl_Grid_t, ppl_dimension_type, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, relsym, le, d)
end

function ppl_Grid_generalized_affine_preimage(ph, var, relsym, le, d)
    ccall((:ppl_Grid_generalized_affine_preimage, libppl_c), Cint, (ppl_Grid_t, ppl_dimension_type, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, relsym, le, d)
end

function ppl_Grid_generalized_affine_image_lhs_rhs(ph, lhs, relsym, rhs)
    ccall((:ppl_Grid_generalized_affine_image_lhs_rhs, libppl_c), Cint, (ppl_Grid_t, ppl_const_Linear_Expression_t, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t), ph, lhs, relsym, rhs)
end

function ppl_Grid_generalized_affine_preimage_lhs_rhs(ph, lhs, relsym, rhs)
    ccall((:ppl_Grid_generalized_affine_preimage_lhs_rhs, libppl_c), Cint, (ppl_Grid_t, ppl_const_Linear_Expression_t, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t), ph, lhs, relsym, rhs)
end

function ppl_Grid_generalized_affine_image_with_congruence(ph, var, relsym, le, d, m)
    ccall((:ppl_Grid_generalized_affine_image_with_congruence, libppl_c), Cint, (ppl_Grid_t, ppl_dimension_type, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t, ppl_const_Coefficient_t), ph, var, relsym, le, d, m)
end

function ppl_Grid_generalized_affine_preimage_with_congruence(ph, var, relsym, le, d, m)
    ccall((:ppl_Grid_generalized_affine_preimage_with_congruence, libppl_c), Cint, (ppl_Grid_t, ppl_dimension_type, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t, ppl_const_Coefficient_t), ph, var, relsym, le, d, m)
end

function ppl_Grid_generalized_affine_image_lhs_rhs_with_congruence(ph, lhs, relsym, rhs, m)
    ccall((:ppl_Grid_generalized_affine_image_lhs_rhs_with_congruence, libppl_c), Cint, (ppl_Grid_t, ppl_const_Linear_Expression_t, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, lhs, relsym, rhs, m)
end

function ppl_Grid_generalized_affine_preimage_lhs_rhs_with_congruence(ph, lhs, relsym, rhs, m)
    ccall((:ppl_Grid_generalized_affine_preimage_lhs_rhs_with_congruence, libppl_c), Cint, (ppl_Grid_t, ppl_const_Linear_Expression_t, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, lhs, relsym, rhs, m)
end

function ppl_Grid_add_space_dimensions_and_embed(ph, d)
    ccall((:ppl_Grid_add_space_dimensions_and_embed, libppl_c), Cint, (ppl_Grid_t, ppl_dimension_type), ph, d)
end

function ppl_Grid_add_space_dimensions_and_project(ph, d)
    ccall((:ppl_Grid_add_space_dimensions_and_project, libppl_c), Cint, (ppl_Grid_t, ppl_dimension_type), ph, d)
end

function ppl_Grid_remove_space_dimensions(ph, ds, n)
    ccall((:ppl_Grid_remove_space_dimensions, libppl_c), Cint, (ppl_Grid_t, Ptr{ppl_dimension_type}, Csize_t), ph, ds, n)
end

function ppl_Grid_remove_higher_space_dimensions(ph, d)
    ccall((:ppl_Grid_remove_higher_space_dimensions, libppl_c), Cint, (ppl_Grid_t, ppl_dimension_type), ph, d)
end

function ppl_Grid_expand_space_dimension(ph, d, m)
    ccall((:ppl_Grid_expand_space_dimension, libppl_c), Cint, (ppl_Grid_t, ppl_dimension_type, ppl_dimension_type), ph, d, m)
end

function ppl_Grid_fold_space_dimensions(ph, ds, n, d)
    ccall((:ppl_Grid_fold_space_dimensions, libppl_c), Cint, (ppl_Grid_t, Ptr{ppl_dimension_type}, Csize_t, ppl_dimension_type), ph, ds, n, d)
end

function ppl_Grid_map_space_dimensions(ph, maps, n)
    ccall((:ppl_Grid_map_space_dimensions, libppl_c), Cint, (ppl_Grid_t, Ptr{ppl_dimension_type}, Csize_t), ph, maps, n)
end

function ppl_Grid_drop_some_non_integer_points(ph, complexity)
    ccall((:ppl_Grid_drop_some_non_integer_points, libppl_c), Cint, (ppl_Grid_t, Cint), ph, complexity)
end

function ppl_Grid_drop_some_non_integer_points_2(ph, ds, n, complexity)
    ccall((:ppl_Grid_drop_some_non_integer_points_2, libppl_c), Cint, (ppl_Grid_t, Ptr{ppl_dimension_type}, Csize_t, Cint), ph, ds, n, complexity)
end

function ppl_Grid_external_memory_in_bytes(ps, sz)
    ccall((:ppl_Grid_external_memory_in_bytes, libppl_c), Cint, (ppl_const_Grid_t, Ptr{Csize_t}), ps, sz)
end

function ppl_Grid_total_memory_in_bytes(ps, sz)
    ccall((:ppl_Grid_total_memory_in_bytes, libppl_c), Cint, (ppl_const_Grid_t, Ptr{Csize_t}), ps, sz)
end

function ppl_Grid_congruence_widening_assign_with_tokens(x, y, tp)
    ccall((:ppl_Grid_congruence_widening_assign_with_tokens, libppl_c), Cint, (ppl_Grid_t, ppl_const_Grid_t, Ptr{Cuint}), x, y, tp)
end

function ppl_Grid_generator_widening_assign_with_tokens(x, y, tp)
    ccall((:ppl_Grid_generator_widening_assign_with_tokens, libppl_c), Cint, (ppl_Grid_t, ppl_const_Grid_t, Ptr{Cuint}), x, y, tp)
end

function ppl_Grid_congruence_widening_assign(x, y)
    ccall((:ppl_Grid_congruence_widening_assign, libppl_c), Cint, (ppl_Grid_t, ppl_const_Grid_t), x, y)
end

function ppl_Grid_generator_widening_assign(x, y)
    ccall((:ppl_Grid_generator_widening_assign, libppl_c), Cint, (ppl_Grid_t, ppl_const_Grid_t), x, y)
end

function ppl_Grid_widening_assign_with_tokens(x, y, tp)
    ccall((:ppl_Grid_widening_assign_with_tokens, libppl_c), Cint, (ppl_Grid_t, ppl_const_Grid_t, Ptr{Cuint}), x, y, tp)
end

function ppl_Grid_widening_assign(x, y)
    ccall((:ppl_Grid_widening_assign, libppl_c), Cint, (ppl_Grid_t, ppl_const_Grid_t), x, y)
end

function ppl_Grid_limited_congruence_extrapolation_assign_with_tokens(x, y, cs, tp)
    ccall((:ppl_Grid_limited_congruence_extrapolation_assign_with_tokens, libppl_c), Cint, (ppl_Grid_t, ppl_const_Grid_t, ppl_const_Congruence_System_t, Ptr{Cuint}), x, y, cs, tp)
end

function ppl_Grid_limited_generator_extrapolation_assign_with_tokens(x, y, cs, tp)
    ccall((:ppl_Grid_limited_generator_extrapolation_assign_with_tokens, libppl_c), Cint, (ppl_Grid_t, ppl_const_Grid_t, ppl_const_Congruence_System_t, Ptr{Cuint}), x, y, cs, tp)
end

function ppl_Grid_limited_congruence_extrapolation_assign(x, y, cs)
    ccall((:ppl_Grid_limited_congruence_extrapolation_assign, libppl_c), Cint, (ppl_Grid_t, ppl_const_Grid_t, ppl_const_Congruence_System_t), x, y, cs)
end

function ppl_Grid_limited_generator_extrapolation_assign(x, y, cs)
    ccall((:ppl_Grid_limited_generator_extrapolation_assign, libppl_c), Cint, (ppl_Grid_t, ppl_const_Grid_t, ppl_const_Congruence_System_t), x, y, cs)
end

function ppl_Grid_wrap_assign(ph, ds, n, w, r, o, pcs, complexity_threshold, wrap_individually)
    ccall((:ppl_Grid_wrap_assign, libppl_c), Cint, (ppl_Grid_t, Ptr{ppl_dimension_type}, Csize_t, ppl_enum_Bounded_Integer_Type_Width, ppl_enum_Bounded_Integer_Type_Representation, ppl_enum_Bounded_Integer_Type_Overflow, Ptr{ppl_const_Constraint_System_t}, Cuint, Cint), ph, ds, n, w, r, o, pcs, complexity_threshold, wrap_individually)
end

function ppl_new_Grid_recycle_Constraint_System(pph, cs)
    ccall((:ppl_new_Grid_recycle_Constraint_System, libppl_c), Cint, (Ptr{ppl_Grid_t}, ppl_Constraint_System_t), pph, cs)
end

function ppl_new_Grid_recycle_Congruence_System(pph, cs)
    ccall((:ppl_new_Grid_recycle_Congruence_System, libppl_c), Cint, (Ptr{ppl_Grid_t}, ppl_Congruence_System_t), pph, cs)
end

function ppl_new_Grid_recycle_Grid_Generator_System(pph, cs)
    ccall((:ppl_new_Grid_recycle_Grid_Generator_System, libppl_c), Cint, (Ptr{ppl_Grid_t}, ppl_Grid_Generator_System_t), pph, cs)
end

function ppl_assign_Grid_from_Grid(dst, src)
    ccall((:ppl_assign_Grid_from_Grid, libppl_c), Cint, (ppl_Grid_t, ppl_const_Grid_t), dst, src)
end

function ppl_Grid_add_recycled_constraints(ph, cs)
    ccall((:ppl_Grid_add_recycled_constraints, libppl_c), Cint, (ppl_Grid_t, ppl_Constraint_System_t), ph, cs)
end

function ppl_Grid_add_recycled_congruences(ph, cs)
    ccall((:ppl_Grid_add_recycled_congruences, libppl_c), Cint, (ppl_Grid_t, ppl_Congruence_System_t), ph, cs)
end

function ppl_Grid_add_recycled_grid_generators(ph, cs)
    ccall((:ppl_Grid_add_recycled_grid_generators, libppl_c), Cint, (ppl_Grid_t, ppl_Grid_Generator_System_t), ph, cs)
end

function ppl_termination_test_MS_Grid(pset)
    ccall((:ppl_termination_test_MS_Grid, libppl_c), Cint, (ppl_const_Grid_t,), pset)
end

function ppl_termination_test_PR_Grid(pset)
    ccall((:ppl_termination_test_PR_Grid, libppl_c), Cint, (ppl_const_Grid_t,), pset)
end

function ppl_one_affine_ranking_function_MS_Grid(pset, point)
    ccall((:ppl_one_affine_ranking_function_MS_Grid, libppl_c), Cint, (ppl_const_Grid_t, ppl_Generator_t), pset, point)
end

function ppl_one_affine_ranking_function_PR_Grid(pset, point)
    ccall((:ppl_one_affine_ranking_function_PR_Grid, libppl_c), Cint, (ppl_const_Grid_t, ppl_Generator_t), pset, point)
end

function ppl_all_affine_ranking_functions_MS_Grid(pset, ph)
    ccall((:ppl_all_affine_ranking_functions_MS_Grid, libppl_c), Cint, (ppl_const_Grid_t, ppl_Polyhedron_t), pset, ph)
end

function ppl_all_affine_ranking_functions_PR_Grid(pset, ph)
    ccall((:ppl_all_affine_ranking_functions_PR_Grid, libppl_c), Cint, (ppl_const_Grid_t, ppl_Polyhedron_t), pset, ph)
end

function ppl_termination_test_MS_Grid_2(pset_before, pset_after)
    ccall((:ppl_termination_test_MS_Grid_2, libppl_c), Cint, (ppl_const_Grid_t, ppl_const_Grid_t), pset_before, pset_after)
end

function ppl_termination_test_PR_Grid_2(pset_before, pset_after)
    ccall((:ppl_termination_test_PR_Grid_2, libppl_c), Cint, (ppl_const_Grid_t, ppl_const_Grid_t), pset_before, pset_after)
end

function ppl_one_affine_ranking_function_MS_Grid_2(pset_before, pset_after, point)
    ccall((:ppl_one_affine_ranking_function_MS_Grid_2, libppl_c), Cint, (ppl_const_Grid_t, ppl_const_Grid_t, ppl_Generator_t), pset_before, pset_after, point)
end

function ppl_one_affine_ranking_function_PR_Grid_2(pset_before, pset_after, point)
    ccall((:ppl_one_affine_ranking_function_PR_Grid_2, libppl_c), Cint, (ppl_const_Grid_t, ppl_const_Grid_t, ppl_Generator_t), pset_before, pset_after, point)
end

function ppl_all_affine_ranking_functions_MS_Grid_2(pset_before, pset_after, ph)
    ccall((:ppl_all_affine_ranking_functions_MS_Grid_2, libppl_c), Cint, (ppl_const_Grid_t, ppl_const_Grid_t, ppl_Polyhedron_t), pset_before, pset_after, ph)
end

function ppl_all_affine_ranking_functions_PR_Grid_2(pset_before, pset_after, ph)
    ccall((:ppl_all_affine_ranking_functions_PR_Grid_2, libppl_c), Cint, (ppl_const_Grid_t, ppl_const_Grid_t, ppl_Polyhedron_t), pset_before, pset_after, ph)
end

function ppl_io_print_Grid(x)
    ccall((:ppl_io_print_Grid, libppl_c), Cint, (ppl_const_Grid_t,), x)
end

function ppl_io_fprint_Grid(stream, x)
    ccall((:ppl_io_fprint_Grid, libppl_c), Cint, (Ptr{Libc.FILE}, ppl_const_Grid_t), stream, x)
end

function ppl_io_asprint_Grid(strp, x)
    ccall((:ppl_io_asprint_Grid, libppl_c), Cint, (Ptr{Ptr{Cchar}}, ppl_const_Grid_t), strp, x)
end

function ppl_Grid_ascii_dump(x, stream)
    ccall((:ppl_Grid_ascii_dump, libppl_c), Cint, (ppl_const_Grid_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_Grid_ascii_load(x, stream)
    ccall((:ppl_Grid_ascii_load, libppl_c), Cint, (ppl_Grid_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_delete_Rational_Box(ph)
    ccall((:ppl_delete_Rational_Box, libppl_c), Cint, (ppl_const_Rational_Box_t,), ph)
end

function ppl_new_Rational_Box_from_space_dimension(pph, d, empty)
    ccall((:ppl_new_Rational_Box_from_space_dimension, libppl_c), Cint, (Ptr{ppl_Rational_Box_t}, ppl_dimension_type, Cint), pph, d, empty)
end

function ppl_new_Rational_Box_from_C_Polyhedron(pph, ph)
    ccall((:ppl_new_Rational_Box_from_C_Polyhedron, libppl_c), Cint, (Ptr{ppl_Rational_Box_t}, ppl_const_Polyhedron_t), pph, ph)
end

function ppl_new_Rational_Box_from_NNC_Polyhedron(pph, ph)
    ccall((:ppl_new_Rational_Box_from_NNC_Polyhedron, libppl_c), Cint, (Ptr{ppl_Rational_Box_t}, ppl_const_Polyhedron_t), pph, ph)
end

function ppl_new_Rational_Box_from_Grid(pph, ph)
    ccall((:ppl_new_Rational_Box_from_Grid, libppl_c), Cint, (Ptr{ppl_Rational_Box_t}, ppl_const_Grid_t), pph, ph)
end

function ppl_new_Rational_Box_from_Rational_Box(pph, ph)
    ccall((:ppl_new_Rational_Box_from_Rational_Box, libppl_c), Cint, (Ptr{ppl_Rational_Box_t}, ppl_const_Rational_Box_t), pph, ph)
end

function ppl_new_Rational_Box_from_BD_Shape_mpz_class(pph, ph)
    ccall((:ppl_new_Rational_Box_from_BD_Shape_mpz_class, libppl_c), Cint, (Ptr{ppl_Rational_Box_t}, ppl_const_BD_Shape_mpz_class_t), pph, ph)
end

function ppl_new_Rational_Box_from_BD_Shape_mpq_class(pph, ph)
    ccall((:ppl_new_Rational_Box_from_BD_Shape_mpq_class, libppl_c), Cint, (Ptr{ppl_Rational_Box_t}, ppl_const_BD_Shape_mpq_class_t), pph, ph)
end

function ppl_new_Rational_Box_from_Octagonal_Shape_mpz_class(pph, ph)
    ccall((:ppl_new_Rational_Box_from_Octagonal_Shape_mpz_class, libppl_c), Cint, (Ptr{ppl_Rational_Box_t}, ppl_const_Octagonal_Shape_mpz_class_t), pph, ph)
end

function ppl_new_Rational_Box_from_Octagonal_Shape_mpq_class(pph, ph)
    ccall((:ppl_new_Rational_Box_from_Octagonal_Shape_mpq_class, libppl_c), Cint, (Ptr{ppl_Rational_Box_t}, ppl_const_Octagonal_Shape_mpq_class_t), pph, ph)
end

function ppl_new_Rational_Box_from_C_Polyhedron_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Rational_Box_from_C_Polyhedron_with_complexity, libppl_c), Cint, (Ptr{ppl_Rational_Box_t}, ppl_const_Polyhedron_t, Cint), pph, ph, complexity)
end

function ppl_new_Rational_Box_from_NNC_Polyhedron_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Rational_Box_from_NNC_Polyhedron_with_complexity, libppl_c), Cint, (Ptr{ppl_Rational_Box_t}, ppl_const_Polyhedron_t, Cint), pph, ph, complexity)
end

function ppl_new_Rational_Box_from_Grid_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Rational_Box_from_Grid_with_complexity, libppl_c), Cint, (Ptr{ppl_Rational_Box_t}, ppl_const_Grid_t, Cint), pph, ph, complexity)
end

function ppl_new_Rational_Box_from_Rational_Box_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Rational_Box_from_Rational_Box_with_complexity, libppl_c), Cint, (Ptr{ppl_Rational_Box_t}, ppl_const_Rational_Box_t, Cint), pph, ph, complexity)
end

function ppl_new_Rational_Box_from_BD_Shape_mpz_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Rational_Box_from_BD_Shape_mpz_class_with_complexity, libppl_c), Cint, (Ptr{ppl_Rational_Box_t}, ppl_const_BD_Shape_mpz_class_t, Cint), pph, ph, complexity)
end

function ppl_new_Rational_Box_from_BD_Shape_mpq_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Rational_Box_from_BD_Shape_mpq_class_with_complexity, libppl_c), Cint, (Ptr{ppl_Rational_Box_t}, ppl_const_BD_Shape_mpq_class_t, Cint), pph, ph, complexity)
end

function ppl_new_Rational_Box_from_Octagonal_Shape_mpz_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Rational_Box_from_Octagonal_Shape_mpz_class_with_complexity, libppl_c), Cint, (Ptr{ppl_Rational_Box_t}, ppl_const_Octagonal_Shape_mpz_class_t, Cint), pph, ph, complexity)
end

function ppl_new_Rational_Box_from_Octagonal_Shape_mpq_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Rational_Box_from_Octagonal_Shape_mpq_class_with_complexity, libppl_c), Cint, (Ptr{ppl_Rational_Box_t}, ppl_const_Octagonal_Shape_mpq_class_t, Cint), pph, ph, complexity)
end

function ppl_new_Rational_Box_from_Constraint_System(pph, cs)
    ccall((:ppl_new_Rational_Box_from_Constraint_System, libppl_c), Cint, (Ptr{ppl_Rational_Box_t}, ppl_const_Constraint_System_t), pph, cs)
end

function ppl_new_Rational_Box_from_Congruence_System(pph, cs)
    ccall((:ppl_new_Rational_Box_from_Congruence_System, libppl_c), Cint, (Ptr{ppl_Rational_Box_t}, ppl_const_Congruence_System_t), pph, cs)
end

function ppl_new_Rational_Box_from_Generator_System(pph, cs)
    ccall((:ppl_new_Rational_Box_from_Generator_System, libppl_c), Cint, (Ptr{ppl_Rational_Box_t}, ppl_const_Generator_System_t), pph, cs)
end

function ppl_Rational_Box_space_dimension(ph, m)
    ccall((:ppl_Rational_Box_space_dimension, libppl_c), Cint, (ppl_const_Rational_Box_t, Ptr{ppl_dimension_type}), ph, m)
end

function ppl_Rational_Box_affine_dimension(ph, m)
    ccall((:ppl_Rational_Box_affine_dimension, libppl_c), Cint, (ppl_const_Rational_Box_t, Ptr{ppl_dimension_type}), ph, m)
end

function ppl_Rational_Box_relation_with_Constraint(ph, c)
    ccall((:ppl_Rational_Box_relation_with_Constraint, libppl_c), Cint, (ppl_const_Rational_Box_t, ppl_const_Constraint_t), ph, c)
end

function ppl_Rational_Box_relation_with_Generator(ph, c)
    ccall((:ppl_Rational_Box_relation_with_Generator, libppl_c), Cint, (ppl_const_Rational_Box_t, ppl_const_Generator_t), ph, c)
end

function ppl_Rational_Box_relation_with_Congruence(ph, c)
    ccall((:ppl_Rational_Box_relation_with_Congruence, libppl_c), Cint, (ppl_const_Rational_Box_t, ppl_const_Congruence_t), ph, c)
end

function ppl_Rational_Box_get_constraints(ph, pcs)
    ccall((:ppl_Rational_Box_get_constraints, libppl_c), Cint, (ppl_const_Rational_Box_t, Ptr{ppl_const_Constraint_System_t}), ph, pcs)
end

function ppl_Rational_Box_get_congruences(ph, pcs)
    ccall((:ppl_Rational_Box_get_congruences, libppl_c), Cint, (ppl_const_Rational_Box_t, Ptr{ppl_const_Congruence_System_t}), ph, pcs)
end

function ppl_Rational_Box_get_minimized_constraints(ph, pcs)
    ccall((:ppl_Rational_Box_get_minimized_constraints, libppl_c), Cint, (ppl_const_Rational_Box_t, Ptr{ppl_const_Constraint_System_t}), ph, pcs)
end

function ppl_Rational_Box_get_minimized_congruences(ph, pcs)
    ccall((:ppl_Rational_Box_get_minimized_congruences, libppl_c), Cint, (ppl_const_Rational_Box_t, Ptr{ppl_const_Congruence_System_t}), ph, pcs)
end

function ppl_Rational_Box_is_empty(ph)
    ccall((:ppl_Rational_Box_is_empty, libppl_c), Cint, (ppl_const_Rational_Box_t,), ph)
end

function ppl_Rational_Box_is_universe(ph)
    ccall((:ppl_Rational_Box_is_universe, libppl_c), Cint, (ppl_const_Rational_Box_t,), ph)
end

function ppl_Rational_Box_is_bounded(ph)
    ccall((:ppl_Rational_Box_is_bounded, libppl_c), Cint, (ppl_const_Rational_Box_t,), ph)
end

function ppl_Rational_Box_contains_integer_point(ph)
    ccall((:ppl_Rational_Box_contains_integer_point, libppl_c), Cint, (ppl_const_Rational_Box_t,), ph)
end

function ppl_Rational_Box_is_topologically_closed(ph)
    ccall((:ppl_Rational_Box_is_topologically_closed, libppl_c), Cint, (ppl_const_Rational_Box_t,), ph)
end

function ppl_Rational_Box_is_discrete(ph)
    ccall((:ppl_Rational_Box_is_discrete, libppl_c), Cint, (ppl_const_Rational_Box_t,), ph)
end

function ppl_Rational_Box_topological_closure_assign(ph)
    ccall((:ppl_Rational_Box_topological_closure_assign, libppl_c), Cint, (ppl_Rational_Box_t,), ph)
end

function ppl_Rational_Box_bounds_from_above(ph, le)
    ccall((:ppl_Rational_Box_bounds_from_above, libppl_c), Cint, (ppl_const_Rational_Box_t, ppl_const_Linear_Expression_t), ph, le)
end

function ppl_Rational_Box_bounds_from_below(ph, le)
    ccall((:ppl_Rational_Box_bounds_from_below, libppl_c), Cint, (ppl_const_Rational_Box_t, ppl_const_Linear_Expression_t), ph, le)
end

function ppl_Rational_Box_get_upper_bound(ps, var, ext_n, ext_d, pclosed)
    ccall((:ppl_Rational_Box_get_upper_bound, libppl_c), Cint, (ppl_Rational_Box_t, ppl_dimension_type, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}), ps, var, ext_n, ext_d, pclosed)
end

function ppl_Rational_Box_get_lower_bound(ps, var, ext_n, ext_d, pclosed)
    ccall((:ppl_Rational_Box_get_lower_bound, libppl_c), Cint, (ppl_Rational_Box_t, ppl_dimension_type, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}), ps, var, ext_n, ext_d, pclosed)
end

function ppl_Rational_Box_maximize(ph, le, ext_n, ext_d, poptimum)
    ccall((:ppl_Rational_Box_maximize, libppl_c), Cint, (ppl_const_Rational_Box_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}), ph, le, ext_n, ext_d, poptimum)
end

function ppl_Rational_Box_minimize(ph, le, ext_n, ext_d, poptimum)
    ccall((:ppl_Rational_Box_minimize, libppl_c), Cint, (ppl_const_Rational_Box_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}), ph, le, ext_n, ext_d, poptimum)
end

function ppl_Rational_Box_maximize_with_point(ph, le, ext_n, ext_d, poptimum, point)
    ccall((:ppl_Rational_Box_maximize_with_point, libppl_c), Cint, (ppl_const_Rational_Box_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}, ppl_Generator_t), ph, le, ext_n, ext_d, poptimum, point)
end

function ppl_Rational_Box_minimize_with_point(ph, le, ext_n, ext_d, poptimum, point)
    ccall((:ppl_Rational_Box_minimize_with_point, libppl_c), Cint, (ppl_const_Rational_Box_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}, ppl_Generator_t), ph, le, ext_n, ext_d, poptimum, point)
end

function ppl_Rational_Box_frequency(ph, le, ext_fn, ext_fd, ext_vn, ext_vd)
    ccall((:ppl_Rational_Box_frequency, libppl_c), Cint, (ppl_const_Rational_Box_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, ppl_Coefficient_t, ppl_Coefficient_t), ph, le, ext_fn, ext_fd, ext_vn, ext_vd)
end

function ppl_Rational_Box_contains_Rational_Box(x, y)
    ccall((:ppl_Rational_Box_contains_Rational_Box, libppl_c), Cint, (ppl_const_Rational_Box_t, ppl_const_Rational_Box_t), x, y)
end

function ppl_Rational_Box_strictly_contains_Rational_Box(x, y)
    ccall((:ppl_Rational_Box_strictly_contains_Rational_Box, libppl_c), Cint, (ppl_const_Rational_Box_t, ppl_const_Rational_Box_t), x, y)
end

function ppl_Rational_Box_is_disjoint_from_Rational_Box(x, y)
    ccall((:ppl_Rational_Box_is_disjoint_from_Rational_Box, libppl_c), Cint, (ppl_const_Rational_Box_t, ppl_const_Rational_Box_t), x, y)
end

function ppl_Rational_Box_equals_Rational_Box(x, y)
    ccall((:ppl_Rational_Box_equals_Rational_Box, libppl_c), Cint, (ppl_const_Rational_Box_t, ppl_const_Rational_Box_t), x, y)
end

function ppl_Rational_Box_OK(ph)
    ccall((:ppl_Rational_Box_OK, libppl_c), Cint, (ppl_const_Rational_Box_t,), ph)
end

function ppl_Rational_Box_add_constraint(ph, c)
    ccall((:ppl_Rational_Box_add_constraint, libppl_c), Cint, (ppl_Rational_Box_t, ppl_const_Constraint_t), ph, c)
end

function ppl_Rational_Box_add_congruence(ph, c)
    ccall((:ppl_Rational_Box_add_congruence, libppl_c), Cint, (ppl_Rational_Box_t, ppl_const_Congruence_t), ph, c)
end

function ppl_Rational_Box_add_constraints(ph, cs)
    ccall((:ppl_Rational_Box_add_constraints, libppl_c), Cint, (ppl_Rational_Box_t, ppl_const_Constraint_System_t), ph, cs)
end

function ppl_Rational_Box_add_congruences(ph, cs)
    ccall((:ppl_Rational_Box_add_congruences, libppl_c), Cint, (ppl_Rational_Box_t, ppl_const_Congruence_System_t), ph, cs)
end

function ppl_Rational_Box_refine_with_constraint(ph, c)
    ccall((:ppl_Rational_Box_refine_with_constraint, libppl_c), Cint, (ppl_Rational_Box_t, ppl_const_Constraint_t), ph, c)
end

function ppl_Rational_Box_refine_with_congruence(ph, c)
    ccall((:ppl_Rational_Box_refine_with_congruence, libppl_c), Cint, (ppl_Rational_Box_t, ppl_const_Congruence_t), ph, c)
end

function ppl_Rational_Box_refine_with_constraints(ph, cs)
    ccall((:ppl_Rational_Box_refine_with_constraints, libppl_c), Cint, (ppl_Rational_Box_t, ppl_const_Constraint_System_t), ph, cs)
end

function ppl_Rational_Box_refine_with_congruences(ph, cs)
    ccall((:ppl_Rational_Box_refine_with_congruences, libppl_c), Cint, (ppl_Rational_Box_t, ppl_const_Congruence_System_t), ph, cs)
end

function ppl_Rational_Box_intersection_assign(x, y)
    ccall((:ppl_Rational_Box_intersection_assign, libppl_c), Cint, (ppl_Rational_Box_t, ppl_const_Rational_Box_t), x, y)
end

function ppl_Rational_Box_upper_bound_assign(x, y)
    ccall((:ppl_Rational_Box_upper_bound_assign, libppl_c), Cint, (ppl_Rational_Box_t, ppl_const_Rational_Box_t), x, y)
end

function ppl_Rational_Box_difference_assign(x, y)
    ccall((:ppl_Rational_Box_difference_assign, libppl_c), Cint, (ppl_Rational_Box_t, ppl_const_Rational_Box_t), x, y)
end

function ppl_Rational_Box_concatenate_assign(x, y)
    ccall((:ppl_Rational_Box_concatenate_assign, libppl_c), Cint, (ppl_Rational_Box_t, ppl_const_Rational_Box_t), x, y)
end

function ppl_Rational_Box_time_elapse_assign(x, y)
    ccall((:ppl_Rational_Box_time_elapse_assign, libppl_c), Cint, (ppl_Rational_Box_t, ppl_const_Rational_Box_t), x, y)
end

function ppl_Rational_Box_upper_bound_assign_if_exact(x, y)
    ccall((:ppl_Rational_Box_upper_bound_assign_if_exact, libppl_c), Cint, (ppl_Rational_Box_t, ppl_const_Rational_Box_t), x, y)
end

function ppl_Rational_Box_simplify_using_context_assign(x, y)
    ccall((:ppl_Rational_Box_simplify_using_context_assign, libppl_c), Cint, (ppl_Rational_Box_t, ppl_const_Rational_Box_t), x, y)
end

function ppl_Rational_Box_constrains(ph, var)
    ccall((:ppl_Rational_Box_constrains, libppl_c), Cint, (ppl_Rational_Box_t, ppl_dimension_type), ph, var)
end

function ppl_Rational_Box_unconstrain_space_dimension(ph, var)
    ccall((:ppl_Rational_Box_unconstrain_space_dimension, libppl_c), Cint, (ppl_Rational_Box_t, ppl_dimension_type), ph, var)
end

function ppl_Rational_Box_unconstrain_space_dimensions(ph, ds, n)
    ccall((:ppl_Rational_Box_unconstrain_space_dimensions, libppl_c), Cint, (ppl_Rational_Box_t, Ptr{ppl_dimension_type}, Csize_t), ph, ds, n)
end

function ppl_Rational_Box_affine_image(ph, var, le, d)
    ccall((:ppl_Rational_Box_affine_image, libppl_c), Cint, (ppl_Rational_Box_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, le, d)
end

function ppl_Rational_Box_affine_preimage(ph, var, le, d)
    ccall((:ppl_Rational_Box_affine_preimage, libppl_c), Cint, (ppl_Rational_Box_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, le, d)
end

function ppl_Rational_Box_bounded_affine_image(ph, var, lb, ub, d)
    ccall((:ppl_Rational_Box_bounded_affine_image, libppl_c), Cint, (ppl_Rational_Box_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, lb, ub, d)
end

function ppl_Rational_Box_bounded_affine_preimage(ph, var, lb, ub, d)
    ccall((:ppl_Rational_Box_bounded_affine_preimage, libppl_c), Cint, (ppl_Rational_Box_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, lb, ub, d)
end

function ppl_Rational_Box_generalized_affine_image(ph, var, relsym, le, d)
    ccall((:ppl_Rational_Box_generalized_affine_image, libppl_c), Cint, (ppl_Rational_Box_t, ppl_dimension_type, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, relsym, le, d)
end

function ppl_Rational_Box_generalized_affine_preimage(ph, var, relsym, le, d)
    ccall((:ppl_Rational_Box_generalized_affine_preimage, libppl_c), Cint, (ppl_Rational_Box_t, ppl_dimension_type, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, relsym, le, d)
end

function ppl_Rational_Box_generalized_affine_image_lhs_rhs(ph, lhs, relsym, rhs)
    ccall((:ppl_Rational_Box_generalized_affine_image_lhs_rhs, libppl_c), Cint, (ppl_Rational_Box_t, ppl_const_Linear_Expression_t, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t), ph, lhs, relsym, rhs)
end

function ppl_Rational_Box_generalized_affine_preimage_lhs_rhs(ph, lhs, relsym, rhs)
    ccall((:ppl_Rational_Box_generalized_affine_preimage_lhs_rhs, libppl_c), Cint, (ppl_Rational_Box_t, ppl_const_Linear_Expression_t, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t), ph, lhs, relsym, rhs)
end

function ppl_Rational_Box_add_space_dimensions_and_embed(ph, d)
    ccall((:ppl_Rational_Box_add_space_dimensions_and_embed, libppl_c), Cint, (ppl_Rational_Box_t, ppl_dimension_type), ph, d)
end

function ppl_Rational_Box_add_space_dimensions_and_project(ph, d)
    ccall((:ppl_Rational_Box_add_space_dimensions_and_project, libppl_c), Cint, (ppl_Rational_Box_t, ppl_dimension_type), ph, d)
end

function ppl_Rational_Box_remove_space_dimensions(ph, ds, n)
    ccall((:ppl_Rational_Box_remove_space_dimensions, libppl_c), Cint, (ppl_Rational_Box_t, Ptr{ppl_dimension_type}, Csize_t), ph, ds, n)
end

function ppl_Rational_Box_remove_higher_space_dimensions(ph, d)
    ccall((:ppl_Rational_Box_remove_higher_space_dimensions, libppl_c), Cint, (ppl_Rational_Box_t, ppl_dimension_type), ph, d)
end

function ppl_Rational_Box_expand_space_dimension(ph, d, m)
    ccall((:ppl_Rational_Box_expand_space_dimension, libppl_c), Cint, (ppl_Rational_Box_t, ppl_dimension_type, ppl_dimension_type), ph, d, m)
end

function ppl_Rational_Box_fold_space_dimensions(ph, ds, n, d)
    ccall((:ppl_Rational_Box_fold_space_dimensions, libppl_c), Cint, (ppl_Rational_Box_t, Ptr{ppl_dimension_type}, Csize_t, ppl_dimension_type), ph, ds, n, d)
end

function ppl_Rational_Box_map_space_dimensions(ph, maps, n)
    ccall((:ppl_Rational_Box_map_space_dimensions, libppl_c), Cint, (ppl_Rational_Box_t, Ptr{ppl_dimension_type}, Csize_t), ph, maps, n)
end

function ppl_Rational_Box_drop_some_non_integer_points(ph, complexity)
    ccall((:ppl_Rational_Box_drop_some_non_integer_points, libppl_c), Cint, (ppl_Rational_Box_t, Cint), ph, complexity)
end

function ppl_Rational_Box_drop_some_non_integer_points_2(ph, ds, n, complexity)
    ccall((:ppl_Rational_Box_drop_some_non_integer_points_2, libppl_c), Cint, (ppl_Rational_Box_t, Ptr{ppl_dimension_type}, Csize_t, Cint), ph, ds, n, complexity)
end

function ppl_Rational_Box_external_memory_in_bytes(ps, sz)
    ccall((:ppl_Rational_Box_external_memory_in_bytes, libppl_c), Cint, (ppl_const_Rational_Box_t, Ptr{Csize_t}), ps, sz)
end

function ppl_Rational_Box_total_memory_in_bytes(ps, sz)
    ccall((:ppl_Rational_Box_total_memory_in_bytes, libppl_c), Cint, (ppl_const_Rational_Box_t, Ptr{Csize_t}), ps, sz)
end

function ppl_Rational_Box_CC76_widening_assign_with_tokens(x, y, tp)
    ccall((:ppl_Rational_Box_CC76_widening_assign_with_tokens, libppl_c), Cint, (ppl_Rational_Box_t, ppl_const_Rational_Box_t, Ptr{Cuint}), x, y, tp)
end

function ppl_Rational_Box_CC76_widening_assign(x, y)
    ccall((:ppl_Rational_Box_CC76_widening_assign, libppl_c), Cint, (ppl_Rational_Box_t, ppl_const_Rational_Box_t), x, y)
end

function ppl_Rational_Box_widening_assign_with_tokens(x, y, tp)
    ccall((:ppl_Rational_Box_widening_assign_with_tokens, libppl_c), Cint, (ppl_Rational_Box_t, ppl_const_Rational_Box_t, Ptr{Cuint}), x, y, tp)
end

function ppl_Rational_Box_widening_assign(x, y)
    ccall((:ppl_Rational_Box_widening_assign, libppl_c), Cint, (ppl_Rational_Box_t, ppl_const_Rational_Box_t), x, y)
end

function ppl_Rational_Box_limited_CC76_extrapolation_assign_with_tokens(x, y, cs, tp)
    ccall((:ppl_Rational_Box_limited_CC76_extrapolation_assign_with_tokens, libppl_c), Cint, (ppl_Rational_Box_t, ppl_const_Rational_Box_t, ppl_const_Constraint_System_t, Ptr{Cuint}), x, y, cs, tp)
end

function ppl_Rational_Box_limited_CC76_extrapolation_assign(x, y, cs)
    ccall((:ppl_Rational_Box_limited_CC76_extrapolation_assign, libppl_c), Cint, (ppl_Rational_Box_t, ppl_const_Rational_Box_t, ppl_const_Constraint_System_t), x, y, cs)
end

function ppl_Rational_Box_CC76_narrowing_assign(x, y)
    ccall((:ppl_Rational_Box_CC76_narrowing_assign, libppl_c), Cint, (ppl_Rational_Box_t, ppl_const_Rational_Box_t), x, y)
end

function ppl_Rational_Box_linear_partition(x, y, p_inters, p_rest)
    ccall((:ppl_Rational_Box_linear_partition, libppl_c), Cint, (ppl_const_Rational_Box_t, ppl_const_Rational_Box_t, Ptr{ppl_Rational_Box_t}, Ptr{ppl_Pointset_Powerset_NNC_Polyhedron_t}), x, y, p_inters, p_rest)
end

function ppl_Rational_Box_wrap_assign(ph, ds, n, w, r, o, pcs, complexity_threshold, wrap_individually)
    ccall((:ppl_Rational_Box_wrap_assign, libppl_c), Cint, (ppl_Rational_Box_t, Ptr{ppl_dimension_type}, Csize_t, ppl_enum_Bounded_Integer_Type_Width, ppl_enum_Bounded_Integer_Type_Representation, ppl_enum_Bounded_Integer_Type_Overflow, Ptr{ppl_const_Constraint_System_t}, Cuint, Cint), ph, ds, n, w, r, o, pcs, complexity_threshold, wrap_individually)
end

function ppl_new_Rational_Box_recycle_Constraint_System(pph, cs)
    ccall((:ppl_new_Rational_Box_recycle_Constraint_System, libppl_c), Cint, (Ptr{ppl_Rational_Box_t}, ppl_Constraint_System_t), pph, cs)
end

function ppl_new_Rational_Box_recycle_Congruence_System(pph, cs)
    ccall((:ppl_new_Rational_Box_recycle_Congruence_System, libppl_c), Cint, (Ptr{ppl_Rational_Box_t}, ppl_Congruence_System_t), pph, cs)
end

function ppl_new_Rational_Box_recycle_Generator_System(pph, cs)
    ccall((:ppl_new_Rational_Box_recycle_Generator_System, libppl_c), Cint, (Ptr{ppl_Rational_Box_t}, ppl_Generator_System_t), pph, cs)
end

function ppl_assign_Rational_Box_from_Rational_Box(dst, src)
    ccall((:ppl_assign_Rational_Box_from_Rational_Box, libppl_c), Cint, (ppl_Rational_Box_t, ppl_const_Rational_Box_t), dst, src)
end

function ppl_Rational_Box_add_recycled_constraints(ph, cs)
    ccall((:ppl_Rational_Box_add_recycled_constraints, libppl_c), Cint, (ppl_Rational_Box_t, ppl_Constraint_System_t), ph, cs)
end

function ppl_Rational_Box_add_recycled_congruences(ph, cs)
    ccall((:ppl_Rational_Box_add_recycled_congruences, libppl_c), Cint, (ppl_Rational_Box_t, ppl_Congruence_System_t), ph, cs)
end

function ppl_termination_test_MS_Rational_Box(pset)
    ccall((:ppl_termination_test_MS_Rational_Box, libppl_c), Cint, (ppl_const_Rational_Box_t,), pset)
end

function ppl_termination_test_PR_Rational_Box(pset)
    ccall((:ppl_termination_test_PR_Rational_Box, libppl_c), Cint, (ppl_const_Rational_Box_t,), pset)
end

function ppl_one_affine_ranking_function_MS_Rational_Box(pset, point)
    ccall((:ppl_one_affine_ranking_function_MS_Rational_Box, libppl_c), Cint, (ppl_const_Rational_Box_t, ppl_Generator_t), pset, point)
end

function ppl_one_affine_ranking_function_PR_Rational_Box(pset, point)
    ccall((:ppl_one_affine_ranking_function_PR_Rational_Box, libppl_c), Cint, (ppl_const_Rational_Box_t, ppl_Generator_t), pset, point)
end

function ppl_all_affine_ranking_functions_MS_Rational_Box(pset, ph)
    ccall((:ppl_all_affine_ranking_functions_MS_Rational_Box, libppl_c), Cint, (ppl_const_Rational_Box_t, ppl_Polyhedron_t), pset, ph)
end

function ppl_all_affine_ranking_functions_PR_Rational_Box(pset, ph)
    ccall((:ppl_all_affine_ranking_functions_PR_Rational_Box, libppl_c), Cint, (ppl_const_Rational_Box_t, ppl_Polyhedron_t), pset, ph)
end

function ppl_termination_test_MS_Rational_Box_2(pset_before, pset_after)
    ccall((:ppl_termination_test_MS_Rational_Box_2, libppl_c), Cint, (ppl_const_Rational_Box_t, ppl_const_Rational_Box_t), pset_before, pset_after)
end

function ppl_termination_test_PR_Rational_Box_2(pset_before, pset_after)
    ccall((:ppl_termination_test_PR_Rational_Box_2, libppl_c), Cint, (ppl_const_Rational_Box_t, ppl_const_Rational_Box_t), pset_before, pset_after)
end

function ppl_one_affine_ranking_function_MS_Rational_Box_2(pset_before, pset_after, point)
    ccall((:ppl_one_affine_ranking_function_MS_Rational_Box_2, libppl_c), Cint, (ppl_const_Rational_Box_t, ppl_const_Rational_Box_t, ppl_Generator_t), pset_before, pset_after, point)
end

function ppl_one_affine_ranking_function_PR_Rational_Box_2(pset_before, pset_after, point)
    ccall((:ppl_one_affine_ranking_function_PR_Rational_Box_2, libppl_c), Cint, (ppl_const_Rational_Box_t, ppl_const_Rational_Box_t, ppl_Generator_t), pset_before, pset_after, point)
end

function ppl_all_affine_ranking_functions_MS_Rational_Box_2(pset_before, pset_after, ph)
    ccall((:ppl_all_affine_ranking_functions_MS_Rational_Box_2, libppl_c), Cint, (ppl_const_Rational_Box_t, ppl_const_Rational_Box_t, ppl_Polyhedron_t), pset_before, pset_after, ph)
end

function ppl_all_affine_ranking_functions_PR_Rational_Box_2(pset_before, pset_after, ph)
    ccall((:ppl_all_affine_ranking_functions_PR_Rational_Box_2, libppl_c), Cint, (ppl_const_Rational_Box_t, ppl_const_Rational_Box_t, ppl_Polyhedron_t), pset_before, pset_after, ph)
end

function ppl_io_print_Rational_Box(x)
    ccall((:ppl_io_print_Rational_Box, libppl_c), Cint, (ppl_const_Rational_Box_t,), x)
end

function ppl_io_fprint_Rational_Box(stream, x)
    ccall((:ppl_io_fprint_Rational_Box, libppl_c), Cint, (Ptr{Libc.FILE}, ppl_const_Rational_Box_t), stream, x)
end

function ppl_io_asprint_Rational_Box(strp, x)
    ccall((:ppl_io_asprint_Rational_Box, libppl_c), Cint, (Ptr{Ptr{Cchar}}, ppl_const_Rational_Box_t), strp, x)
end

function ppl_Rational_Box_ascii_dump(x, stream)
    ccall((:ppl_Rational_Box_ascii_dump, libppl_c), Cint, (ppl_const_Rational_Box_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_Rational_Box_ascii_load(x, stream)
    ccall((:ppl_Rational_Box_ascii_load, libppl_c), Cint, (ppl_Rational_Box_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_delete_BD_Shape_mpz_class(ph)
    ccall((:ppl_delete_BD_Shape_mpz_class, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t,), ph)
end

function ppl_new_BD_Shape_mpz_class_from_space_dimension(pph, d, empty)
    ccall((:ppl_new_BD_Shape_mpz_class_from_space_dimension, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpz_class_t}, ppl_dimension_type, Cint), pph, d, empty)
end

function ppl_new_BD_Shape_mpz_class_from_C_Polyhedron(pph, ph)
    ccall((:ppl_new_BD_Shape_mpz_class_from_C_Polyhedron, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpz_class_t}, ppl_const_Polyhedron_t), pph, ph)
end

function ppl_new_BD_Shape_mpz_class_from_NNC_Polyhedron(pph, ph)
    ccall((:ppl_new_BD_Shape_mpz_class_from_NNC_Polyhedron, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpz_class_t}, ppl_const_Polyhedron_t), pph, ph)
end

function ppl_new_BD_Shape_mpz_class_from_Grid(pph, ph)
    ccall((:ppl_new_BD_Shape_mpz_class_from_Grid, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpz_class_t}, ppl_const_Grid_t), pph, ph)
end

function ppl_new_BD_Shape_mpz_class_from_Rational_Box(pph, ph)
    ccall((:ppl_new_BD_Shape_mpz_class_from_Rational_Box, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpz_class_t}, ppl_const_Rational_Box_t), pph, ph)
end

function ppl_new_BD_Shape_mpz_class_from_BD_Shape_mpz_class(pph, ph)
    ccall((:ppl_new_BD_Shape_mpz_class_from_BD_Shape_mpz_class, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpz_class_t}, ppl_const_BD_Shape_mpz_class_t), pph, ph)
end

function ppl_new_BD_Shape_mpz_class_from_BD_Shape_mpq_class(pph, ph)
    ccall((:ppl_new_BD_Shape_mpz_class_from_BD_Shape_mpq_class, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpz_class_t}, ppl_const_BD_Shape_mpq_class_t), pph, ph)
end

function ppl_new_BD_Shape_mpz_class_from_Octagonal_Shape_mpz_class(pph, ph)
    ccall((:ppl_new_BD_Shape_mpz_class_from_Octagonal_Shape_mpz_class, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpz_class_t}, ppl_const_Octagonal_Shape_mpz_class_t), pph, ph)
end

function ppl_new_BD_Shape_mpz_class_from_Octagonal_Shape_mpq_class(pph, ph)
    ccall((:ppl_new_BD_Shape_mpz_class_from_Octagonal_Shape_mpq_class, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpz_class_t}, ppl_const_Octagonal_Shape_mpq_class_t), pph, ph)
end

function ppl_new_BD_Shape_mpz_class_from_C_Polyhedron_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_BD_Shape_mpz_class_from_C_Polyhedron_with_complexity, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpz_class_t}, ppl_const_Polyhedron_t, Cint), pph, ph, complexity)
end

function ppl_new_BD_Shape_mpz_class_from_NNC_Polyhedron_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_BD_Shape_mpz_class_from_NNC_Polyhedron_with_complexity, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpz_class_t}, ppl_const_Polyhedron_t, Cint), pph, ph, complexity)
end

function ppl_new_BD_Shape_mpz_class_from_Grid_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_BD_Shape_mpz_class_from_Grid_with_complexity, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpz_class_t}, ppl_const_Grid_t, Cint), pph, ph, complexity)
end

function ppl_new_BD_Shape_mpz_class_from_Rational_Box_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_BD_Shape_mpz_class_from_Rational_Box_with_complexity, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpz_class_t}, ppl_const_Rational_Box_t, Cint), pph, ph, complexity)
end

function ppl_new_BD_Shape_mpz_class_from_BD_Shape_mpz_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_BD_Shape_mpz_class_from_BD_Shape_mpz_class_with_complexity, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpz_class_t}, ppl_const_BD_Shape_mpz_class_t, Cint), pph, ph, complexity)
end

function ppl_new_BD_Shape_mpz_class_from_BD_Shape_mpq_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_BD_Shape_mpz_class_from_BD_Shape_mpq_class_with_complexity, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpz_class_t}, ppl_const_BD_Shape_mpq_class_t, Cint), pph, ph, complexity)
end

function ppl_new_BD_Shape_mpz_class_from_Octagonal_Shape_mpz_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_BD_Shape_mpz_class_from_Octagonal_Shape_mpz_class_with_complexity, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpz_class_t}, ppl_const_Octagonal_Shape_mpz_class_t, Cint), pph, ph, complexity)
end

function ppl_new_BD_Shape_mpz_class_from_Octagonal_Shape_mpq_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_BD_Shape_mpz_class_from_Octagonal_Shape_mpq_class_with_complexity, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpz_class_t}, ppl_const_Octagonal_Shape_mpq_class_t, Cint), pph, ph, complexity)
end

function ppl_new_BD_Shape_mpz_class_from_Constraint_System(pph, cs)
    ccall((:ppl_new_BD_Shape_mpz_class_from_Constraint_System, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpz_class_t}, ppl_const_Constraint_System_t), pph, cs)
end

function ppl_new_BD_Shape_mpz_class_from_Congruence_System(pph, cs)
    ccall((:ppl_new_BD_Shape_mpz_class_from_Congruence_System, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpz_class_t}, ppl_const_Congruence_System_t), pph, cs)
end

function ppl_new_BD_Shape_mpz_class_from_Generator_System(pph, cs)
    ccall((:ppl_new_BD_Shape_mpz_class_from_Generator_System, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpz_class_t}, ppl_const_Generator_System_t), pph, cs)
end

function ppl_BD_Shape_mpz_class_space_dimension(ph, m)
    ccall((:ppl_BD_Shape_mpz_class_space_dimension, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, Ptr{ppl_dimension_type}), ph, m)
end

function ppl_BD_Shape_mpz_class_affine_dimension(ph, m)
    ccall((:ppl_BD_Shape_mpz_class_affine_dimension, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, Ptr{ppl_dimension_type}), ph, m)
end

function ppl_BD_Shape_mpz_class_relation_with_Constraint(ph, c)
    ccall((:ppl_BD_Shape_mpz_class_relation_with_Constraint, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, ppl_const_Constraint_t), ph, c)
end

function ppl_BD_Shape_mpz_class_relation_with_Generator(ph, c)
    ccall((:ppl_BD_Shape_mpz_class_relation_with_Generator, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, ppl_const_Generator_t), ph, c)
end

function ppl_BD_Shape_mpz_class_relation_with_Congruence(ph, c)
    ccall((:ppl_BD_Shape_mpz_class_relation_with_Congruence, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, ppl_const_Congruence_t), ph, c)
end

function ppl_BD_Shape_mpz_class_get_constraints(ph, pcs)
    ccall((:ppl_BD_Shape_mpz_class_get_constraints, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, Ptr{ppl_const_Constraint_System_t}), ph, pcs)
end

function ppl_BD_Shape_mpz_class_get_congruences(ph, pcs)
    ccall((:ppl_BD_Shape_mpz_class_get_congruences, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, Ptr{ppl_const_Congruence_System_t}), ph, pcs)
end

function ppl_BD_Shape_mpz_class_get_minimized_constraints(ph, pcs)
    ccall((:ppl_BD_Shape_mpz_class_get_minimized_constraints, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, Ptr{ppl_const_Constraint_System_t}), ph, pcs)
end

function ppl_BD_Shape_mpz_class_get_minimized_congruences(ph, pcs)
    ccall((:ppl_BD_Shape_mpz_class_get_minimized_congruences, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, Ptr{ppl_const_Congruence_System_t}), ph, pcs)
end

function ppl_BD_Shape_mpz_class_is_empty(ph)
    ccall((:ppl_BD_Shape_mpz_class_is_empty, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t,), ph)
end

function ppl_BD_Shape_mpz_class_is_universe(ph)
    ccall((:ppl_BD_Shape_mpz_class_is_universe, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t,), ph)
end

function ppl_BD_Shape_mpz_class_is_bounded(ph)
    ccall((:ppl_BD_Shape_mpz_class_is_bounded, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t,), ph)
end

function ppl_BD_Shape_mpz_class_contains_integer_point(ph)
    ccall((:ppl_BD_Shape_mpz_class_contains_integer_point, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t,), ph)
end

function ppl_BD_Shape_mpz_class_is_topologically_closed(ph)
    ccall((:ppl_BD_Shape_mpz_class_is_topologically_closed, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t,), ph)
end

function ppl_BD_Shape_mpz_class_is_discrete(ph)
    ccall((:ppl_BD_Shape_mpz_class_is_discrete, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t,), ph)
end

function ppl_BD_Shape_mpz_class_topological_closure_assign(ph)
    ccall((:ppl_BD_Shape_mpz_class_topological_closure_assign, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t,), ph)
end

function ppl_BD_Shape_mpz_class_bounds_from_above(ph, le)
    ccall((:ppl_BD_Shape_mpz_class_bounds_from_above, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, ppl_const_Linear_Expression_t), ph, le)
end

function ppl_BD_Shape_mpz_class_bounds_from_below(ph, le)
    ccall((:ppl_BD_Shape_mpz_class_bounds_from_below, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, ppl_const_Linear_Expression_t), ph, le)
end

function ppl_BD_Shape_mpz_class_maximize(ph, le, ext_n, ext_d, poptimum)
    ccall((:ppl_BD_Shape_mpz_class_maximize, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}), ph, le, ext_n, ext_d, poptimum)
end

function ppl_BD_Shape_mpz_class_minimize(ph, le, ext_n, ext_d, poptimum)
    ccall((:ppl_BD_Shape_mpz_class_minimize, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}), ph, le, ext_n, ext_d, poptimum)
end

function ppl_BD_Shape_mpz_class_maximize_with_point(ph, le, ext_n, ext_d, poptimum, point)
    ccall((:ppl_BD_Shape_mpz_class_maximize_with_point, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}, ppl_Generator_t), ph, le, ext_n, ext_d, poptimum, point)
end

function ppl_BD_Shape_mpz_class_minimize_with_point(ph, le, ext_n, ext_d, poptimum, point)
    ccall((:ppl_BD_Shape_mpz_class_minimize_with_point, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}, ppl_Generator_t), ph, le, ext_n, ext_d, poptimum, point)
end

function ppl_BD_Shape_mpz_class_frequency(ph, le, ext_fn, ext_fd, ext_vn, ext_vd)
    ccall((:ppl_BD_Shape_mpz_class_frequency, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, ppl_Coefficient_t, ppl_Coefficient_t), ph, le, ext_fn, ext_fd, ext_vn, ext_vd)
end

function ppl_BD_Shape_mpz_class_contains_BD_Shape_mpz_class(x, y)
    ccall((:ppl_BD_Shape_mpz_class_contains_BD_Shape_mpz_class, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t), x, y)
end

function ppl_BD_Shape_mpz_class_strictly_contains_BD_Shape_mpz_class(x, y)
    ccall((:ppl_BD_Shape_mpz_class_strictly_contains_BD_Shape_mpz_class, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t), x, y)
end

function ppl_BD_Shape_mpz_class_is_disjoint_from_BD_Shape_mpz_class(x, y)
    ccall((:ppl_BD_Shape_mpz_class_is_disjoint_from_BD_Shape_mpz_class, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t), x, y)
end

function ppl_BD_Shape_mpz_class_equals_BD_Shape_mpz_class(x, y)
    ccall((:ppl_BD_Shape_mpz_class_equals_BD_Shape_mpz_class, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t), x, y)
end

function ppl_BD_Shape_mpz_class_OK(ph)
    ccall((:ppl_BD_Shape_mpz_class_OK, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t,), ph)
end

function ppl_BD_Shape_mpz_class_add_constraint(ph, c)
    ccall((:ppl_BD_Shape_mpz_class_add_constraint, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_Constraint_t), ph, c)
end

function ppl_BD_Shape_mpz_class_add_congruence(ph, c)
    ccall((:ppl_BD_Shape_mpz_class_add_congruence, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_Congruence_t), ph, c)
end

function ppl_BD_Shape_mpz_class_add_constraints(ph, cs)
    ccall((:ppl_BD_Shape_mpz_class_add_constraints, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_Constraint_System_t), ph, cs)
end

function ppl_BD_Shape_mpz_class_add_congruences(ph, cs)
    ccall((:ppl_BD_Shape_mpz_class_add_congruences, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_Congruence_System_t), ph, cs)
end

function ppl_BD_Shape_mpz_class_refine_with_constraint(ph, c)
    ccall((:ppl_BD_Shape_mpz_class_refine_with_constraint, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_Constraint_t), ph, c)
end

function ppl_BD_Shape_mpz_class_refine_with_congruence(ph, c)
    ccall((:ppl_BD_Shape_mpz_class_refine_with_congruence, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_Congruence_t), ph, c)
end

function ppl_BD_Shape_mpz_class_refine_with_constraints(ph, cs)
    ccall((:ppl_BD_Shape_mpz_class_refine_with_constraints, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_Constraint_System_t), ph, cs)
end

function ppl_BD_Shape_mpz_class_refine_with_congruences(ph, cs)
    ccall((:ppl_BD_Shape_mpz_class_refine_with_congruences, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_Congruence_System_t), ph, cs)
end

function ppl_BD_Shape_mpz_class_intersection_assign(x, y)
    ccall((:ppl_BD_Shape_mpz_class_intersection_assign, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t), x, y)
end

function ppl_BD_Shape_mpz_class_upper_bound_assign(x, y)
    ccall((:ppl_BD_Shape_mpz_class_upper_bound_assign, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t), x, y)
end

function ppl_BD_Shape_mpz_class_difference_assign(x, y)
    ccall((:ppl_BD_Shape_mpz_class_difference_assign, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t), x, y)
end

function ppl_BD_Shape_mpz_class_concatenate_assign(x, y)
    ccall((:ppl_BD_Shape_mpz_class_concatenate_assign, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t), x, y)
end

function ppl_BD_Shape_mpz_class_time_elapse_assign(x, y)
    ccall((:ppl_BD_Shape_mpz_class_time_elapse_assign, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t), x, y)
end

function ppl_BD_Shape_mpz_class_upper_bound_assign_if_exact(x, y)
    ccall((:ppl_BD_Shape_mpz_class_upper_bound_assign_if_exact, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t), x, y)
end

function ppl_BD_Shape_mpz_class_simplify_using_context_assign(x, y)
    ccall((:ppl_BD_Shape_mpz_class_simplify_using_context_assign, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t), x, y)
end

function ppl_BD_Shape_mpz_class_constrains(ph, var)
    ccall((:ppl_BD_Shape_mpz_class_constrains, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_dimension_type), ph, var)
end

function ppl_BD_Shape_mpz_class_unconstrain_space_dimension(ph, var)
    ccall((:ppl_BD_Shape_mpz_class_unconstrain_space_dimension, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_dimension_type), ph, var)
end

function ppl_BD_Shape_mpz_class_unconstrain_space_dimensions(ph, ds, n)
    ccall((:ppl_BD_Shape_mpz_class_unconstrain_space_dimensions, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, Ptr{ppl_dimension_type}, Csize_t), ph, ds, n)
end

function ppl_BD_Shape_mpz_class_affine_image(ph, var, le, d)
    ccall((:ppl_BD_Shape_mpz_class_affine_image, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, le, d)
end

function ppl_BD_Shape_mpz_class_affine_preimage(ph, var, le, d)
    ccall((:ppl_BD_Shape_mpz_class_affine_preimage, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, le, d)
end

function ppl_BD_Shape_mpz_class_bounded_affine_image(ph, var, lb, ub, d)
    ccall((:ppl_BD_Shape_mpz_class_bounded_affine_image, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, lb, ub, d)
end

function ppl_BD_Shape_mpz_class_bounded_affine_preimage(ph, var, lb, ub, d)
    ccall((:ppl_BD_Shape_mpz_class_bounded_affine_preimage, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, lb, ub, d)
end

function ppl_BD_Shape_mpz_class_generalized_affine_image(ph, var, relsym, le, d)
    ccall((:ppl_BD_Shape_mpz_class_generalized_affine_image, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_dimension_type, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, relsym, le, d)
end

function ppl_BD_Shape_mpz_class_generalized_affine_preimage(ph, var, relsym, le, d)
    ccall((:ppl_BD_Shape_mpz_class_generalized_affine_preimage, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_dimension_type, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, relsym, le, d)
end

function ppl_BD_Shape_mpz_class_generalized_affine_image_lhs_rhs(ph, lhs, relsym, rhs)
    ccall((:ppl_BD_Shape_mpz_class_generalized_affine_image_lhs_rhs, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_Linear_Expression_t, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t), ph, lhs, relsym, rhs)
end

function ppl_BD_Shape_mpz_class_generalized_affine_preimage_lhs_rhs(ph, lhs, relsym, rhs)
    ccall((:ppl_BD_Shape_mpz_class_generalized_affine_preimage_lhs_rhs, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_Linear_Expression_t, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t), ph, lhs, relsym, rhs)
end

function ppl_BD_Shape_mpz_class_add_space_dimensions_and_embed(ph, d)
    ccall((:ppl_BD_Shape_mpz_class_add_space_dimensions_and_embed, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_dimension_type), ph, d)
end

function ppl_BD_Shape_mpz_class_add_space_dimensions_and_project(ph, d)
    ccall((:ppl_BD_Shape_mpz_class_add_space_dimensions_and_project, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_dimension_type), ph, d)
end

function ppl_BD_Shape_mpz_class_remove_space_dimensions(ph, ds, n)
    ccall((:ppl_BD_Shape_mpz_class_remove_space_dimensions, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, Ptr{ppl_dimension_type}, Csize_t), ph, ds, n)
end

function ppl_BD_Shape_mpz_class_remove_higher_space_dimensions(ph, d)
    ccall((:ppl_BD_Shape_mpz_class_remove_higher_space_dimensions, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_dimension_type), ph, d)
end

function ppl_BD_Shape_mpz_class_expand_space_dimension(ph, d, m)
    ccall((:ppl_BD_Shape_mpz_class_expand_space_dimension, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_dimension_type, ppl_dimension_type), ph, d, m)
end

function ppl_BD_Shape_mpz_class_fold_space_dimensions(ph, ds, n, d)
    ccall((:ppl_BD_Shape_mpz_class_fold_space_dimensions, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, Ptr{ppl_dimension_type}, Csize_t, ppl_dimension_type), ph, ds, n, d)
end

function ppl_BD_Shape_mpz_class_map_space_dimensions(ph, maps, n)
    ccall((:ppl_BD_Shape_mpz_class_map_space_dimensions, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, Ptr{ppl_dimension_type}, Csize_t), ph, maps, n)
end

function ppl_BD_Shape_mpz_class_drop_some_non_integer_points(ph, complexity)
    ccall((:ppl_BD_Shape_mpz_class_drop_some_non_integer_points, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, Cint), ph, complexity)
end

function ppl_BD_Shape_mpz_class_drop_some_non_integer_points_2(ph, ds, n, complexity)
    ccall((:ppl_BD_Shape_mpz_class_drop_some_non_integer_points_2, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, Ptr{ppl_dimension_type}, Csize_t, Cint), ph, ds, n, complexity)
end

function ppl_BD_Shape_mpz_class_external_memory_in_bytes(ps, sz)
    ccall((:ppl_BD_Shape_mpz_class_external_memory_in_bytes, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, Ptr{Csize_t}), ps, sz)
end

function ppl_BD_Shape_mpz_class_total_memory_in_bytes(ps, sz)
    ccall((:ppl_BD_Shape_mpz_class_total_memory_in_bytes, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, Ptr{Csize_t}), ps, sz)
end

function ppl_BD_Shape_mpz_class_BHMZ05_widening_assign_with_tokens(x, y, tp)
    ccall((:ppl_BD_Shape_mpz_class_BHMZ05_widening_assign_with_tokens, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t, Ptr{Cuint}), x, y, tp)
end

function ppl_BD_Shape_mpz_class_H79_widening_assign_with_tokens(x, y, tp)
    ccall((:ppl_BD_Shape_mpz_class_H79_widening_assign_with_tokens, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t, Ptr{Cuint}), x, y, tp)
end

function ppl_BD_Shape_mpz_class_BHMZ05_widening_assign(x, y)
    ccall((:ppl_BD_Shape_mpz_class_BHMZ05_widening_assign, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t), x, y)
end

function ppl_BD_Shape_mpz_class_H79_widening_assign(x, y)
    ccall((:ppl_BD_Shape_mpz_class_H79_widening_assign, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t), x, y)
end

function ppl_BD_Shape_mpz_class_widening_assign_with_tokens(x, y, tp)
    ccall((:ppl_BD_Shape_mpz_class_widening_assign_with_tokens, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t, Ptr{Cuint}), x, y, tp)
end

function ppl_BD_Shape_mpz_class_widening_assign(x, y)
    ccall((:ppl_BD_Shape_mpz_class_widening_assign, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t), x, y)
end

function ppl_BD_Shape_mpz_class_limited_BHMZ05_extrapolation_assign_with_tokens(x, y, cs, tp)
    ccall((:ppl_BD_Shape_mpz_class_limited_BHMZ05_extrapolation_assign_with_tokens, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t, ppl_const_Constraint_System_t, Ptr{Cuint}), x, y, cs, tp)
end

function ppl_BD_Shape_mpz_class_limited_H79_extrapolation_assign_with_tokens(x, y, cs, tp)
    ccall((:ppl_BD_Shape_mpz_class_limited_H79_extrapolation_assign_with_tokens, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t, ppl_const_Constraint_System_t, Ptr{Cuint}), x, y, cs, tp)
end

function ppl_BD_Shape_mpz_class_limited_CC76_extrapolation_assign_with_tokens(x, y, cs, tp)
    ccall((:ppl_BD_Shape_mpz_class_limited_CC76_extrapolation_assign_with_tokens, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t, ppl_const_Constraint_System_t, Ptr{Cuint}), x, y, cs, tp)
end

function ppl_BD_Shape_mpz_class_limited_BHMZ05_extrapolation_assign(x, y, cs)
    ccall((:ppl_BD_Shape_mpz_class_limited_BHMZ05_extrapolation_assign, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t, ppl_const_Constraint_System_t), x, y, cs)
end

function ppl_BD_Shape_mpz_class_limited_H79_extrapolation_assign(x, y, cs)
    ccall((:ppl_BD_Shape_mpz_class_limited_H79_extrapolation_assign, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t, ppl_const_Constraint_System_t), x, y, cs)
end

function ppl_BD_Shape_mpz_class_limited_CC76_extrapolation_assign(x, y, cs)
    ccall((:ppl_BD_Shape_mpz_class_limited_CC76_extrapolation_assign, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t, ppl_const_Constraint_System_t), x, y, cs)
end

function ppl_BD_Shape_mpz_class_CC76_extrapolation_assign_with_tokens(x, y, tp)
    ccall((:ppl_BD_Shape_mpz_class_CC76_extrapolation_assign_with_tokens, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t, Ptr{Cuint}), x, y, tp)
end

function ppl_BD_Shape_mpz_class_CC76_extrapolation_assign(x, y)
    ccall((:ppl_BD_Shape_mpz_class_CC76_extrapolation_assign, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t), x, y)
end

function ppl_BD_Shape_mpz_class_CC76_narrowing_assign(x, y)
    ccall((:ppl_BD_Shape_mpz_class_CC76_narrowing_assign, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t), x, y)
end

function ppl_BD_Shape_mpz_class_linear_partition(x, y, p_inters, p_rest)
    ccall((:ppl_BD_Shape_mpz_class_linear_partition, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t, Ptr{ppl_BD_Shape_mpz_class_t}, Ptr{ppl_Pointset_Powerset_NNC_Polyhedron_t}), x, y, p_inters, p_rest)
end

function ppl_BD_Shape_mpz_class_wrap_assign(ph, ds, n, w, r, o, pcs, complexity_threshold, wrap_individually)
    ccall((:ppl_BD_Shape_mpz_class_wrap_assign, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, Ptr{ppl_dimension_type}, Csize_t, ppl_enum_Bounded_Integer_Type_Width, ppl_enum_Bounded_Integer_Type_Representation, ppl_enum_Bounded_Integer_Type_Overflow, Ptr{ppl_const_Constraint_System_t}, Cuint, Cint), ph, ds, n, w, r, o, pcs, complexity_threshold, wrap_individually)
end

function ppl_new_BD_Shape_mpz_class_recycle_Constraint_System(pph, cs)
    ccall((:ppl_new_BD_Shape_mpz_class_recycle_Constraint_System, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpz_class_t}, ppl_Constraint_System_t), pph, cs)
end

function ppl_new_BD_Shape_mpz_class_recycle_Congruence_System(pph, cs)
    ccall((:ppl_new_BD_Shape_mpz_class_recycle_Congruence_System, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpz_class_t}, ppl_Congruence_System_t), pph, cs)
end

function ppl_new_BD_Shape_mpz_class_recycle_Generator_System(pph, cs)
    ccall((:ppl_new_BD_Shape_mpz_class_recycle_Generator_System, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpz_class_t}, ppl_Generator_System_t), pph, cs)
end

function ppl_assign_BD_Shape_mpz_class_from_BD_Shape_mpz_class(dst, src)
    ccall((:ppl_assign_BD_Shape_mpz_class_from_BD_Shape_mpz_class, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t), dst, src)
end

function ppl_BD_Shape_mpz_class_add_recycled_constraints(ph, cs)
    ccall((:ppl_BD_Shape_mpz_class_add_recycled_constraints, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_Constraint_System_t), ph, cs)
end

function ppl_BD_Shape_mpz_class_add_recycled_congruences(ph, cs)
    ccall((:ppl_BD_Shape_mpz_class_add_recycled_congruences, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, ppl_Congruence_System_t), ph, cs)
end

function ppl_termination_test_MS_BD_Shape_mpz_class(pset)
    ccall((:ppl_termination_test_MS_BD_Shape_mpz_class, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t,), pset)
end

function ppl_termination_test_PR_BD_Shape_mpz_class(pset)
    ccall((:ppl_termination_test_PR_BD_Shape_mpz_class, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t,), pset)
end

function ppl_one_affine_ranking_function_MS_BD_Shape_mpz_class(pset, point)
    ccall((:ppl_one_affine_ranking_function_MS_BD_Shape_mpz_class, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, ppl_Generator_t), pset, point)
end

function ppl_one_affine_ranking_function_PR_BD_Shape_mpz_class(pset, point)
    ccall((:ppl_one_affine_ranking_function_PR_BD_Shape_mpz_class, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, ppl_Generator_t), pset, point)
end

function ppl_all_affine_ranking_functions_MS_BD_Shape_mpz_class(pset, ph)
    ccall((:ppl_all_affine_ranking_functions_MS_BD_Shape_mpz_class, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, ppl_Polyhedron_t), pset, ph)
end

function ppl_all_affine_ranking_functions_PR_BD_Shape_mpz_class(pset, ph)
    ccall((:ppl_all_affine_ranking_functions_PR_BD_Shape_mpz_class, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, ppl_Polyhedron_t), pset, ph)
end

function ppl_termination_test_MS_BD_Shape_mpz_class_2(pset_before, pset_after)
    ccall((:ppl_termination_test_MS_BD_Shape_mpz_class_2, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t), pset_before, pset_after)
end

function ppl_termination_test_PR_BD_Shape_mpz_class_2(pset_before, pset_after)
    ccall((:ppl_termination_test_PR_BD_Shape_mpz_class_2, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t), pset_before, pset_after)
end

function ppl_one_affine_ranking_function_MS_BD_Shape_mpz_class_2(pset_before, pset_after, point)
    ccall((:ppl_one_affine_ranking_function_MS_BD_Shape_mpz_class_2, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t, ppl_Generator_t), pset_before, pset_after, point)
end

function ppl_one_affine_ranking_function_PR_BD_Shape_mpz_class_2(pset_before, pset_after, point)
    ccall((:ppl_one_affine_ranking_function_PR_BD_Shape_mpz_class_2, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t, ppl_Generator_t), pset_before, pset_after, point)
end

function ppl_all_affine_ranking_functions_MS_BD_Shape_mpz_class_2(pset_before, pset_after, ph)
    ccall((:ppl_all_affine_ranking_functions_MS_BD_Shape_mpz_class_2, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t, ppl_Polyhedron_t), pset_before, pset_after, ph)
end

function ppl_all_affine_ranking_functions_PR_BD_Shape_mpz_class_2(pset_before, pset_after, ph)
    ccall((:ppl_all_affine_ranking_functions_PR_BD_Shape_mpz_class_2, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, ppl_const_BD_Shape_mpz_class_t, ppl_Polyhedron_t), pset_before, pset_after, ph)
end

function ppl_io_print_BD_Shape_mpz_class(x)
    ccall((:ppl_io_print_BD_Shape_mpz_class, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t,), x)
end

function ppl_io_fprint_BD_Shape_mpz_class(stream, x)
    ccall((:ppl_io_fprint_BD_Shape_mpz_class, libppl_c), Cint, (Ptr{Libc.FILE}, ppl_const_BD_Shape_mpz_class_t), stream, x)
end

function ppl_io_asprint_BD_Shape_mpz_class(strp, x)
    ccall((:ppl_io_asprint_BD_Shape_mpz_class, libppl_c), Cint, (Ptr{Ptr{Cchar}}, ppl_const_BD_Shape_mpz_class_t), strp, x)
end

function ppl_BD_Shape_mpz_class_ascii_dump(x, stream)
    ccall((:ppl_BD_Shape_mpz_class_ascii_dump, libppl_c), Cint, (ppl_const_BD_Shape_mpz_class_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_BD_Shape_mpz_class_ascii_load(x, stream)
    ccall((:ppl_BD_Shape_mpz_class_ascii_load, libppl_c), Cint, (ppl_BD_Shape_mpz_class_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_delete_BD_Shape_mpq_class(ph)
    ccall((:ppl_delete_BD_Shape_mpq_class, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t,), ph)
end

function ppl_new_BD_Shape_mpq_class_from_space_dimension(pph, d, empty)
    ccall((:ppl_new_BD_Shape_mpq_class_from_space_dimension, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpq_class_t}, ppl_dimension_type, Cint), pph, d, empty)
end

function ppl_new_BD_Shape_mpq_class_from_C_Polyhedron(pph, ph)
    ccall((:ppl_new_BD_Shape_mpq_class_from_C_Polyhedron, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpq_class_t}, ppl_const_Polyhedron_t), pph, ph)
end

function ppl_new_BD_Shape_mpq_class_from_NNC_Polyhedron(pph, ph)
    ccall((:ppl_new_BD_Shape_mpq_class_from_NNC_Polyhedron, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpq_class_t}, ppl_const_Polyhedron_t), pph, ph)
end

function ppl_new_BD_Shape_mpq_class_from_Grid(pph, ph)
    ccall((:ppl_new_BD_Shape_mpq_class_from_Grid, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpq_class_t}, ppl_const_Grid_t), pph, ph)
end

function ppl_new_BD_Shape_mpq_class_from_Rational_Box(pph, ph)
    ccall((:ppl_new_BD_Shape_mpq_class_from_Rational_Box, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpq_class_t}, ppl_const_Rational_Box_t), pph, ph)
end

function ppl_new_BD_Shape_mpq_class_from_BD_Shape_mpz_class(pph, ph)
    ccall((:ppl_new_BD_Shape_mpq_class_from_BD_Shape_mpz_class, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpq_class_t}, ppl_const_BD_Shape_mpz_class_t), pph, ph)
end

function ppl_new_BD_Shape_mpq_class_from_BD_Shape_mpq_class(pph, ph)
    ccall((:ppl_new_BD_Shape_mpq_class_from_BD_Shape_mpq_class, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpq_class_t}, ppl_const_BD_Shape_mpq_class_t), pph, ph)
end

function ppl_new_BD_Shape_mpq_class_from_Octagonal_Shape_mpz_class(pph, ph)
    ccall((:ppl_new_BD_Shape_mpq_class_from_Octagonal_Shape_mpz_class, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpq_class_t}, ppl_const_Octagonal_Shape_mpz_class_t), pph, ph)
end

function ppl_new_BD_Shape_mpq_class_from_Octagonal_Shape_mpq_class(pph, ph)
    ccall((:ppl_new_BD_Shape_mpq_class_from_Octagonal_Shape_mpq_class, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpq_class_t}, ppl_const_Octagonal_Shape_mpq_class_t), pph, ph)
end

function ppl_new_BD_Shape_mpq_class_from_C_Polyhedron_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_BD_Shape_mpq_class_from_C_Polyhedron_with_complexity, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpq_class_t}, ppl_const_Polyhedron_t, Cint), pph, ph, complexity)
end

function ppl_new_BD_Shape_mpq_class_from_NNC_Polyhedron_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_BD_Shape_mpq_class_from_NNC_Polyhedron_with_complexity, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpq_class_t}, ppl_const_Polyhedron_t, Cint), pph, ph, complexity)
end

function ppl_new_BD_Shape_mpq_class_from_Grid_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_BD_Shape_mpq_class_from_Grid_with_complexity, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpq_class_t}, ppl_const_Grid_t, Cint), pph, ph, complexity)
end

function ppl_new_BD_Shape_mpq_class_from_Rational_Box_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_BD_Shape_mpq_class_from_Rational_Box_with_complexity, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpq_class_t}, ppl_const_Rational_Box_t, Cint), pph, ph, complexity)
end

function ppl_new_BD_Shape_mpq_class_from_BD_Shape_mpz_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_BD_Shape_mpq_class_from_BD_Shape_mpz_class_with_complexity, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpq_class_t}, ppl_const_BD_Shape_mpz_class_t, Cint), pph, ph, complexity)
end

function ppl_new_BD_Shape_mpq_class_from_BD_Shape_mpq_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_BD_Shape_mpq_class_from_BD_Shape_mpq_class_with_complexity, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpq_class_t}, ppl_const_BD_Shape_mpq_class_t, Cint), pph, ph, complexity)
end

function ppl_new_BD_Shape_mpq_class_from_Octagonal_Shape_mpz_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_BD_Shape_mpq_class_from_Octagonal_Shape_mpz_class_with_complexity, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpq_class_t}, ppl_const_Octagonal_Shape_mpz_class_t, Cint), pph, ph, complexity)
end

function ppl_new_BD_Shape_mpq_class_from_Octagonal_Shape_mpq_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_BD_Shape_mpq_class_from_Octagonal_Shape_mpq_class_with_complexity, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpq_class_t}, ppl_const_Octagonal_Shape_mpq_class_t, Cint), pph, ph, complexity)
end

function ppl_new_BD_Shape_mpq_class_from_Constraint_System(pph, cs)
    ccall((:ppl_new_BD_Shape_mpq_class_from_Constraint_System, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpq_class_t}, ppl_const_Constraint_System_t), pph, cs)
end

function ppl_new_BD_Shape_mpq_class_from_Congruence_System(pph, cs)
    ccall((:ppl_new_BD_Shape_mpq_class_from_Congruence_System, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpq_class_t}, ppl_const_Congruence_System_t), pph, cs)
end

function ppl_new_BD_Shape_mpq_class_from_Generator_System(pph, cs)
    ccall((:ppl_new_BD_Shape_mpq_class_from_Generator_System, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpq_class_t}, ppl_const_Generator_System_t), pph, cs)
end

function ppl_BD_Shape_mpq_class_space_dimension(ph, m)
    ccall((:ppl_BD_Shape_mpq_class_space_dimension, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, Ptr{ppl_dimension_type}), ph, m)
end

function ppl_BD_Shape_mpq_class_affine_dimension(ph, m)
    ccall((:ppl_BD_Shape_mpq_class_affine_dimension, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, Ptr{ppl_dimension_type}), ph, m)
end

function ppl_BD_Shape_mpq_class_relation_with_Constraint(ph, c)
    ccall((:ppl_BD_Shape_mpq_class_relation_with_Constraint, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, ppl_const_Constraint_t), ph, c)
end

function ppl_BD_Shape_mpq_class_relation_with_Generator(ph, c)
    ccall((:ppl_BD_Shape_mpq_class_relation_with_Generator, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, ppl_const_Generator_t), ph, c)
end

function ppl_BD_Shape_mpq_class_relation_with_Congruence(ph, c)
    ccall((:ppl_BD_Shape_mpq_class_relation_with_Congruence, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, ppl_const_Congruence_t), ph, c)
end

function ppl_BD_Shape_mpq_class_get_constraints(ph, pcs)
    ccall((:ppl_BD_Shape_mpq_class_get_constraints, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, Ptr{ppl_const_Constraint_System_t}), ph, pcs)
end

function ppl_BD_Shape_mpq_class_get_congruences(ph, pcs)
    ccall((:ppl_BD_Shape_mpq_class_get_congruences, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, Ptr{ppl_const_Congruence_System_t}), ph, pcs)
end

function ppl_BD_Shape_mpq_class_get_minimized_constraints(ph, pcs)
    ccall((:ppl_BD_Shape_mpq_class_get_minimized_constraints, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, Ptr{ppl_const_Constraint_System_t}), ph, pcs)
end

function ppl_BD_Shape_mpq_class_get_minimized_congruences(ph, pcs)
    ccall((:ppl_BD_Shape_mpq_class_get_minimized_congruences, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, Ptr{ppl_const_Congruence_System_t}), ph, pcs)
end

function ppl_BD_Shape_mpq_class_is_empty(ph)
    ccall((:ppl_BD_Shape_mpq_class_is_empty, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t,), ph)
end

function ppl_BD_Shape_mpq_class_is_universe(ph)
    ccall((:ppl_BD_Shape_mpq_class_is_universe, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t,), ph)
end

function ppl_BD_Shape_mpq_class_is_bounded(ph)
    ccall((:ppl_BD_Shape_mpq_class_is_bounded, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t,), ph)
end

function ppl_BD_Shape_mpq_class_contains_integer_point(ph)
    ccall((:ppl_BD_Shape_mpq_class_contains_integer_point, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t,), ph)
end

function ppl_BD_Shape_mpq_class_is_topologically_closed(ph)
    ccall((:ppl_BD_Shape_mpq_class_is_topologically_closed, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t,), ph)
end

function ppl_BD_Shape_mpq_class_is_discrete(ph)
    ccall((:ppl_BD_Shape_mpq_class_is_discrete, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t,), ph)
end

function ppl_BD_Shape_mpq_class_topological_closure_assign(ph)
    ccall((:ppl_BD_Shape_mpq_class_topological_closure_assign, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t,), ph)
end

function ppl_BD_Shape_mpq_class_bounds_from_above(ph, le)
    ccall((:ppl_BD_Shape_mpq_class_bounds_from_above, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, ppl_const_Linear_Expression_t), ph, le)
end

function ppl_BD_Shape_mpq_class_bounds_from_below(ph, le)
    ccall((:ppl_BD_Shape_mpq_class_bounds_from_below, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, ppl_const_Linear_Expression_t), ph, le)
end

function ppl_BD_Shape_mpq_class_maximize(ph, le, ext_n, ext_d, poptimum)
    ccall((:ppl_BD_Shape_mpq_class_maximize, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}), ph, le, ext_n, ext_d, poptimum)
end

function ppl_BD_Shape_mpq_class_minimize(ph, le, ext_n, ext_d, poptimum)
    ccall((:ppl_BD_Shape_mpq_class_minimize, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}), ph, le, ext_n, ext_d, poptimum)
end

function ppl_BD_Shape_mpq_class_maximize_with_point(ph, le, ext_n, ext_d, poptimum, point)
    ccall((:ppl_BD_Shape_mpq_class_maximize_with_point, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}, ppl_Generator_t), ph, le, ext_n, ext_d, poptimum, point)
end

function ppl_BD_Shape_mpq_class_minimize_with_point(ph, le, ext_n, ext_d, poptimum, point)
    ccall((:ppl_BD_Shape_mpq_class_minimize_with_point, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}, ppl_Generator_t), ph, le, ext_n, ext_d, poptimum, point)
end

function ppl_BD_Shape_mpq_class_frequency(ph, le, ext_fn, ext_fd, ext_vn, ext_vd)
    ccall((:ppl_BD_Shape_mpq_class_frequency, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, ppl_Coefficient_t, ppl_Coefficient_t), ph, le, ext_fn, ext_fd, ext_vn, ext_vd)
end

function ppl_BD_Shape_mpq_class_contains_BD_Shape_mpq_class(x, y)
    ccall((:ppl_BD_Shape_mpq_class_contains_BD_Shape_mpq_class, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t), x, y)
end

function ppl_BD_Shape_mpq_class_strictly_contains_BD_Shape_mpq_class(x, y)
    ccall((:ppl_BD_Shape_mpq_class_strictly_contains_BD_Shape_mpq_class, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t), x, y)
end

function ppl_BD_Shape_mpq_class_is_disjoint_from_BD_Shape_mpq_class(x, y)
    ccall((:ppl_BD_Shape_mpq_class_is_disjoint_from_BD_Shape_mpq_class, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t), x, y)
end

function ppl_BD_Shape_mpq_class_equals_BD_Shape_mpq_class(x, y)
    ccall((:ppl_BD_Shape_mpq_class_equals_BD_Shape_mpq_class, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t), x, y)
end

function ppl_BD_Shape_mpq_class_OK(ph)
    ccall((:ppl_BD_Shape_mpq_class_OK, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t,), ph)
end

function ppl_BD_Shape_mpq_class_add_constraint(ph, c)
    ccall((:ppl_BD_Shape_mpq_class_add_constraint, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_Constraint_t), ph, c)
end

function ppl_BD_Shape_mpq_class_add_congruence(ph, c)
    ccall((:ppl_BD_Shape_mpq_class_add_congruence, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_Congruence_t), ph, c)
end

function ppl_BD_Shape_mpq_class_add_constraints(ph, cs)
    ccall((:ppl_BD_Shape_mpq_class_add_constraints, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_Constraint_System_t), ph, cs)
end

function ppl_BD_Shape_mpq_class_add_congruences(ph, cs)
    ccall((:ppl_BD_Shape_mpq_class_add_congruences, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_Congruence_System_t), ph, cs)
end

function ppl_BD_Shape_mpq_class_refine_with_constraint(ph, c)
    ccall((:ppl_BD_Shape_mpq_class_refine_with_constraint, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_Constraint_t), ph, c)
end

function ppl_BD_Shape_mpq_class_refine_with_congruence(ph, c)
    ccall((:ppl_BD_Shape_mpq_class_refine_with_congruence, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_Congruence_t), ph, c)
end

function ppl_BD_Shape_mpq_class_refine_with_constraints(ph, cs)
    ccall((:ppl_BD_Shape_mpq_class_refine_with_constraints, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_Constraint_System_t), ph, cs)
end

function ppl_BD_Shape_mpq_class_refine_with_congruences(ph, cs)
    ccall((:ppl_BD_Shape_mpq_class_refine_with_congruences, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_Congruence_System_t), ph, cs)
end

function ppl_BD_Shape_mpq_class_intersection_assign(x, y)
    ccall((:ppl_BD_Shape_mpq_class_intersection_assign, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t), x, y)
end

function ppl_BD_Shape_mpq_class_upper_bound_assign(x, y)
    ccall((:ppl_BD_Shape_mpq_class_upper_bound_assign, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t), x, y)
end

function ppl_BD_Shape_mpq_class_difference_assign(x, y)
    ccall((:ppl_BD_Shape_mpq_class_difference_assign, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t), x, y)
end

function ppl_BD_Shape_mpq_class_concatenate_assign(x, y)
    ccall((:ppl_BD_Shape_mpq_class_concatenate_assign, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t), x, y)
end

function ppl_BD_Shape_mpq_class_time_elapse_assign(x, y)
    ccall((:ppl_BD_Shape_mpq_class_time_elapse_assign, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t), x, y)
end

function ppl_BD_Shape_mpq_class_upper_bound_assign_if_exact(x, y)
    ccall((:ppl_BD_Shape_mpq_class_upper_bound_assign_if_exact, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t), x, y)
end

function ppl_BD_Shape_mpq_class_simplify_using_context_assign(x, y)
    ccall((:ppl_BD_Shape_mpq_class_simplify_using_context_assign, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t), x, y)
end

function ppl_BD_Shape_mpq_class_constrains(ph, var)
    ccall((:ppl_BD_Shape_mpq_class_constrains, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_dimension_type), ph, var)
end

function ppl_BD_Shape_mpq_class_unconstrain_space_dimension(ph, var)
    ccall((:ppl_BD_Shape_mpq_class_unconstrain_space_dimension, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_dimension_type), ph, var)
end

function ppl_BD_Shape_mpq_class_unconstrain_space_dimensions(ph, ds, n)
    ccall((:ppl_BD_Shape_mpq_class_unconstrain_space_dimensions, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, Ptr{ppl_dimension_type}, Csize_t), ph, ds, n)
end

function ppl_BD_Shape_mpq_class_affine_image(ph, var, le, d)
    ccall((:ppl_BD_Shape_mpq_class_affine_image, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, le, d)
end

function ppl_BD_Shape_mpq_class_affine_preimage(ph, var, le, d)
    ccall((:ppl_BD_Shape_mpq_class_affine_preimage, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, le, d)
end

function ppl_BD_Shape_mpq_class_bounded_affine_image(ph, var, lb, ub, d)
    ccall((:ppl_BD_Shape_mpq_class_bounded_affine_image, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, lb, ub, d)
end

function ppl_BD_Shape_mpq_class_bounded_affine_preimage(ph, var, lb, ub, d)
    ccall((:ppl_BD_Shape_mpq_class_bounded_affine_preimage, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, lb, ub, d)
end

function ppl_BD_Shape_mpq_class_generalized_affine_image(ph, var, relsym, le, d)
    ccall((:ppl_BD_Shape_mpq_class_generalized_affine_image, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_dimension_type, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, relsym, le, d)
end

function ppl_BD_Shape_mpq_class_generalized_affine_preimage(ph, var, relsym, le, d)
    ccall((:ppl_BD_Shape_mpq_class_generalized_affine_preimage, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_dimension_type, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, relsym, le, d)
end

function ppl_BD_Shape_mpq_class_generalized_affine_image_lhs_rhs(ph, lhs, relsym, rhs)
    ccall((:ppl_BD_Shape_mpq_class_generalized_affine_image_lhs_rhs, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_Linear_Expression_t, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t), ph, lhs, relsym, rhs)
end

function ppl_BD_Shape_mpq_class_generalized_affine_preimage_lhs_rhs(ph, lhs, relsym, rhs)
    ccall((:ppl_BD_Shape_mpq_class_generalized_affine_preimage_lhs_rhs, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_Linear_Expression_t, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t), ph, lhs, relsym, rhs)
end

function ppl_BD_Shape_mpq_class_add_space_dimensions_and_embed(ph, d)
    ccall((:ppl_BD_Shape_mpq_class_add_space_dimensions_and_embed, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_dimension_type), ph, d)
end

function ppl_BD_Shape_mpq_class_add_space_dimensions_and_project(ph, d)
    ccall((:ppl_BD_Shape_mpq_class_add_space_dimensions_and_project, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_dimension_type), ph, d)
end

function ppl_BD_Shape_mpq_class_remove_space_dimensions(ph, ds, n)
    ccall((:ppl_BD_Shape_mpq_class_remove_space_dimensions, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, Ptr{ppl_dimension_type}, Csize_t), ph, ds, n)
end

function ppl_BD_Shape_mpq_class_remove_higher_space_dimensions(ph, d)
    ccall((:ppl_BD_Shape_mpq_class_remove_higher_space_dimensions, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_dimension_type), ph, d)
end

function ppl_BD_Shape_mpq_class_expand_space_dimension(ph, d, m)
    ccall((:ppl_BD_Shape_mpq_class_expand_space_dimension, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_dimension_type, ppl_dimension_type), ph, d, m)
end

function ppl_BD_Shape_mpq_class_fold_space_dimensions(ph, ds, n, d)
    ccall((:ppl_BD_Shape_mpq_class_fold_space_dimensions, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, Ptr{ppl_dimension_type}, Csize_t, ppl_dimension_type), ph, ds, n, d)
end

function ppl_BD_Shape_mpq_class_map_space_dimensions(ph, maps, n)
    ccall((:ppl_BD_Shape_mpq_class_map_space_dimensions, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, Ptr{ppl_dimension_type}, Csize_t), ph, maps, n)
end

function ppl_BD_Shape_mpq_class_drop_some_non_integer_points(ph, complexity)
    ccall((:ppl_BD_Shape_mpq_class_drop_some_non_integer_points, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, Cint), ph, complexity)
end

function ppl_BD_Shape_mpq_class_drop_some_non_integer_points_2(ph, ds, n, complexity)
    ccall((:ppl_BD_Shape_mpq_class_drop_some_non_integer_points_2, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, Ptr{ppl_dimension_type}, Csize_t, Cint), ph, ds, n, complexity)
end

function ppl_BD_Shape_mpq_class_external_memory_in_bytes(ps, sz)
    ccall((:ppl_BD_Shape_mpq_class_external_memory_in_bytes, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, Ptr{Csize_t}), ps, sz)
end

function ppl_BD_Shape_mpq_class_total_memory_in_bytes(ps, sz)
    ccall((:ppl_BD_Shape_mpq_class_total_memory_in_bytes, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, Ptr{Csize_t}), ps, sz)
end

function ppl_BD_Shape_mpq_class_BHMZ05_widening_assign_with_tokens(x, y, tp)
    ccall((:ppl_BD_Shape_mpq_class_BHMZ05_widening_assign_with_tokens, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t, Ptr{Cuint}), x, y, tp)
end

function ppl_BD_Shape_mpq_class_H79_widening_assign_with_tokens(x, y, tp)
    ccall((:ppl_BD_Shape_mpq_class_H79_widening_assign_with_tokens, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t, Ptr{Cuint}), x, y, tp)
end

function ppl_BD_Shape_mpq_class_BHMZ05_widening_assign(x, y)
    ccall((:ppl_BD_Shape_mpq_class_BHMZ05_widening_assign, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t), x, y)
end

function ppl_BD_Shape_mpq_class_H79_widening_assign(x, y)
    ccall((:ppl_BD_Shape_mpq_class_H79_widening_assign, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t), x, y)
end

function ppl_BD_Shape_mpq_class_widening_assign_with_tokens(x, y, tp)
    ccall((:ppl_BD_Shape_mpq_class_widening_assign_with_tokens, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t, Ptr{Cuint}), x, y, tp)
end

function ppl_BD_Shape_mpq_class_widening_assign(x, y)
    ccall((:ppl_BD_Shape_mpq_class_widening_assign, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t), x, y)
end

function ppl_BD_Shape_mpq_class_limited_BHMZ05_extrapolation_assign_with_tokens(x, y, cs, tp)
    ccall((:ppl_BD_Shape_mpq_class_limited_BHMZ05_extrapolation_assign_with_tokens, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t, ppl_const_Constraint_System_t, Ptr{Cuint}), x, y, cs, tp)
end

function ppl_BD_Shape_mpq_class_limited_H79_extrapolation_assign_with_tokens(x, y, cs, tp)
    ccall((:ppl_BD_Shape_mpq_class_limited_H79_extrapolation_assign_with_tokens, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t, ppl_const_Constraint_System_t, Ptr{Cuint}), x, y, cs, tp)
end

function ppl_BD_Shape_mpq_class_limited_CC76_extrapolation_assign_with_tokens(x, y, cs, tp)
    ccall((:ppl_BD_Shape_mpq_class_limited_CC76_extrapolation_assign_with_tokens, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t, ppl_const_Constraint_System_t, Ptr{Cuint}), x, y, cs, tp)
end

function ppl_BD_Shape_mpq_class_limited_BHMZ05_extrapolation_assign(x, y, cs)
    ccall((:ppl_BD_Shape_mpq_class_limited_BHMZ05_extrapolation_assign, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t, ppl_const_Constraint_System_t), x, y, cs)
end

function ppl_BD_Shape_mpq_class_limited_H79_extrapolation_assign(x, y, cs)
    ccall((:ppl_BD_Shape_mpq_class_limited_H79_extrapolation_assign, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t, ppl_const_Constraint_System_t), x, y, cs)
end

function ppl_BD_Shape_mpq_class_limited_CC76_extrapolation_assign(x, y, cs)
    ccall((:ppl_BD_Shape_mpq_class_limited_CC76_extrapolation_assign, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t, ppl_const_Constraint_System_t), x, y, cs)
end

function ppl_BD_Shape_mpq_class_CC76_extrapolation_assign_with_tokens(x, y, tp)
    ccall((:ppl_BD_Shape_mpq_class_CC76_extrapolation_assign_with_tokens, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t, Ptr{Cuint}), x, y, tp)
end

function ppl_BD_Shape_mpq_class_CC76_extrapolation_assign(x, y)
    ccall((:ppl_BD_Shape_mpq_class_CC76_extrapolation_assign, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t), x, y)
end

function ppl_BD_Shape_mpq_class_CC76_narrowing_assign(x, y)
    ccall((:ppl_BD_Shape_mpq_class_CC76_narrowing_assign, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t), x, y)
end

function ppl_BD_Shape_mpq_class_linear_partition(x, y, p_inters, p_rest)
    ccall((:ppl_BD_Shape_mpq_class_linear_partition, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t, Ptr{ppl_BD_Shape_mpq_class_t}, Ptr{ppl_Pointset_Powerset_NNC_Polyhedron_t}), x, y, p_inters, p_rest)
end

function ppl_BD_Shape_mpq_class_wrap_assign(ph, ds, n, w, r, o, pcs, complexity_threshold, wrap_individually)
    ccall((:ppl_BD_Shape_mpq_class_wrap_assign, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, Ptr{ppl_dimension_type}, Csize_t, ppl_enum_Bounded_Integer_Type_Width, ppl_enum_Bounded_Integer_Type_Representation, ppl_enum_Bounded_Integer_Type_Overflow, Ptr{ppl_const_Constraint_System_t}, Cuint, Cint), ph, ds, n, w, r, o, pcs, complexity_threshold, wrap_individually)
end

function ppl_new_BD_Shape_mpq_class_recycle_Constraint_System(pph, cs)
    ccall((:ppl_new_BD_Shape_mpq_class_recycle_Constraint_System, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpq_class_t}, ppl_Constraint_System_t), pph, cs)
end

function ppl_new_BD_Shape_mpq_class_recycle_Congruence_System(pph, cs)
    ccall((:ppl_new_BD_Shape_mpq_class_recycle_Congruence_System, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpq_class_t}, ppl_Congruence_System_t), pph, cs)
end

function ppl_new_BD_Shape_mpq_class_recycle_Generator_System(pph, cs)
    ccall((:ppl_new_BD_Shape_mpq_class_recycle_Generator_System, libppl_c), Cint, (Ptr{ppl_BD_Shape_mpq_class_t}, ppl_Generator_System_t), pph, cs)
end

function ppl_assign_BD_Shape_mpq_class_from_BD_Shape_mpq_class(dst, src)
    ccall((:ppl_assign_BD_Shape_mpq_class_from_BD_Shape_mpq_class, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t), dst, src)
end

function ppl_BD_Shape_mpq_class_add_recycled_constraints(ph, cs)
    ccall((:ppl_BD_Shape_mpq_class_add_recycled_constraints, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_Constraint_System_t), ph, cs)
end

function ppl_BD_Shape_mpq_class_add_recycled_congruences(ph, cs)
    ccall((:ppl_BD_Shape_mpq_class_add_recycled_congruences, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, ppl_Congruence_System_t), ph, cs)
end

function ppl_termination_test_MS_BD_Shape_mpq_class(pset)
    ccall((:ppl_termination_test_MS_BD_Shape_mpq_class, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t,), pset)
end

function ppl_termination_test_PR_BD_Shape_mpq_class(pset)
    ccall((:ppl_termination_test_PR_BD_Shape_mpq_class, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t,), pset)
end

function ppl_one_affine_ranking_function_MS_BD_Shape_mpq_class(pset, point)
    ccall((:ppl_one_affine_ranking_function_MS_BD_Shape_mpq_class, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, ppl_Generator_t), pset, point)
end

function ppl_one_affine_ranking_function_PR_BD_Shape_mpq_class(pset, point)
    ccall((:ppl_one_affine_ranking_function_PR_BD_Shape_mpq_class, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, ppl_Generator_t), pset, point)
end

function ppl_all_affine_ranking_functions_MS_BD_Shape_mpq_class(pset, ph)
    ccall((:ppl_all_affine_ranking_functions_MS_BD_Shape_mpq_class, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, ppl_Polyhedron_t), pset, ph)
end

function ppl_all_affine_ranking_functions_PR_BD_Shape_mpq_class(pset, ph)
    ccall((:ppl_all_affine_ranking_functions_PR_BD_Shape_mpq_class, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, ppl_Polyhedron_t), pset, ph)
end

function ppl_termination_test_MS_BD_Shape_mpq_class_2(pset_before, pset_after)
    ccall((:ppl_termination_test_MS_BD_Shape_mpq_class_2, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t), pset_before, pset_after)
end

function ppl_termination_test_PR_BD_Shape_mpq_class_2(pset_before, pset_after)
    ccall((:ppl_termination_test_PR_BD_Shape_mpq_class_2, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t), pset_before, pset_after)
end

function ppl_one_affine_ranking_function_MS_BD_Shape_mpq_class_2(pset_before, pset_after, point)
    ccall((:ppl_one_affine_ranking_function_MS_BD_Shape_mpq_class_2, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t, ppl_Generator_t), pset_before, pset_after, point)
end

function ppl_one_affine_ranking_function_PR_BD_Shape_mpq_class_2(pset_before, pset_after, point)
    ccall((:ppl_one_affine_ranking_function_PR_BD_Shape_mpq_class_2, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t, ppl_Generator_t), pset_before, pset_after, point)
end

function ppl_all_affine_ranking_functions_MS_BD_Shape_mpq_class_2(pset_before, pset_after, ph)
    ccall((:ppl_all_affine_ranking_functions_MS_BD_Shape_mpq_class_2, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t, ppl_Polyhedron_t), pset_before, pset_after, ph)
end

function ppl_all_affine_ranking_functions_PR_BD_Shape_mpq_class_2(pset_before, pset_after, ph)
    ccall((:ppl_all_affine_ranking_functions_PR_BD_Shape_mpq_class_2, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, ppl_const_BD_Shape_mpq_class_t, ppl_Polyhedron_t), pset_before, pset_after, ph)
end

function ppl_io_print_BD_Shape_mpq_class(x)
    ccall((:ppl_io_print_BD_Shape_mpq_class, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t,), x)
end

function ppl_io_fprint_BD_Shape_mpq_class(stream, x)
    ccall((:ppl_io_fprint_BD_Shape_mpq_class, libppl_c), Cint, (Ptr{Libc.FILE}, ppl_const_BD_Shape_mpq_class_t), stream, x)
end

function ppl_io_asprint_BD_Shape_mpq_class(strp, x)
    ccall((:ppl_io_asprint_BD_Shape_mpq_class, libppl_c), Cint, (Ptr{Ptr{Cchar}}, ppl_const_BD_Shape_mpq_class_t), strp, x)
end

function ppl_BD_Shape_mpq_class_ascii_dump(x, stream)
    ccall((:ppl_BD_Shape_mpq_class_ascii_dump, libppl_c), Cint, (ppl_const_BD_Shape_mpq_class_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_BD_Shape_mpq_class_ascii_load(x, stream)
    ccall((:ppl_BD_Shape_mpq_class_ascii_load, libppl_c), Cint, (ppl_BD_Shape_mpq_class_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_delete_Octagonal_Shape_mpz_class(ph)
    ccall((:ppl_delete_Octagonal_Shape_mpz_class, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t,), ph)
end

function ppl_new_Octagonal_Shape_mpz_class_from_space_dimension(pph, d, empty)
    ccall((:ppl_new_Octagonal_Shape_mpz_class_from_space_dimension, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpz_class_t}, ppl_dimension_type, Cint), pph, d, empty)
end

function ppl_new_Octagonal_Shape_mpz_class_from_C_Polyhedron(pph, ph)
    ccall((:ppl_new_Octagonal_Shape_mpz_class_from_C_Polyhedron, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpz_class_t}, ppl_const_Polyhedron_t), pph, ph)
end

function ppl_new_Octagonal_Shape_mpz_class_from_NNC_Polyhedron(pph, ph)
    ccall((:ppl_new_Octagonal_Shape_mpz_class_from_NNC_Polyhedron, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpz_class_t}, ppl_const_Polyhedron_t), pph, ph)
end

function ppl_new_Octagonal_Shape_mpz_class_from_Grid(pph, ph)
    ccall((:ppl_new_Octagonal_Shape_mpz_class_from_Grid, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpz_class_t}, ppl_const_Grid_t), pph, ph)
end

function ppl_new_Octagonal_Shape_mpz_class_from_Rational_Box(pph, ph)
    ccall((:ppl_new_Octagonal_Shape_mpz_class_from_Rational_Box, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpz_class_t}, ppl_const_Rational_Box_t), pph, ph)
end

function ppl_new_Octagonal_Shape_mpz_class_from_BD_Shape_mpz_class(pph, ph)
    ccall((:ppl_new_Octagonal_Shape_mpz_class_from_BD_Shape_mpz_class, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpz_class_t}, ppl_const_BD_Shape_mpz_class_t), pph, ph)
end

function ppl_new_Octagonal_Shape_mpz_class_from_BD_Shape_mpq_class(pph, ph)
    ccall((:ppl_new_Octagonal_Shape_mpz_class_from_BD_Shape_mpq_class, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpz_class_t}, ppl_const_BD_Shape_mpq_class_t), pph, ph)
end

function ppl_new_Octagonal_Shape_mpz_class_from_Octagonal_Shape_mpz_class(pph, ph)
    ccall((:ppl_new_Octagonal_Shape_mpz_class_from_Octagonal_Shape_mpz_class, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpz_class_t}, ppl_const_Octagonal_Shape_mpz_class_t), pph, ph)
end

function ppl_new_Octagonal_Shape_mpz_class_from_Octagonal_Shape_mpq_class(pph, ph)
    ccall((:ppl_new_Octagonal_Shape_mpz_class_from_Octagonal_Shape_mpq_class, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpz_class_t}, ppl_const_Octagonal_Shape_mpq_class_t), pph, ph)
end

function ppl_new_Octagonal_Shape_mpz_class_from_C_Polyhedron_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Octagonal_Shape_mpz_class_from_C_Polyhedron_with_complexity, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpz_class_t}, ppl_const_Polyhedron_t, Cint), pph, ph, complexity)
end

function ppl_new_Octagonal_Shape_mpz_class_from_NNC_Polyhedron_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Octagonal_Shape_mpz_class_from_NNC_Polyhedron_with_complexity, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpz_class_t}, ppl_const_Polyhedron_t, Cint), pph, ph, complexity)
end

function ppl_new_Octagonal_Shape_mpz_class_from_Grid_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Octagonal_Shape_mpz_class_from_Grid_with_complexity, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpz_class_t}, ppl_const_Grid_t, Cint), pph, ph, complexity)
end

function ppl_new_Octagonal_Shape_mpz_class_from_Rational_Box_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Octagonal_Shape_mpz_class_from_Rational_Box_with_complexity, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpz_class_t}, ppl_const_Rational_Box_t, Cint), pph, ph, complexity)
end

function ppl_new_Octagonal_Shape_mpz_class_from_BD_Shape_mpz_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Octagonal_Shape_mpz_class_from_BD_Shape_mpz_class_with_complexity, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpz_class_t}, ppl_const_BD_Shape_mpz_class_t, Cint), pph, ph, complexity)
end

function ppl_new_Octagonal_Shape_mpz_class_from_BD_Shape_mpq_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Octagonal_Shape_mpz_class_from_BD_Shape_mpq_class_with_complexity, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpz_class_t}, ppl_const_BD_Shape_mpq_class_t, Cint), pph, ph, complexity)
end

function ppl_new_Octagonal_Shape_mpz_class_from_Octagonal_Shape_mpz_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Octagonal_Shape_mpz_class_from_Octagonal_Shape_mpz_class_with_complexity, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpz_class_t}, ppl_const_Octagonal_Shape_mpz_class_t, Cint), pph, ph, complexity)
end

function ppl_new_Octagonal_Shape_mpz_class_from_Octagonal_Shape_mpq_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Octagonal_Shape_mpz_class_from_Octagonal_Shape_mpq_class_with_complexity, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpz_class_t}, ppl_const_Octagonal_Shape_mpq_class_t, Cint), pph, ph, complexity)
end

function ppl_new_Octagonal_Shape_mpz_class_from_Constraint_System(pph, cs)
    ccall((:ppl_new_Octagonal_Shape_mpz_class_from_Constraint_System, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpz_class_t}, ppl_const_Constraint_System_t), pph, cs)
end

function ppl_new_Octagonal_Shape_mpz_class_from_Congruence_System(pph, cs)
    ccall((:ppl_new_Octagonal_Shape_mpz_class_from_Congruence_System, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpz_class_t}, ppl_const_Congruence_System_t), pph, cs)
end

function ppl_new_Octagonal_Shape_mpz_class_from_Generator_System(pph, cs)
    ccall((:ppl_new_Octagonal_Shape_mpz_class_from_Generator_System, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpz_class_t}, ppl_const_Generator_System_t), pph, cs)
end

function ppl_Octagonal_Shape_mpz_class_space_dimension(ph, m)
    ccall((:ppl_Octagonal_Shape_mpz_class_space_dimension, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, Ptr{ppl_dimension_type}), ph, m)
end

function ppl_Octagonal_Shape_mpz_class_affine_dimension(ph, m)
    ccall((:ppl_Octagonal_Shape_mpz_class_affine_dimension, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, Ptr{ppl_dimension_type}), ph, m)
end

function ppl_Octagonal_Shape_mpz_class_relation_with_Constraint(ph, c)
    ccall((:ppl_Octagonal_Shape_mpz_class_relation_with_Constraint, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, ppl_const_Constraint_t), ph, c)
end

function ppl_Octagonal_Shape_mpz_class_relation_with_Generator(ph, c)
    ccall((:ppl_Octagonal_Shape_mpz_class_relation_with_Generator, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, ppl_const_Generator_t), ph, c)
end

function ppl_Octagonal_Shape_mpz_class_relation_with_Congruence(ph, c)
    ccall((:ppl_Octagonal_Shape_mpz_class_relation_with_Congruence, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, ppl_const_Congruence_t), ph, c)
end

function ppl_Octagonal_Shape_mpz_class_get_constraints(ph, pcs)
    ccall((:ppl_Octagonal_Shape_mpz_class_get_constraints, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, Ptr{ppl_const_Constraint_System_t}), ph, pcs)
end

function ppl_Octagonal_Shape_mpz_class_get_congruences(ph, pcs)
    ccall((:ppl_Octagonal_Shape_mpz_class_get_congruences, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, Ptr{ppl_const_Congruence_System_t}), ph, pcs)
end

function ppl_Octagonal_Shape_mpz_class_get_minimized_constraints(ph, pcs)
    ccall((:ppl_Octagonal_Shape_mpz_class_get_minimized_constraints, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, Ptr{ppl_const_Constraint_System_t}), ph, pcs)
end

function ppl_Octagonal_Shape_mpz_class_get_minimized_congruences(ph, pcs)
    ccall((:ppl_Octagonal_Shape_mpz_class_get_minimized_congruences, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, Ptr{ppl_const_Congruence_System_t}), ph, pcs)
end

function ppl_Octagonal_Shape_mpz_class_is_empty(ph)
    ccall((:ppl_Octagonal_Shape_mpz_class_is_empty, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t,), ph)
end

function ppl_Octagonal_Shape_mpz_class_is_universe(ph)
    ccall((:ppl_Octagonal_Shape_mpz_class_is_universe, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t,), ph)
end

function ppl_Octagonal_Shape_mpz_class_is_bounded(ph)
    ccall((:ppl_Octagonal_Shape_mpz_class_is_bounded, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t,), ph)
end

function ppl_Octagonal_Shape_mpz_class_contains_integer_point(ph)
    ccall((:ppl_Octagonal_Shape_mpz_class_contains_integer_point, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t,), ph)
end

function ppl_Octagonal_Shape_mpz_class_is_topologically_closed(ph)
    ccall((:ppl_Octagonal_Shape_mpz_class_is_topologically_closed, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t,), ph)
end

function ppl_Octagonal_Shape_mpz_class_is_discrete(ph)
    ccall((:ppl_Octagonal_Shape_mpz_class_is_discrete, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t,), ph)
end

function ppl_Octagonal_Shape_mpz_class_topological_closure_assign(ph)
    ccall((:ppl_Octagonal_Shape_mpz_class_topological_closure_assign, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t,), ph)
end

function ppl_Octagonal_Shape_mpz_class_bounds_from_above(ph, le)
    ccall((:ppl_Octagonal_Shape_mpz_class_bounds_from_above, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, ppl_const_Linear_Expression_t), ph, le)
end

function ppl_Octagonal_Shape_mpz_class_bounds_from_below(ph, le)
    ccall((:ppl_Octagonal_Shape_mpz_class_bounds_from_below, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, ppl_const_Linear_Expression_t), ph, le)
end

function ppl_Octagonal_Shape_mpz_class_maximize(ph, le, ext_n, ext_d, poptimum)
    ccall((:ppl_Octagonal_Shape_mpz_class_maximize, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}), ph, le, ext_n, ext_d, poptimum)
end

function ppl_Octagonal_Shape_mpz_class_minimize(ph, le, ext_n, ext_d, poptimum)
    ccall((:ppl_Octagonal_Shape_mpz_class_minimize, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}), ph, le, ext_n, ext_d, poptimum)
end

function ppl_Octagonal_Shape_mpz_class_maximize_with_point(ph, le, ext_n, ext_d, poptimum, point)
    ccall((:ppl_Octagonal_Shape_mpz_class_maximize_with_point, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}, ppl_Generator_t), ph, le, ext_n, ext_d, poptimum, point)
end

function ppl_Octagonal_Shape_mpz_class_minimize_with_point(ph, le, ext_n, ext_d, poptimum, point)
    ccall((:ppl_Octagonal_Shape_mpz_class_minimize_with_point, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}, ppl_Generator_t), ph, le, ext_n, ext_d, poptimum, point)
end

function ppl_Octagonal_Shape_mpz_class_frequency(ph, le, ext_fn, ext_fd, ext_vn, ext_vd)
    ccall((:ppl_Octagonal_Shape_mpz_class_frequency, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, ppl_Coefficient_t, ppl_Coefficient_t), ph, le, ext_fn, ext_fd, ext_vn, ext_vd)
end

function ppl_Octagonal_Shape_mpz_class_contains_Octagonal_Shape_mpz_class(x, y)
    ccall((:ppl_Octagonal_Shape_mpz_class_contains_Octagonal_Shape_mpz_class, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, ppl_const_Octagonal_Shape_mpz_class_t), x, y)
end

function ppl_Octagonal_Shape_mpz_class_strictly_contains_Octagonal_Shape_mpz_class(x, y)
    ccall((:ppl_Octagonal_Shape_mpz_class_strictly_contains_Octagonal_Shape_mpz_class, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, ppl_const_Octagonal_Shape_mpz_class_t), x, y)
end

function ppl_Octagonal_Shape_mpz_class_is_disjoint_from_Octagonal_Shape_mpz_class(x, y)
    ccall((:ppl_Octagonal_Shape_mpz_class_is_disjoint_from_Octagonal_Shape_mpz_class, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, ppl_const_Octagonal_Shape_mpz_class_t), x, y)
end

function ppl_Octagonal_Shape_mpz_class_equals_Octagonal_Shape_mpz_class(x, y)
    ccall((:ppl_Octagonal_Shape_mpz_class_equals_Octagonal_Shape_mpz_class, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, ppl_const_Octagonal_Shape_mpz_class_t), x, y)
end

function ppl_Octagonal_Shape_mpz_class_OK(ph)
    ccall((:ppl_Octagonal_Shape_mpz_class_OK, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t,), ph)
end

function ppl_Octagonal_Shape_mpz_class_add_constraint(ph, c)
    ccall((:ppl_Octagonal_Shape_mpz_class_add_constraint, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_const_Constraint_t), ph, c)
end

function ppl_Octagonal_Shape_mpz_class_add_congruence(ph, c)
    ccall((:ppl_Octagonal_Shape_mpz_class_add_congruence, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_const_Congruence_t), ph, c)
end

function ppl_Octagonal_Shape_mpz_class_add_constraints(ph, cs)
    ccall((:ppl_Octagonal_Shape_mpz_class_add_constraints, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_const_Constraint_System_t), ph, cs)
end

function ppl_Octagonal_Shape_mpz_class_add_congruences(ph, cs)
    ccall((:ppl_Octagonal_Shape_mpz_class_add_congruences, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_const_Congruence_System_t), ph, cs)
end

function ppl_Octagonal_Shape_mpz_class_refine_with_constraint(ph, c)
    ccall((:ppl_Octagonal_Shape_mpz_class_refine_with_constraint, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_const_Constraint_t), ph, c)
end

function ppl_Octagonal_Shape_mpz_class_refine_with_congruence(ph, c)
    ccall((:ppl_Octagonal_Shape_mpz_class_refine_with_congruence, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_const_Congruence_t), ph, c)
end

function ppl_Octagonal_Shape_mpz_class_refine_with_constraints(ph, cs)
    ccall((:ppl_Octagonal_Shape_mpz_class_refine_with_constraints, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_const_Constraint_System_t), ph, cs)
end

function ppl_Octagonal_Shape_mpz_class_refine_with_congruences(ph, cs)
    ccall((:ppl_Octagonal_Shape_mpz_class_refine_with_congruences, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_const_Congruence_System_t), ph, cs)
end

function ppl_Octagonal_Shape_mpz_class_intersection_assign(x, y)
    ccall((:ppl_Octagonal_Shape_mpz_class_intersection_assign, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_const_Octagonal_Shape_mpz_class_t), x, y)
end

function ppl_Octagonal_Shape_mpz_class_upper_bound_assign(x, y)
    ccall((:ppl_Octagonal_Shape_mpz_class_upper_bound_assign, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_const_Octagonal_Shape_mpz_class_t), x, y)
end

function ppl_Octagonal_Shape_mpz_class_difference_assign(x, y)
    ccall((:ppl_Octagonal_Shape_mpz_class_difference_assign, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_const_Octagonal_Shape_mpz_class_t), x, y)
end

function ppl_Octagonal_Shape_mpz_class_concatenate_assign(x, y)
    ccall((:ppl_Octagonal_Shape_mpz_class_concatenate_assign, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_const_Octagonal_Shape_mpz_class_t), x, y)
end

function ppl_Octagonal_Shape_mpz_class_time_elapse_assign(x, y)
    ccall((:ppl_Octagonal_Shape_mpz_class_time_elapse_assign, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_const_Octagonal_Shape_mpz_class_t), x, y)
end

function ppl_Octagonal_Shape_mpz_class_upper_bound_assign_if_exact(x, y)
    ccall((:ppl_Octagonal_Shape_mpz_class_upper_bound_assign_if_exact, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_const_Octagonal_Shape_mpz_class_t), x, y)
end

function ppl_Octagonal_Shape_mpz_class_simplify_using_context_assign(x, y)
    ccall((:ppl_Octagonal_Shape_mpz_class_simplify_using_context_assign, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_const_Octagonal_Shape_mpz_class_t), x, y)
end

function ppl_Octagonal_Shape_mpz_class_constrains(ph, var)
    ccall((:ppl_Octagonal_Shape_mpz_class_constrains, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_dimension_type), ph, var)
end

function ppl_Octagonal_Shape_mpz_class_unconstrain_space_dimension(ph, var)
    ccall((:ppl_Octagonal_Shape_mpz_class_unconstrain_space_dimension, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_dimension_type), ph, var)
end

function ppl_Octagonal_Shape_mpz_class_unconstrain_space_dimensions(ph, ds, n)
    ccall((:ppl_Octagonal_Shape_mpz_class_unconstrain_space_dimensions, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, Ptr{ppl_dimension_type}, Csize_t), ph, ds, n)
end

function ppl_Octagonal_Shape_mpz_class_affine_image(ph, var, le, d)
    ccall((:ppl_Octagonal_Shape_mpz_class_affine_image, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, le, d)
end

function ppl_Octagonal_Shape_mpz_class_affine_preimage(ph, var, le, d)
    ccall((:ppl_Octagonal_Shape_mpz_class_affine_preimage, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, le, d)
end

function ppl_Octagonal_Shape_mpz_class_bounded_affine_image(ph, var, lb, ub, d)
    ccall((:ppl_Octagonal_Shape_mpz_class_bounded_affine_image, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, lb, ub, d)
end

function ppl_Octagonal_Shape_mpz_class_bounded_affine_preimage(ph, var, lb, ub, d)
    ccall((:ppl_Octagonal_Shape_mpz_class_bounded_affine_preimage, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, lb, ub, d)
end

function ppl_Octagonal_Shape_mpz_class_generalized_affine_image(ph, var, relsym, le, d)
    ccall((:ppl_Octagonal_Shape_mpz_class_generalized_affine_image, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_dimension_type, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, relsym, le, d)
end

function ppl_Octagonal_Shape_mpz_class_generalized_affine_preimage(ph, var, relsym, le, d)
    ccall((:ppl_Octagonal_Shape_mpz_class_generalized_affine_preimage, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_dimension_type, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, relsym, le, d)
end

function ppl_Octagonal_Shape_mpz_class_generalized_affine_image_lhs_rhs(ph, lhs, relsym, rhs)
    ccall((:ppl_Octagonal_Shape_mpz_class_generalized_affine_image_lhs_rhs, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_const_Linear_Expression_t, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t), ph, lhs, relsym, rhs)
end

function ppl_Octagonal_Shape_mpz_class_generalized_affine_preimage_lhs_rhs(ph, lhs, relsym, rhs)
    ccall((:ppl_Octagonal_Shape_mpz_class_generalized_affine_preimage_lhs_rhs, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_const_Linear_Expression_t, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t), ph, lhs, relsym, rhs)
end

function ppl_Octagonal_Shape_mpz_class_add_space_dimensions_and_embed(ph, d)
    ccall((:ppl_Octagonal_Shape_mpz_class_add_space_dimensions_and_embed, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_dimension_type), ph, d)
end

function ppl_Octagonal_Shape_mpz_class_add_space_dimensions_and_project(ph, d)
    ccall((:ppl_Octagonal_Shape_mpz_class_add_space_dimensions_and_project, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_dimension_type), ph, d)
end

function ppl_Octagonal_Shape_mpz_class_remove_space_dimensions(ph, ds, n)
    ccall((:ppl_Octagonal_Shape_mpz_class_remove_space_dimensions, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, Ptr{ppl_dimension_type}, Csize_t), ph, ds, n)
end

function ppl_Octagonal_Shape_mpz_class_remove_higher_space_dimensions(ph, d)
    ccall((:ppl_Octagonal_Shape_mpz_class_remove_higher_space_dimensions, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_dimension_type), ph, d)
end

function ppl_Octagonal_Shape_mpz_class_expand_space_dimension(ph, d, m)
    ccall((:ppl_Octagonal_Shape_mpz_class_expand_space_dimension, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_dimension_type, ppl_dimension_type), ph, d, m)
end

function ppl_Octagonal_Shape_mpz_class_fold_space_dimensions(ph, ds, n, d)
    ccall((:ppl_Octagonal_Shape_mpz_class_fold_space_dimensions, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, Ptr{ppl_dimension_type}, Csize_t, ppl_dimension_type), ph, ds, n, d)
end

function ppl_Octagonal_Shape_mpz_class_map_space_dimensions(ph, maps, n)
    ccall((:ppl_Octagonal_Shape_mpz_class_map_space_dimensions, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, Ptr{ppl_dimension_type}, Csize_t), ph, maps, n)
end

function ppl_Octagonal_Shape_mpz_class_drop_some_non_integer_points(ph, complexity)
    ccall((:ppl_Octagonal_Shape_mpz_class_drop_some_non_integer_points, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, Cint), ph, complexity)
end

function ppl_Octagonal_Shape_mpz_class_drop_some_non_integer_points_2(ph, ds, n, complexity)
    ccall((:ppl_Octagonal_Shape_mpz_class_drop_some_non_integer_points_2, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, Ptr{ppl_dimension_type}, Csize_t, Cint), ph, ds, n, complexity)
end

function ppl_Octagonal_Shape_mpz_class_external_memory_in_bytes(ps, sz)
    ccall((:ppl_Octagonal_Shape_mpz_class_external_memory_in_bytes, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, Ptr{Csize_t}), ps, sz)
end

function ppl_Octagonal_Shape_mpz_class_total_memory_in_bytes(ps, sz)
    ccall((:ppl_Octagonal_Shape_mpz_class_total_memory_in_bytes, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, Ptr{Csize_t}), ps, sz)
end

function ppl_Octagonal_Shape_mpz_class_BHMZ05_widening_assign_with_tokens(x, y, tp)
    ccall((:ppl_Octagonal_Shape_mpz_class_BHMZ05_widening_assign_with_tokens, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_const_Octagonal_Shape_mpz_class_t, Ptr{Cuint}), x, y, tp)
end

function ppl_Octagonal_Shape_mpz_class_BHMZ05_widening_assign(x, y)
    ccall((:ppl_Octagonal_Shape_mpz_class_BHMZ05_widening_assign, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_const_Octagonal_Shape_mpz_class_t), x, y)
end

function ppl_Octagonal_Shape_mpz_class_widening_assign_with_tokens(x, y, tp)
    ccall((:ppl_Octagonal_Shape_mpz_class_widening_assign_with_tokens, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_const_Octagonal_Shape_mpz_class_t, Ptr{Cuint}), x, y, tp)
end

function ppl_Octagonal_Shape_mpz_class_widening_assign(x, y)
    ccall((:ppl_Octagonal_Shape_mpz_class_widening_assign, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_const_Octagonal_Shape_mpz_class_t), x, y)
end

function ppl_Octagonal_Shape_mpz_class_limited_BHMZ05_extrapolation_assign_with_tokens(x, y, cs, tp)
    ccall((:ppl_Octagonal_Shape_mpz_class_limited_BHMZ05_extrapolation_assign_with_tokens, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_const_Octagonal_Shape_mpz_class_t, ppl_const_Constraint_System_t, Ptr{Cuint}), x, y, cs, tp)
end

function ppl_Octagonal_Shape_mpz_class_limited_CC76_extrapolation_assign_with_tokens(x, y, cs, tp)
    ccall((:ppl_Octagonal_Shape_mpz_class_limited_CC76_extrapolation_assign_with_tokens, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_const_Octagonal_Shape_mpz_class_t, ppl_const_Constraint_System_t, Ptr{Cuint}), x, y, cs, tp)
end

function ppl_Octagonal_Shape_mpz_class_limited_BHMZ05_extrapolation_assign(x, y, cs)
    ccall((:ppl_Octagonal_Shape_mpz_class_limited_BHMZ05_extrapolation_assign, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_const_Octagonal_Shape_mpz_class_t, ppl_const_Constraint_System_t), x, y, cs)
end

function ppl_Octagonal_Shape_mpz_class_limited_CC76_extrapolation_assign(x, y, cs)
    ccall((:ppl_Octagonal_Shape_mpz_class_limited_CC76_extrapolation_assign, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_const_Octagonal_Shape_mpz_class_t, ppl_const_Constraint_System_t), x, y, cs)
end

function ppl_Octagonal_Shape_mpz_class_CC76_extrapolation_assign_with_tokens(x, y, tp)
    ccall((:ppl_Octagonal_Shape_mpz_class_CC76_extrapolation_assign_with_tokens, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_const_Octagonal_Shape_mpz_class_t, Ptr{Cuint}), x, y, tp)
end

function ppl_Octagonal_Shape_mpz_class_CC76_extrapolation_assign(x, y)
    ccall((:ppl_Octagonal_Shape_mpz_class_CC76_extrapolation_assign, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_const_Octagonal_Shape_mpz_class_t), x, y)
end

function ppl_Octagonal_Shape_mpz_class_CC76_narrowing_assign(x, y)
    ccall((:ppl_Octagonal_Shape_mpz_class_CC76_narrowing_assign, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_const_Octagonal_Shape_mpz_class_t), x, y)
end

function ppl_Octagonal_Shape_mpz_class_linear_partition(x, y, p_inters, p_rest)
    ccall((:ppl_Octagonal_Shape_mpz_class_linear_partition, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, ppl_const_Octagonal_Shape_mpz_class_t, Ptr{ppl_Octagonal_Shape_mpz_class_t}, Ptr{ppl_Pointset_Powerset_NNC_Polyhedron_t}), x, y, p_inters, p_rest)
end

function ppl_Octagonal_Shape_mpz_class_wrap_assign(ph, ds, n, w, r, o, pcs, complexity_threshold, wrap_individually)
    ccall((:ppl_Octagonal_Shape_mpz_class_wrap_assign, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, Ptr{ppl_dimension_type}, Csize_t, ppl_enum_Bounded_Integer_Type_Width, ppl_enum_Bounded_Integer_Type_Representation, ppl_enum_Bounded_Integer_Type_Overflow, Ptr{ppl_const_Constraint_System_t}, Cuint, Cint), ph, ds, n, w, r, o, pcs, complexity_threshold, wrap_individually)
end

function ppl_new_Octagonal_Shape_mpz_class_recycle_Constraint_System(pph, cs)
    ccall((:ppl_new_Octagonal_Shape_mpz_class_recycle_Constraint_System, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpz_class_t}, ppl_Constraint_System_t), pph, cs)
end

function ppl_new_Octagonal_Shape_mpz_class_recycle_Congruence_System(pph, cs)
    ccall((:ppl_new_Octagonal_Shape_mpz_class_recycle_Congruence_System, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpz_class_t}, ppl_Congruence_System_t), pph, cs)
end

function ppl_new_Octagonal_Shape_mpz_class_recycle_Generator_System(pph, cs)
    ccall((:ppl_new_Octagonal_Shape_mpz_class_recycle_Generator_System, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpz_class_t}, ppl_Generator_System_t), pph, cs)
end

function ppl_assign_Octagonal_Shape_mpz_class_from_Octagonal_Shape_mpz_class(dst, src)
    ccall((:ppl_assign_Octagonal_Shape_mpz_class_from_Octagonal_Shape_mpz_class, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_const_Octagonal_Shape_mpz_class_t), dst, src)
end

function ppl_Octagonal_Shape_mpz_class_add_recycled_constraints(ph, cs)
    ccall((:ppl_Octagonal_Shape_mpz_class_add_recycled_constraints, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_Constraint_System_t), ph, cs)
end

function ppl_Octagonal_Shape_mpz_class_add_recycled_congruences(ph, cs)
    ccall((:ppl_Octagonal_Shape_mpz_class_add_recycled_congruences, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, ppl_Congruence_System_t), ph, cs)
end

function ppl_termination_test_MS_Octagonal_Shape_mpz_class(pset)
    ccall((:ppl_termination_test_MS_Octagonal_Shape_mpz_class, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t,), pset)
end

function ppl_termination_test_PR_Octagonal_Shape_mpz_class(pset)
    ccall((:ppl_termination_test_PR_Octagonal_Shape_mpz_class, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t,), pset)
end

function ppl_one_affine_ranking_function_MS_Octagonal_Shape_mpz_class(pset, point)
    ccall((:ppl_one_affine_ranking_function_MS_Octagonal_Shape_mpz_class, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, ppl_Generator_t), pset, point)
end

function ppl_one_affine_ranking_function_PR_Octagonal_Shape_mpz_class(pset, point)
    ccall((:ppl_one_affine_ranking_function_PR_Octagonal_Shape_mpz_class, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, ppl_Generator_t), pset, point)
end

function ppl_all_affine_ranking_functions_MS_Octagonal_Shape_mpz_class(pset, ph)
    ccall((:ppl_all_affine_ranking_functions_MS_Octagonal_Shape_mpz_class, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, ppl_Polyhedron_t), pset, ph)
end

function ppl_all_affine_ranking_functions_PR_Octagonal_Shape_mpz_class(pset, ph)
    ccall((:ppl_all_affine_ranking_functions_PR_Octagonal_Shape_mpz_class, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, ppl_Polyhedron_t), pset, ph)
end

function ppl_termination_test_MS_Octagonal_Shape_mpz_class_2(pset_before, pset_after)
    ccall((:ppl_termination_test_MS_Octagonal_Shape_mpz_class_2, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, ppl_const_Octagonal_Shape_mpz_class_t), pset_before, pset_after)
end

function ppl_termination_test_PR_Octagonal_Shape_mpz_class_2(pset_before, pset_after)
    ccall((:ppl_termination_test_PR_Octagonal_Shape_mpz_class_2, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, ppl_const_Octagonal_Shape_mpz_class_t), pset_before, pset_after)
end

function ppl_one_affine_ranking_function_MS_Octagonal_Shape_mpz_class_2(pset_before, pset_after, point)
    ccall((:ppl_one_affine_ranking_function_MS_Octagonal_Shape_mpz_class_2, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, ppl_const_Octagonal_Shape_mpz_class_t, ppl_Generator_t), pset_before, pset_after, point)
end

function ppl_one_affine_ranking_function_PR_Octagonal_Shape_mpz_class_2(pset_before, pset_after, point)
    ccall((:ppl_one_affine_ranking_function_PR_Octagonal_Shape_mpz_class_2, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, ppl_const_Octagonal_Shape_mpz_class_t, ppl_Generator_t), pset_before, pset_after, point)
end

function ppl_all_affine_ranking_functions_MS_Octagonal_Shape_mpz_class_2(pset_before, pset_after, ph)
    ccall((:ppl_all_affine_ranking_functions_MS_Octagonal_Shape_mpz_class_2, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, ppl_const_Octagonal_Shape_mpz_class_t, ppl_Polyhedron_t), pset_before, pset_after, ph)
end

function ppl_all_affine_ranking_functions_PR_Octagonal_Shape_mpz_class_2(pset_before, pset_after, ph)
    ccall((:ppl_all_affine_ranking_functions_PR_Octagonal_Shape_mpz_class_2, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, ppl_const_Octagonal_Shape_mpz_class_t, ppl_Polyhedron_t), pset_before, pset_after, ph)
end

function ppl_io_print_Octagonal_Shape_mpz_class(x)
    ccall((:ppl_io_print_Octagonal_Shape_mpz_class, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t,), x)
end

function ppl_io_fprint_Octagonal_Shape_mpz_class(stream, x)
    ccall((:ppl_io_fprint_Octagonal_Shape_mpz_class, libppl_c), Cint, (Ptr{Libc.FILE}, ppl_const_Octagonal_Shape_mpz_class_t), stream, x)
end

function ppl_io_asprint_Octagonal_Shape_mpz_class(strp, x)
    ccall((:ppl_io_asprint_Octagonal_Shape_mpz_class, libppl_c), Cint, (Ptr{Ptr{Cchar}}, ppl_const_Octagonal_Shape_mpz_class_t), strp, x)
end

function ppl_Octagonal_Shape_mpz_class_ascii_dump(x, stream)
    ccall((:ppl_Octagonal_Shape_mpz_class_ascii_dump, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpz_class_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_Octagonal_Shape_mpz_class_ascii_load(x, stream)
    ccall((:ppl_Octagonal_Shape_mpz_class_ascii_load, libppl_c), Cint, (ppl_Octagonal_Shape_mpz_class_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_delete_Octagonal_Shape_mpq_class(ph)
    ccall((:ppl_delete_Octagonal_Shape_mpq_class, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t,), ph)
end

function ppl_new_Octagonal_Shape_mpq_class_from_space_dimension(pph, d, empty)
    ccall((:ppl_new_Octagonal_Shape_mpq_class_from_space_dimension, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpq_class_t}, ppl_dimension_type, Cint), pph, d, empty)
end

function ppl_new_Octagonal_Shape_mpq_class_from_C_Polyhedron(pph, ph)
    ccall((:ppl_new_Octagonal_Shape_mpq_class_from_C_Polyhedron, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpq_class_t}, ppl_const_Polyhedron_t), pph, ph)
end

function ppl_new_Octagonal_Shape_mpq_class_from_NNC_Polyhedron(pph, ph)
    ccall((:ppl_new_Octagonal_Shape_mpq_class_from_NNC_Polyhedron, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpq_class_t}, ppl_const_Polyhedron_t), pph, ph)
end

function ppl_new_Octagonal_Shape_mpq_class_from_Grid(pph, ph)
    ccall((:ppl_new_Octagonal_Shape_mpq_class_from_Grid, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpq_class_t}, ppl_const_Grid_t), pph, ph)
end

function ppl_new_Octagonal_Shape_mpq_class_from_Rational_Box(pph, ph)
    ccall((:ppl_new_Octagonal_Shape_mpq_class_from_Rational_Box, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpq_class_t}, ppl_const_Rational_Box_t), pph, ph)
end

function ppl_new_Octagonal_Shape_mpq_class_from_BD_Shape_mpz_class(pph, ph)
    ccall((:ppl_new_Octagonal_Shape_mpq_class_from_BD_Shape_mpz_class, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpq_class_t}, ppl_const_BD_Shape_mpz_class_t), pph, ph)
end

function ppl_new_Octagonal_Shape_mpq_class_from_BD_Shape_mpq_class(pph, ph)
    ccall((:ppl_new_Octagonal_Shape_mpq_class_from_BD_Shape_mpq_class, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpq_class_t}, ppl_const_BD_Shape_mpq_class_t), pph, ph)
end

function ppl_new_Octagonal_Shape_mpq_class_from_Octagonal_Shape_mpz_class(pph, ph)
    ccall((:ppl_new_Octagonal_Shape_mpq_class_from_Octagonal_Shape_mpz_class, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpq_class_t}, ppl_const_Octagonal_Shape_mpz_class_t), pph, ph)
end

function ppl_new_Octagonal_Shape_mpq_class_from_Octagonal_Shape_mpq_class(pph, ph)
    ccall((:ppl_new_Octagonal_Shape_mpq_class_from_Octagonal_Shape_mpq_class, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpq_class_t}, ppl_const_Octagonal_Shape_mpq_class_t), pph, ph)
end

function ppl_new_Octagonal_Shape_mpq_class_from_C_Polyhedron_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Octagonal_Shape_mpq_class_from_C_Polyhedron_with_complexity, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpq_class_t}, ppl_const_Polyhedron_t, Cint), pph, ph, complexity)
end

function ppl_new_Octagonal_Shape_mpq_class_from_NNC_Polyhedron_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Octagonal_Shape_mpq_class_from_NNC_Polyhedron_with_complexity, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpq_class_t}, ppl_const_Polyhedron_t, Cint), pph, ph, complexity)
end

function ppl_new_Octagonal_Shape_mpq_class_from_Grid_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Octagonal_Shape_mpq_class_from_Grid_with_complexity, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpq_class_t}, ppl_const_Grid_t, Cint), pph, ph, complexity)
end

function ppl_new_Octagonal_Shape_mpq_class_from_Rational_Box_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Octagonal_Shape_mpq_class_from_Rational_Box_with_complexity, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpq_class_t}, ppl_const_Rational_Box_t, Cint), pph, ph, complexity)
end

function ppl_new_Octagonal_Shape_mpq_class_from_BD_Shape_mpz_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Octagonal_Shape_mpq_class_from_BD_Shape_mpz_class_with_complexity, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpq_class_t}, ppl_const_BD_Shape_mpz_class_t, Cint), pph, ph, complexity)
end

function ppl_new_Octagonal_Shape_mpq_class_from_BD_Shape_mpq_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Octagonal_Shape_mpq_class_from_BD_Shape_mpq_class_with_complexity, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpq_class_t}, ppl_const_BD_Shape_mpq_class_t, Cint), pph, ph, complexity)
end

function ppl_new_Octagonal_Shape_mpq_class_from_Octagonal_Shape_mpz_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Octagonal_Shape_mpq_class_from_Octagonal_Shape_mpz_class_with_complexity, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpq_class_t}, ppl_const_Octagonal_Shape_mpz_class_t, Cint), pph, ph, complexity)
end

function ppl_new_Octagonal_Shape_mpq_class_from_Octagonal_Shape_mpq_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Octagonal_Shape_mpq_class_from_Octagonal_Shape_mpq_class_with_complexity, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpq_class_t}, ppl_const_Octagonal_Shape_mpq_class_t, Cint), pph, ph, complexity)
end

function ppl_new_Octagonal_Shape_mpq_class_from_Constraint_System(pph, cs)
    ccall((:ppl_new_Octagonal_Shape_mpq_class_from_Constraint_System, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpq_class_t}, ppl_const_Constraint_System_t), pph, cs)
end

function ppl_new_Octagonal_Shape_mpq_class_from_Congruence_System(pph, cs)
    ccall((:ppl_new_Octagonal_Shape_mpq_class_from_Congruence_System, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpq_class_t}, ppl_const_Congruence_System_t), pph, cs)
end

function ppl_new_Octagonal_Shape_mpq_class_from_Generator_System(pph, cs)
    ccall((:ppl_new_Octagonal_Shape_mpq_class_from_Generator_System, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpq_class_t}, ppl_const_Generator_System_t), pph, cs)
end

function ppl_Octagonal_Shape_mpq_class_space_dimension(ph, m)
    ccall((:ppl_Octagonal_Shape_mpq_class_space_dimension, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, Ptr{ppl_dimension_type}), ph, m)
end

function ppl_Octagonal_Shape_mpq_class_affine_dimension(ph, m)
    ccall((:ppl_Octagonal_Shape_mpq_class_affine_dimension, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, Ptr{ppl_dimension_type}), ph, m)
end

function ppl_Octagonal_Shape_mpq_class_relation_with_Constraint(ph, c)
    ccall((:ppl_Octagonal_Shape_mpq_class_relation_with_Constraint, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, ppl_const_Constraint_t), ph, c)
end

function ppl_Octagonal_Shape_mpq_class_relation_with_Generator(ph, c)
    ccall((:ppl_Octagonal_Shape_mpq_class_relation_with_Generator, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, ppl_const_Generator_t), ph, c)
end

function ppl_Octagonal_Shape_mpq_class_relation_with_Congruence(ph, c)
    ccall((:ppl_Octagonal_Shape_mpq_class_relation_with_Congruence, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, ppl_const_Congruence_t), ph, c)
end

function ppl_Octagonal_Shape_mpq_class_get_constraints(ph, pcs)
    ccall((:ppl_Octagonal_Shape_mpq_class_get_constraints, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, Ptr{ppl_const_Constraint_System_t}), ph, pcs)
end

function ppl_Octagonal_Shape_mpq_class_get_congruences(ph, pcs)
    ccall((:ppl_Octagonal_Shape_mpq_class_get_congruences, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, Ptr{ppl_const_Congruence_System_t}), ph, pcs)
end

function ppl_Octagonal_Shape_mpq_class_get_minimized_constraints(ph, pcs)
    ccall((:ppl_Octagonal_Shape_mpq_class_get_minimized_constraints, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, Ptr{ppl_const_Constraint_System_t}), ph, pcs)
end

function ppl_Octagonal_Shape_mpq_class_get_minimized_congruences(ph, pcs)
    ccall((:ppl_Octagonal_Shape_mpq_class_get_minimized_congruences, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, Ptr{ppl_const_Congruence_System_t}), ph, pcs)
end

function ppl_Octagonal_Shape_mpq_class_is_empty(ph)
    ccall((:ppl_Octagonal_Shape_mpq_class_is_empty, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t,), ph)
end

function ppl_Octagonal_Shape_mpq_class_is_universe(ph)
    ccall((:ppl_Octagonal_Shape_mpq_class_is_universe, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t,), ph)
end

function ppl_Octagonal_Shape_mpq_class_is_bounded(ph)
    ccall((:ppl_Octagonal_Shape_mpq_class_is_bounded, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t,), ph)
end

function ppl_Octagonal_Shape_mpq_class_contains_integer_point(ph)
    ccall((:ppl_Octagonal_Shape_mpq_class_contains_integer_point, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t,), ph)
end

function ppl_Octagonal_Shape_mpq_class_is_topologically_closed(ph)
    ccall((:ppl_Octagonal_Shape_mpq_class_is_topologically_closed, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t,), ph)
end

function ppl_Octagonal_Shape_mpq_class_is_discrete(ph)
    ccall((:ppl_Octagonal_Shape_mpq_class_is_discrete, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t,), ph)
end

function ppl_Octagonal_Shape_mpq_class_topological_closure_assign(ph)
    ccall((:ppl_Octagonal_Shape_mpq_class_topological_closure_assign, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t,), ph)
end

function ppl_Octagonal_Shape_mpq_class_bounds_from_above(ph, le)
    ccall((:ppl_Octagonal_Shape_mpq_class_bounds_from_above, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, ppl_const_Linear_Expression_t), ph, le)
end

function ppl_Octagonal_Shape_mpq_class_bounds_from_below(ph, le)
    ccall((:ppl_Octagonal_Shape_mpq_class_bounds_from_below, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, ppl_const_Linear_Expression_t), ph, le)
end

function ppl_Octagonal_Shape_mpq_class_maximize(ph, le, ext_n, ext_d, poptimum)
    ccall((:ppl_Octagonal_Shape_mpq_class_maximize, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}), ph, le, ext_n, ext_d, poptimum)
end

function ppl_Octagonal_Shape_mpq_class_minimize(ph, le, ext_n, ext_d, poptimum)
    ccall((:ppl_Octagonal_Shape_mpq_class_minimize, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}), ph, le, ext_n, ext_d, poptimum)
end

function ppl_Octagonal_Shape_mpq_class_maximize_with_point(ph, le, ext_n, ext_d, poptimum, point)
    ccall((:ppl_Octagonal_Shape_mpq_class_maximize_with_point, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}, ppl_Generator_t), ph, le, ext_n, ext_d, poptimum, point)
end

function ppl_Octagonal_Shape_mpq_class_minimize_with_point(ph, le, ext_n, ext_d, poptimum, point)
    ccall((:ppl_Octagonal_Shape_mpq_class_minimize_with_point, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}, ppl_Generator_t), ph, le, ext_n, ext_d, poptimum, point)
end

function ppl_Octagonal_Shape_mpq_class_frequency(ph, le, ext_fn, ext_fd, ext_vn, ext_vd)
    ccall((:ppl_Octagonal_Shape_mpq_class_frequency, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, ppl_Coefficient_t, ppl_Coefficient_t), ph, le, ext_fn, ext_fd, ext_vn, ext_vd)
end

function ppl_Octagonal_Shape_mpq_class_contains_Octagonal_Shape_mpq_class(x, y)
    ccall((:ppl_Octagonal_Shape_mpq_class_contains_Octagonal_Shape_mpq_class, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, ppl_const_Octagonal_Shape_mpq_class_t), x, y)
end

function ppl_Octagonal_Shape_mpq_class_strictly_contains_Octagonal_Shape_mpq_class(x, y)
    ccall((:ppl_Octagonal_Shape_mpq_class_strictly_contains_Octagonal_Shape_mpq_class, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, ppl_const_Octagonal_Shape_mpq_class_t), x, y)
end

function ppl_Octagonal_Shape_mpq_class_is_disjoint_from_Octagonal_Shape_mpq_class(x, y)
    ccall((:ppl_Octagonal_Shape_mpq_class_is_disjoint_from_Octagonal_Shape_mpq_class, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, ppl_const_Octagonal_Shape_mpq_class_t), x, y)
end

function ppl_Octagonal_Shape_mpq_class_equals_Octagonal_Shape_mpq_class(x, y)
    ccall((:ppl_Octagonal_Shape_mpq_class_equals_Octagonal_Shape_mpq_class, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, ppl_const_Octagonal_Shape_mpq_class_t), x, y)
end

function ppl_Octagonal_Shape_mpq_class_OK(ph)
    ccall((:ppl_Octagonal_Shape_mpq_class_OK, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t,), ph)
end

function ppl_Octagonal_Shape_mpq_class_add_constraint(ph, c)
    ccall((:ppl_Octagonal_Shape_mpq_class_add_constraint, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_const_Constraint_t), ph, c)
end

function ppl_Octagonal_Shape_mpq_class_add_congruence(ph, c)
    ccall((:ppl_Octagonal_Shape_mpq_class_add_congruence, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_const_Congruence_t), ph, c)
end

function ppl_Octagonal_Shape_mpq_class_add_constraints(ph, cs)
    ccall((:ppl_Octagonal_Shape_mpq_class_add_constraints, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_const_Constraint_System_t), ph, cs)
end

function ppl_Octagonal_Shape_mpq_class_add_congruences(ph, cs)
    ccall((:ppl_Octagonal_Shape_mpq_class_add_congruences, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_const_Congruence_System_t), ph, cs)
end

function ppl_Octagonal_Shape_mpq_class_refine_with_constraint(ph, c)
    ccall((:ppl_Octagonal_Shape_mpq_class_refine_with_constraint, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_const_Constraint_t), ph, c)
end

function ppl_Octagonal_Shape_mpq_class_refine_with_congruence(ph, c)
    ccall((:ppl_Octagonal_Shape_mpq_class_refine_with_congruence, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_const_Congruence_t), ph, c)
end

function ppl_Octagonal_Shape_mpq_class_refine_with_constraints(ph, cs)
    ccall((:ppl_Octagonal_Shape_mpq_class_refine_with_constraints, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_const_Constraint_System_t), ph, cs)
end

function ppl_Octagonal_Shape_mpq_class_refine_with_congruences(ph, cs)
    ccall((:ppl_Octagonal_Shape_mpq_class_refine_with_congruences, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_const_Congruence_System_t), ph, cs)
end

function ppl_Octagonal_Shape_mpq_class_intersection_assign(x, y)
    ccall((:ppl_Octagonal_Shape_mpq_class_intersection_assign, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_const_Octagonal_Shape_mpq_class_t), x, y)
end

function ppl_Octagonal_Shape_mpq_class_upper_bound_assign(x, y)
    ccall((:ppl_Octagonal_Shape_mpq_class_upper_bound_assign, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_const_Octagonal_Shape_mpq_class_t), x, y)
end

function ppl_Octagonal_Shape_mpq_class_difference_assign(x, y)
    ccall((:ppl_Octagonal_Shape_mpq_class_difference_assign, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_const_Octagonal_Shape_mpq_class_t), x, y)
end

function ppl_Octagonal_Shape_mpq_class_concatenate_assign(x, y)
    ccall((:ppl_Octagonal_Shape_mpq_class_concatenate_assign, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_const_Octagonal_Shape_mpq_class_t), x, y)
end

function ppl_Octagonal_Shape_mpq_class_time_elapse_assign(x, y)
    ccall((:ppl_Octagonal_Shape_mpq_class_time_elapse_assign, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_const_Octagonal_Shape_mpq_class_t), x, y)
end

function ppl_Octagonal_Shape_mpq_class_upper_bound_assign_if_exact(x, y)
    ccall((:ppl_Octagonal_Shape_mpq_class_upper_bound_assign_if_exact, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_const_Octagonal_Shape_mpq_class_t), x, y)
end

function ppl_Octagonal_Shape_mpq_class_simplify_using_context_assign(x, y)
    ccall((:ppl_Octagonal_Shape_mpq_class_simplify_using_context_assign, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_const_Octagonal_Shape_mpq_class_t), x, y)
end

function ppl_Octagonal_Shape_mpq_class_constrains(ph, var)
    ccall((:ppl_Octagonal_Shape_mpq_class_constrains, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_dimension_type), ph, var)
end

function ppl_Octagonal_Shape_mpq_class_unconstrain_space_dimension(ph, var)
    ccall((:ppl_Octagonal_Shape_mpq_class_unconstrain_space_dimension, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_dimension_type), ph, var)
end

function ppl_Octagonal_Shape_mpq_class_unconstrain_space_dimensions(ph, ds, n)
    ccall((:ppl_Octagonal_Shape_mpq_class_unconstrain_space_dimensions, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, Ptr{ppl_dimension_type}, Csize_t), ph, ds, n)
end

function ppl_Octagonal_Shape_mpq_class_affine_image(ph, var, le, d)
    ccall((:ppl_Octagonal_Shape_mpq_class_affine_image, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, le, d)
end

function ppl_Octagonal_Shape_mpq_class_affine_preimage(ph, var, le, d)
    ccall((:ppl_Octagonal_Shape_mpq_class_affine_preimage, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, le, d)
end

function ppl_Octagonal_Shape_mpq_class_bounded_affine_image(ph, var, lb, ub, d)
    ccall((:ppl_Octagonal_Shape_mpq_class_bounded_affine_image, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, lb, ub, d)
end

function ppl_Octagonal_Shape_mpq_class_bounded_affine_preimage(ph, var, lb, ub, d)
    ccall((:ppl_Octagonal_Shape_mpq_class_bounded_affine_preimage, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, lb, ub, d)
end

function ppl_Octagonal_Shape_mpq_class_generalized_affine_image(ph, var, relsym, le, d)
    ccall((:ppl_Octagonal_Shape_mpq_class_generalized_affine_image, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_dimension_type, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, relsym, le, d)
end

function ppl_Octagonal_Shape_mpq_class_generalized_affine_preimage(ph, var, relsym, le, d)
    ccall((:ppl_Octagonal_Shape_mpq_class_generalized_affine_preimage, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_dimension_type, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, relsym, le, d)
end

function ppl_Octagonal_Shape_mpq_class_generalized_affine_image_lhs_rhs(ph, lhs, relsym, rhs)
    ccall((:ppl_Octagonal_Shape_mpq_class_generalized_affine_image_lhs_rhs, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_const_Linear_Expression_t, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t), ph, lhs, relsym, rhs)
end

function ppl_Octagonal_Shape_mpq_class_generalized_affine_preimage_lhs_rhs(ph, lhs, relsym, rhs)
    ccall((:ppl_Octagonal_Shape_mpq_class_generalized_affine_preimage_lhs_rhs, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_const_Linear_Expression_t, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t), ph, lhs, relsym, rhs)
end

function ppl_Octagonal_Shape_mpq_class_add_space_dimensions_and_embed(ph, d)
    ccall((:ppl_Octagonal_Shape_mpq_class_add_space_dimensions_and_embed, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_dimension_type), ph, d)
end

function ppl_Octagonal_Shape_mpq_class_add_space_dimensions_and_project(ph, d)
    ccall((:ppl_Octagonal_Shape_mpq_class_add_space_dimensions_and_project, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_dimension_type), ph, d)
end

function ppl_Octagonal_Shape_mpq_class_remove_space_dimensions(ph, ds, n)
    ccall((:ppl_Octagonal_Shape_mpq_class_remove_space_dimensions, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, Ptr{ppl_dimension_type}, Csize_t), ph, ds, n)
end

function ppl_Octagonal_Shape_mpq_class_remove_higher_space_dimensions(ph, d)
    ccall((:ppl_Octagonal_Shape_mpq_class_remove_higher_space_dimensions, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_dimension_type), ph, d)
end

function ppl_Octagonal_Shape_mpq_class_expand_space_dimension(ph, d, m)
    ccall((:ppl_Octagonal_Shape_mpq_class_expand_space_dimension, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_dimension_type, ppl_dimension_type), ph, d, m)
end

function ppl_Octagonal_Shape_mpq_class_fold_space_dimensions(ph, ds, n, d)
    ccall((:ppl_Octagonal_Shape_mpq_class_fold_space_dimensions, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, Ptr{ppl_dimension_type}, Csize_t, ppl_dimension_type), ph, ds, n, d)
end

function ppl_Octagonal_Shape_mpq_class_map_space_dimensions(ph, maps, n)
    ccall((:ppl_Octagonal_Shape_mpq_class_map_space_dimensions, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, Ptr{ppl_dimension_type}, Csize_t), ph, maps, n)
end

function ppl_Octagonal_Shape_mpq_class_drop_some_non_integer_points(ph, complexity)
    ccall((:ppl_Octagonal_Shape_mpq_class_drop_some_non_integer_points, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, Cint), ph, complexity)
end

function ppl_Octagonal_Shape_mpq_class_drop_some_non_integer_points_2(ph, ds, n, complexity)
    ccall((:ppl_Octagonal_Shape_mpq_class_drop_some_non_integer_points_2, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, Ptr{ppl_dimension_type}, Csize_t, Cint), ph, ds, n, complexity)
end

function ppl_Octagonal_Shape_mpq_class_external_memory_in_bytes(ps, sz)
    ccall((:ppl_Octagonal_Shape_mpq_class_external_memory_in_bytes, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, Ptr{Csize_t}), ps, sz)
end

function ppl_Octagonal_Shape_mpq_class_total_memory_in_bytes(ps, sz)
    ccall((:ppl_Octagonal_Shape_mpq_class_total_memory_in_bytes, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, Ptr{Csize_t}), ps, sz)
end

function ppl_Octagonal_Shape_mpq_class_BHMZ05_widening_assign_with_tokens(x, y, tp)
    ccall((:ppl_Octagonal_Shape_mpq_class_BHMZ05_widening_assign_with_tokens, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_const_Octagonal_Shape_mpq_class_t, Ptr{Cuint}), x, y, tp)
end

function ppl_Octagonal_Shape_mpq_class_BHMZ05_widening_assign(x, y)
    ccall((:ppl_Octagonal_Shape_mpq_class_BHMZ05_widening_assign, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_const_Octagonal_Shape_mpq_class_t), x, y)
end

function ppl_Octagonal_Shape_mpq_class_widening_assign_with_tokens(x, y, tp)
    ccall((:ppl_Octagonal_Shape_mpq_class_widening_assign_with_tokens, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_const_Octagonal_Shape_mpq_class_t, Ptr{Cuint}), x, y, tp)
end

function ppl_Octagonal_Shape_mpq_class_widening_assign(x, y)
    ccall((:ppl_Octagonal_Shape_mpq_class_widening_assign, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_const_Octagonal_Shape_mpq_class_t), x, y)
end

function ppl_Octagonal_Shape_mpq_class_limited_BHMZ05_extrapolation_assign_with_tokens(x, y, cs, tp)
    ccall((:ppl_Octagonal_Shape_mpq_class_limited_BHMZ05_extrapolation_assign_with_tokens, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_const_Octagonal_Shape_mpq_class_t, ppl_const_Constraint_System_t, Ptr{Cuint}), x, y, cs, tp)
end

function ppl_Octagonal_Shape_mpq_class_limited_CC76_extrapolation_assign_with_tokens(x, y, cs, tp)
    ccall((:ppl_Octagonal_Shape_mpq_class_limited_CC76_extrapolation_assign_with_tokens, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_const_Octagonal_Shape_mpq_class_t, ppl_const_Constraint_System_t, Ptr{Cuint}), x, y, cs, tp)
end

function ppl_Octagonal_Shape_mpq_class_limited_BHMZ05_extrapolation_assign(x, y, cs)
    ccall((:ppl_Octagonal_Shape_mpq_class_limited_BHMZ05_extrapolation_assign, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_const_Octagonal_Shape_mpq_class_t, ppl_const_Constraint_System_t), x, y, cs)
end

function ppl_Octagonal_Shape_mpq_class_limited_CC76_extrapolation_assign(x, y, cs)
    ccall((:ppl_Octagonal_Shape_mpq_class_limited_CC76_extrapolation_assign, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_const_Octagonal_Shape_mpq_class_t, ppl_const_Constraint_System_t), x, y, cs)
end

function ppl_Octagonal_Shape_mpq_class_CC76_extrapolation_assign_with_tokens(x, y, tp)
    ccall((:ppl_Octagonal_Shape_mpq_class_CC76_extrapolation_assign_with_tokens, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_const_Octagonal_Shape_mpq_class_t, Ptr{Cuint}), x, y, tp)
end

function ppl_Octagonal_Shape_mpq_class_CC76_extrapolation_assign(x, y)
    ccall((:ppl_Octagonal_Shape_mpq_class_CC76_extrapolation_assign, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_const_Octagonal_Shape_mpq_class_t), x, y)
end

function ppl_Octagonal_Shape_mpq_class_CC76_narrowing_assign(x, y)
    ccall((:ppl_Octagonal_Shape_mpq_class_CC76_narrowing_assign, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_const_Octagonal_Shape_mpq_class_t), x, y)
end

function ppl_Octagonal_Shape_mpq_class_linear_partition(x, y, p_inters, p_rest)
    ccall((:ppl_Octagonal_Shape_mpq_class_linear_partition, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, ppl_const_Octagonal_Shape_mpq_class_t, Ptr{ppl_Octagonal_Shape_mpq_class_t}, Ptr{ppl_Pointset_Powerset_NNC_Polyhedron_t}), x, y, p_inters, p_rest)
end

function ppl_Octagonal_Shape_mpq_class_wrap_assign(ph, ds, n, w, r, o, pcs, complexity_threshold, wrap_individually)
    ccall((:ppl_Octagonal_Shape_mpq_class_wrap_assign, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, Ptr{ppl_dimension_type}, Csize_t, ppl_enum_Bounded_Integer_Type_Width, ppl_enum_Bounded_Integer_Type_Representation, ppl_enum_Bounded_Integer_Type_Overflow, Ptr{ppl_const_Constraint_System_t}, Cuint, Cint), ph, ds, n, w, r, o, pcs, complexity_threshold, wrap_individually)
end

function ppl_new_Octagonal_Shape_mpq_class_recycle_Constraint_System(pph, cs)
    ccall((:ppl_new_Octagonal_Shape_mpq_class_recycle_Constraint_System, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpq_class_t}, ppl_Constraint_System_t), pph, cs)
end

function ppl_new_Octagonal_Shape_mpq_class_recycle_Congruence_System(pph, cs)
    ccall((:ppl_new_Octagonal_Shape_mpq_class_recycle_Congruence_System, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpq_class_t}, ppl_Congruence_System_t), pph, cs)
end

function ppl_new_Octagonal_Shape_mpq_class_recycle_Generator_System(pph, cs)
    ccall((:ppl_new_Octagonal_Shape_mpq_class_recycle_Generator_System, libppl_c), Cint, (Ptr{ppl_Octagonal_Shape_mpq_class_t}, ppl_Generator_System_t), pph, cs)
end

function ppl_assign_Octagonal_Shape_mpq_class_from_Octagonal_Shape_mpq_class(dst, src)
    ccall((:ppl_assign_Octagonal_Shape_mpq_class_from_Octagonal_Shape_mpq_class, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_const_Octagonal_Shape_mpq_class_t), dst, src)
end

function ppl_Octagonal_Shape_mpq_class_add_recycled_constraints(ph, cs)
    ccall((:ppl_Octagonal_Shape_mpq_class_add_recycled_constraints, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_Constraint_System_t), ph, cs)
end

function ppl_Octagonal_Shape_mpq_class_add_recycled_congruences(ph, cs)
    ccall((:ppl_Octagonal_Shape_mpq_class_add_recycled_congruences, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, ppl_Congruence_System_t), ph, cs)
end

function ppl_termination_test_MS_Octagonal_Shape_mpq_class(pset)
    ccall((:ppl_termination_test_MS_Octagonal_Shape_mpq_class, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t,), pset)
end

function ppl_termination_test_PR_Octagonal_Shape_mpq_class(pset)
    ccall((:ppl_termination_test_PR_Octagonal_Shape_mpq_class, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t,), pset)
end

function ppl_one_affine_ranking_function_MS_Octagonal_Shape_mpq_class(pset, point)
    ccall((:ppl_one_affine_ranking_function_MS_Octagonal_Shape_mpq_class, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, ppl_Generator_t), pset, point)
end

function ppl_one_affine_ranking_function_PR_Octagonal_Shape_mpq_class(pset, point)
    ccall((:ppl_one_affine_ranking_function_PR_Octagonal_Shape_mpq_class, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, ppl_Generator_t), pset, point)
end

function ppl_all_affine_ranking_functions_MS_Octagonal_Shape_mpq_class(pset, ph)
    ccall((:ppl_all_affine_ranking_functions_MS_Octagonal_Shape_mpq_class, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, ppl_Polyhedron_t), pset, ph)
end

function ppl_all_affine_ranking_functions_PR_Octagonal_Shape_mpq_class(pset, ph)
    ccall((:ppl_all_affine_ranking_functions_PR_Octagonal_Shape_mpq_class, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, ppl_Polyhedron_t), pset, ph)
end

function ppl_termination_test_MS_Octagonal_Shape_mpq_class_2(pset_before, pset_after)
    ccall((:ppl_termination_test_MS_Octagonal_Shape_mpq_class_2, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, ppl_const_Octagonal_Shape_mpq_class_t), pset_before, pset_after)
end

function ppl_termination_test_PR_Octagonal_Shape_mpq_class_2(pset_before, pset_after)
    ccall((:ppl_termination_test_PR_Octagonal_Shape_mpq_class_2, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, ppl_const_Octagonal_Shape_mpq_class_t), pset_before, pset_after)
end

function ppl_one_affine_ranking_function_MS_Octagonal_Shape_mpq_class_2(pset_before, pset_after, point)
    ccall((:ppl_one_affine_ranking_function_MS_Octagonal_Shape_mpq_class_2, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, ppl_const_Octagonal_Shape_mpq_class_t, ppl_Generator_t), pset_before, pset_after, point)
end

function ppl_one_affine_ranking_function_PR_Octagonal_Shape_mpq_class_2(pset_before, pset_after, point)
    ccall((:ppl_one_affine_ranking_function_PR_Octagonal_Shape_mpq_class_2, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, ppl_const_Octagonal_Shape_mpq_class_t, ppl_Generator_t), pset_before, pset_after, point)
end

function ppl_all_affine_ranking_functions_MS_Octagonal_Shape_mpq_class_2(pset_before, pset_after, ph)
    ccall((:ppl_all_affine_ranking_functions_MS_Octagonal_Shape_mpq_class_2, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, ppl_const_Octagonal_Shape_mpq_class_t, ppl_Polyhedron_t), pset_before, pset_after, ph)
end

function ppl_all_affine_ranking_functions_PR_Octagonal_Shape_mpq_class_2(pset_before, pset_after, ph)
    ccall((:ppl_all_affine_ranking_functions_PR_Octagonal_Shape_mpq_class_2, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, ppl_const_Octagonal_Shape_mpq_class_t, ppl_Polyhedron_t), pset_before, pset_after, ph)
end

function ppl_io_print_Octagonal_Shape_mpq_class(x)
    ccall((:ppl_io_print_Octagonal_Shape_mpq_class, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t,), x)
end

function ppl_io_fprint_Octagonal_Shape_mpq_class(stream, x)
    ccall((:ppl_io_fprint_Octagonal_Shape_mpq_class, libppl_c), Cint, (Ptr{Libc.FILE}, ppl_const_Octagonal_Shape_mpq_class_t), stream, x)
end

function ppl_io_asprint_Octagonal_Shape_mpq_class(strp, x)
    ccall((:ppl_io_asprint_Octagonal_Shape_mpq_class, libppl_c), Cint, (Ptr{Ptr{Cchar}}, ppl_const_Octagonal_Shape_mpq_class_t), strp, x)
end

function ppl_Octagonal_Shape_mpq_class_ascii_dump(x, stream)
    ccall((:ppl_Octagonal_Shape_mpq_class_ascii_dump, libppl_c), Cint, (ppl_const_Octagonal_Shape_mpq_class_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_Octagonal_Shape_mpq_class_ascii_load(x, stream)
    ccall((:ppl_Octagonal_Shape_mpq_class_ascii_load, libppl_c), Cint, (ppl_Octagonal_Shape_mpq_class_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_delete_Constraints_Product_C_Polyhedron_Grid(ph)
    ccall((:ppl_delete_Constraints_Product_C_Polyhedron_Grid, libppl_c), Cint, (ppl_const_Constraints_Product_C_Polyhedron_Grid_t,), ph)
end

function ppl_new_Constraints_Product_C_Polyhedron_Grid_from_space_dimension(pph, d, empty)
    ccall((:ppl_new_Constraints_Product_C_Polyhedron_Grid_from_space_dimension, libppl_c), Cint, (Ptr{ppl_Constraints_Product_C_Polyhedron_Grid_t}, ppl_dimension_type, Cint), pph, d, empty)
end

function ppl_new_Constraints_Product_C_Polyhedron_Grid_from_C_Polyhedron(pph, ph)
    ccall((:ppl_new_Constraints_Product_C_Polyhedron_Grid_from_C_Polyhedron, libppl_c), Cint, (Ptr{ppl_Constraints_Product_C_Polyhedron_Grid_t}, ppl_const_Polyhedron_t), pph, ph)
end

function ppl_new_Constraints_Product_C_Polyhedron_Grid_from_NNC_Polyhedron(pph, ph)
    ccall((:ppl_new_Constraints_Product_C_Polyhedron_Grid_from_NNC_Polyhedron, libppl_c), Cint, (Ptr{ppl_Constraints_Product_C_Polyhedron_Grid_t}, ppl_const_Polyhedron_t), pph, ph)
end

function ppl_new_Constraints_Product_C_Polyhedron_Grid_from_Grid(pph, ph)
    ccall((:ppl_new_Constraints_Product_C_Polyhedron_Grid_from_Grid, libppl_c), Cint, (Ptr{ppl_Constraints_Product_C_Polyhedron_Grid_t}, ppl_const_Grid_t), pph, ph)
end

function ppl_new_Constraints_Product_C_Polyhedron_Grid_from_Rational_Box(pph, ph)
    ccall((:ppl_new_Constraints_Product_C_Polyhedron_Grid_from_Rational_Box, libppl_c), Cint, (Ptr{ppl_Constraints_Product_C_Polyhedron_Grid_t}, ppl_const_Rational_Box_t), pph, ph)
end

function ppl_new_Constraints_Product_C_Polyhedron_Grid_from_BD_Shape_mpz_class(pph, ph)
    ccall((:ppl_new_Constraints_Product_C_Polyhedron_Grid_from_BD_Shape_mpz_class, libppl_c), Cint, (Ptr{ppl_Constraints_Product_C_Polyhedron_Grid_t}, ppl_const_BD_Shape_mpz_class_t), pph, ph)
end

function ppl_new_Constraints_Product_C_Polyhedron_Grid_from_BD_Shape_mpq_class(pph, ph)
    ccall((:ppl_new_Constraints_Product_C_Polyhedron_Grid_from_BD_Shape_mpq_class, libppl_c), Cint, (Ptr{ppl_Constraints_Product_C_Polyhedron_Grid_t}, ppl_const_BD_Shape_mpq_class_t), pph, ph)
end

function ppl_new_Constraints_Product_C_Polyhedron_Grid_from_Octagonal_Shape_mpz_class(pph, ph)
    ccall((:ppl_new_Constraints_Product_C_Polyhedron_Grid_from_Octagonal_Shape_mpz_class, libppl_c), Cint, (Ptr{ppl_Constraints_Product_C_Polyhedron_Grid_t}, ppl_const_Octagonal_Shape_mpz_class_t), pph, ph)
end

function ppl_new_Constraints_Product_C_Polyhedron_Grid_from_Octagonal_Shape_mpq_class(pph, ph)
    ccall((:ppl_new_Constraints_Product_C_Polyhedron_Grid_from_Octagonal_Shape_mpq_class, libppl_c), Cint, (Ptr{ppl_Constraints_Product_C_Polyhedron_Grid_t}, ppl_const_Octagonal_Shape_mpq_class_t), pph, ph)
end

function ppl_new_Constraints_Product_C_Polyhedron_Grid_from_Constraints_Product_C_Polyhedron_Grid(pph, ph)
    ccall((:ppl_new_Constraints_Product_C_Polyhedron_Grid_from_Constraints_Product_C_Polyhedron_Grid, libppl_c), Cint, (Ptr{ppl_Constraints_Product_C_Polyhedron_Grid_t}, ppl_const_Constraints_Product_C_Polyhedron_Grid_t), pph, ph)
end

function ppl_new_Constraints_Product_C_Polyhedron_Grid_from_C_Polyhedron_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Constraints_Product_C_Polyhedron_Grid_from_C_Polyhedron_with_complexity, libppl_c), Cint, (Ptr{ppl_Constraints_Product_C_Polyhedron_Grid_t}, ppl_const_Polyhedron_t, Cint), pph, ph, complexity)
end

function ppl_new_Constraints_Product_C_Polyhedron_Grid_from_NNC_Polyhedron_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Constraints_Product_C_Polyhedron_Grid_from_NNC_Polyhedron_with_complexity, libppl_c), Cint, (Ptr{ppl_Constraints_Product_C_Polyhedron_Grid_t}, ppl_const_Polyhedron_t, Cint), pph, ph, complexity)
end

function ppl_new_Constraints_Product_C_Polyhedron_Grid_from_Grid_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Constraints_Product_C_Polyhedron_Grid_from_Grid_with_complexity, libppl_c), Cint, (Ptr{ppl_Constraints_Product_C_Polyhedron_Grid_t}, ppl_const_Grid_t, Cint), pph, ph, complexity)
end

function ppl_new_Constraints_Product_C_Polyhedron_Grid_from_Rational_Box_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Constraints_Product_C_Polyhedron_Grid_from_Rational_Box_with_complexity, libppl_c), Cint, (Ptr{ppl_Constraints_Product_C_Polyhedron_Grid_t}, ppl_const_Rational_Box_t, Cint), pph, ph, complexity)
end

function ppl_new_Constraints_Product_C_Polyhedron_Grid_from_BD_Shape_mpz_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Constraints_Product_C_Polyhedron_Grid_from_BD_Shape_mpz_class_with_complexity, libppl_c), Cint, (Ptr{ppl_Constraints_Product_C_Polyhedron_Grid_t}, ppl_const_BD_Shape_mpz_class_t, Cint), pph, ph, complexity)
end

function ppl_new_Constraints_Product_C_Polyhedron_Grid_from_BD_Shape_mpq_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Constraints_Product_C_Polyhedron_Grid_from_BD_Shape_mpq_class_with_complexity, libppl_c), Cint, (Ptr{ppl_Constraints_Product_C_Polyhedron_Grid_t}, ppl_const_BD_Shape_mpq_class_t, Cint), pph, ph, complexity)
end

function ppl_new_Constraints_Product_C_Polyhedron_Grid_from_Octagonal_Shape_mpz_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Constraints_Product_C_Polyhedron_Grid_from_Octagonal_Shape_mpz_class_with_complexity, libppl_c), Cint, (Ptr{ppl_Constraints_Product_C_Polyhedron_Grid_t}, ppl_const_Octagonal_Shape_mpz_class_t, Cint), pph, ph, complexity)
end

function ppl_new_Constraints_Product_C_Polyhedron_Grid_from_Octagonal_Shape_mpq_class_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Constraints_Product_C_Polyhedron_Grid_from_Octagonal_Shape_mpq_class_with_complexity, libppl_c), Cint, (Ptr{ppl_Constraints_Product_C_Polyhedron_Grid_t}, ppl_const_Octagonal_Shape_mpq_class_t, Cint), pph, ph, complexity)
end

function ppl_new_Constraints_Product_C_Polyhedron_Grid_from_Constraints_Product_C_Polyhedron_Grid_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Constraints_Product_C_Polyhedron_Grid_from_Constraints_Product_C_Polyhedron_Grid_with_complexity, libppl_c), Cint, (Ptr{ppl_Constraints_Product_C_Polyhedron_Grid_t}, ppl_const_Constraints_Product_C_Polyhedron_Grid_t, Cint), pph, ph, complexity)
end

function ppl_new_Constraints_Product_C_Polyhedron_Grid_from_Constraint_System(pph, cs)
    ccall((:ppl_new_Constraints_Product_C_Polyhedron_Grid_from_Constraint_System, libppl_c), Cint, (Ptr{ppl_Constraints_Product_C_Polyhedron_Grid_t}, ppl_const_Constraint_System_t), pph, cs)
end

function ppl_new_Constraints_Product_C_Polyhedron_Grid_from_Congruence_System(pph, cs)
    ccall((:ppl_new_Constraints_Product_C_Polyhedron_Grid_from_Congruence_System, libppl_c), Cint, (Ptr{ppl_Constraints_Product_C_Polyhedron_Grid_t}, ppl_const_Congruence_System_t), pph, cs)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_space_dimension(ph, m)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_space_dimension, libppl_c), Cint, (ppl_const_Constraints_Product_C_Polyhedron_Grid_t, Ptr{ppl_dimension_type}), ph, m)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_affine_dimension(ph, m)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_affine_dimension, libppl_c), Cint, (ppl_const_Constraints_Product_C_Polyhedron_Grid_t, Ptr{ppl_dimension_type}), ph, m)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_relation_with_Constraint(ph, c)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_relation_with_Constraint, libppl_c), Cint, (ppl_const_Constraints_Product_C_Polyhedron_Grid_t, ppl_const_Constraint_t), ph, c)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_relation_with_Generator(ph, c)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_relation_with_Generator, libppl_c), Cint, (ppl_const_Constraints_Product_C_Polyhedron_Grid_t, ppl_const_Generator_t), ph, c)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_relation_with_Congruence(ph, c)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_relation_with_Congruence, libppl_c), Cint, (ppl_const_Constraints_Product_C_Polyhedron_Grid_t, ppl_const_Congruence_t), ph, c)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_is_empty(ph)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_is_empty, libppl_c), Cint, (ppl_const_Constraints_Product_C_Polyhedron_Grid_t,), ph)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_is_universe(ph)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_is_universe, libppl_c), Cint, (ppl_const_Constraints_Product_C_Polyhedron_Grid_t,), ph)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_is_bounded(ph)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_is_bounded, libppl_c), Cint, (ppl_const_Constraints_Product_C_Polyhedron_Grid_t,), ph)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_is_topologically_closed(ph)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_is_topologically_closed, libppl_c), Cint, (ppl_const_Constraints_Product_C_Polyhedron_Grid_t,), ph)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_is_discrete(ph)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_is_discrete, libppl_c), Cint, (ppl_const_Constraints_Product_C_Polyhedron_Grid_t,), ph)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_topological_closure_assign(ph)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_topological_closure_assign, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t,), ph)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_bounds_from_above(ph, le)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_bounds_from_above, libppl_c), Cint, (ppl_const_Constraints_Product_C_Polyhedron_Grid_t, ppl_const_Linear_Expression_t), ph, le)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_bounds_from_below(ph, le)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_bounds_from_below, libppl_c), Cint, (ppl_const_Constraints_Product_C_Polyhedron_Grid_t, ppl_const_Linear_Expression_t), ph, le)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_maximize(ph, le, ext_n, ext_d, poptimum)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_maximize, libppl_c), Cint, (ppl_const_Constraints_Product_C_Polyhedron_Grid_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}), ph, le, ext_n, ext_d, poptimum)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_minimize(ph, le, ext_n, ext_d, poptimum)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_minimize, libppl_c), Cint, (ppl_const_Constraints_Product_C_Polyhedron_Grid_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}), ph, le, ext_n, ext_d, poptimum)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_maximize_with_point(ph, le, ext_n, ext_d, poptimum, point)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_maximize_with_point, libppl_c), Cint, (ppl_const_Constraints_Product_C_Polyhedron_Grid_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}, ppl_Generator_t), ph, le, ext_n, ext_d, poptimum, point)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_minimize_with_point(ph, le, ext_n, ext_d, poptimum, point)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_minimize_with_point, libppl_c), Cint, (ppl_const_Constraints_Product_C_Polyhedron_Grid_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}, ppl_Generator_t), ph, le, ext_n, ext_d, poptimum, point)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_contains_Constraints_Product_C_Polyhedron_Grid(x, y)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_contains_Constraints_Product_C_Polyhedron_Grid, libppl_c), Cint, (ppl_const_Constraints_Product_C_Polyhedron_Grid_t, ppl_const_Constraints_Product_C_Polyhedron_Grid_t), x, y)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_strictly_contains_Constraints_Product_C_Polyhedron_Grid(x, y)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_strictly_contains_Constraints_Product_C_Polyhedron_Grid, libppl_c), Cint, (ppl_const_Constraints_Product_C_Polyhedron_Grid_t, ppl_const_Constraints_Product_C_Polyhedron_Grid_t), x, y)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_is_disjoint_from_Constraints_Product_C_Polyhedron_Grid(x, y)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_is_disjoint_from_Constraints_Product_C_Polyhedron_Grid, libppl_c), Cint, (ppl_const_Constraints_Product_C_Polyhedron_Grid_t, ppl_const_Constraints_Product_C_Polyhedron_Grid_t), x, y)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_equals_Constraints_Product_C_Polyhedron_Grid(x, y)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_equals_Constraints_Product_C_Polyhedron_Grid, libppl_c), Cint, (ppl_const_Constraints_Product_C_Polyhedron_Grid_t, ppl_const_Constraints_Product_C_Polyhedron_Grid_t), x, y)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_OK(ph)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_OK, libppl_c), Cint, (ppl_const_Constraints_Product_C_Polyhedron_Grid_t,), ph)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_add_constraint(ph, c)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_add_constraint, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, ppl_const_Constraint_t), ph, c)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_add_congruence(ph, c)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_add_congruence, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, ppl_const_Congruence_t), ph, c)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_add_constraints(ph, cs)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_add_constraints, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, ppl_const_Constraint_System_t), ph, cs)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_add_congruences(ph, cs)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_add_congruences, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, ppl_const_Congruence_System_t), ph, cs)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_refine_with_constraint(ph, c)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_refine_with_constraint, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, ppl_const_Constraint_t), ph, c)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_refine_with_congruence(ph, c)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_refine_with_congruence, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, ppl_const_Congruence_t), ph, c)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_refine_with_constraints(ph, cs)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_refine_with_constraints, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, ppl_const_Constraint_System_t), ph, cs)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_refine_with_congruences(ph, cs)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_refine_with_congruences, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, ppl_const_Congruence_System_t), ph, cs)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_intersection_assign(x, y)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_intersection_assign, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, ppl_const_Constraints_Product_C_Polyhedron_Grid_t), x, y)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_upper_bound_assign(x, y)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_upper_bound_assign, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, ppl_const_Constraints_Product_C_Polyhedron_Grid_t), x, y)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_difference_assign(x, y)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_difference_assign, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, ppl_const_Constraints_Product_C_Polyhedron_Grid_t), x, y)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_concatenate_assign(x, y)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_concatenate_assign, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, ppl_const_Constraints_Product_C_Polyhedron_Grid_t), x, y)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_time_elapse_assign(x, y)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_time_elapse_assign, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, ppl_const_Constraints_Product_C_Polyhedron_Grid_t), x, y)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_upper_bound_assign_if_exact(x, y)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_upper_bound_assign_if_exact, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, ppl_const_Constraints_Product_C_Polyhedron_Grid_t), x, y)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_constrains(ph, var)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_constrains, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, ppl_dimension_type), ph, var)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_unconstrain_space_dimension(ph, var)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_unconstrain_space_dimension, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, ppl_dimension_type), ph, var)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_unconstrain_space_dimensions(ph, ds, n)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_unconstrain_space_dimensions, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, Ptr{ppl_dimension_type}, Csize_t), ph, ds, n)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_affine_image(ph, var, le, d)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_affine_image, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, le, d)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_affine_preimage(ph, var, le, d)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_affine_preimage, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, le, d)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_bounded_affine_image(ph, var, lb, ub, d)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_bounded_affine_image, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, lb, ub, d)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_bounded_affine_preimage(ph, var, lb, ub, d)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_bounded_affine_preimage, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, lb, ub, d)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_generalized_affine_image(ph, var, relsym, le, d)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_generalized_affine_image, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, ppl_dimension_type, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, relsym, le, d)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_generalized_affine_preimage(ph, var, relsym, le, d)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_generalized_affine_preimage, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, ppl_dimension_type, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, relsym, le, d)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_generalized_affine_image_lhs_rhs(ph, lhs, relsym, rhs)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_generalized_affine_image_lhs_rhs, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, ppl_const_Linear_Expression_t, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t), ph, lhs, relsym, rhs)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_generalized_affine_preimage_lhs_rhs(ph, lhs, relsym, rhs)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_generalized_affine_preimage_lhs_rhs, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, ppl_const_Linear_Expression_t, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t), ph, lhs, relsym, rhs)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_add_space_dimensions_and_embed(ph, d)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_add_space_dimensions_and_embed, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, ppl_dimension_type), ph, d)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_add_space_dimensions_and_project(ph, d)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_add_space_dimensions_and_project, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, ppl_dimension_type), ph, d)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_remove_space_dimensions(ph, ds, n)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_remove_space_dimensions, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, Ptr{ppl_dimension_type}, Csize_t), ph, ds, n)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_remove_higher_space_dimensions(ph, d)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_remove_higher_space_dimensions, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, ppl_dimension_type), ph, d)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_expand_space_dimension(ph, d, m)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_expand_space_dimension, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, ppl_dimension_type, ppl_dimension_type), ph, d, m)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_fold_space_dimensions(ph, ds, n, d)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_fold_space_dimensions, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, Ptr{ppl_dimension_type}, Csize_t, ppl_dimension_type), ph, ds, n, d)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_map_space_dimensions(ph, maps, n)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_map_space_dimensions, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, Ptr{ppl_dimension_type}, Csize_t), ph, maps, n)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_drop_some_non_integer_points(ph, complexity)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_drop_some_non_integer_points, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, Cint), ph, complexity)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_drop_some_non_integer_points_2(ph, ds, n, complexity)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_drop_some_non_integer_points_2, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, Ptr{ppl_dimension_type}, Csize_t, Cint), ph, ds, n, complexity)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_external_memory_in_bytes(ps, sz)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_external_memory_in_bytes, libppl_c), Cint, (ppl_const_Constraints_Product_C_Polyhedron_Grid_t, Ptr{Csize_t}), ps, sz)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_total_memory_in_bytes(ps, sz)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_total_memory_in_bytes, libppl_c), Cint, (ppl_const_Constraints_Product_C_Polyhedron_Grid_t, Ptr{Csize_t}), ps, sz)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_widening_assign_with_tokens(x, y, tp)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_widening_assign_with_tokens, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, ppl_const_Constraints_Product_C_Polyhedron_Grid_t, Ptr{Cuint}), x, y, tp)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_widening_assign(x, y)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_widening_assign, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, ppl_const_Constraints_Product_C_Polyhedron_Grid_t), x, y)
end

function ppl_io_print_Constraints_Product_C_Polyhedron_Grid(x)
    ccall((:ppl_io_print_Constraints_Product_C_Polyhedron_Grid, libppl_c), Cint, (ppl_const_Constraints_Product_C_Polyhedron_Grid_t,), x)
end

function ppl_io_fprint_Constraints_Product_C_Polyhedron_Grid(stream, x)
    ccall((:ppl_io_fprint_Constraints_Product_C_Polyhedron_Grid, libppl_c), Cint, (Ptr{Libc.FILE}, ppl_const_Constraints_Product_C_Polyhedron_Grid_t), stream, x)
end

function ppl_io_asprint_Constraints_Product_C_Polyhedron_Grid(strp, x)
    ccall((:ppl_io_asprint_Constraints_Product_C_Polyhedron_Grid, libppl_c), Cint, (Ptr{Ptr{Cchar}}, ppl_const_Constraints_Product_C_Polyhedron_Grid_t), strp, x)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_ascii_dump(x, stream)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_ascii_dump, libppl_c), Cint, (ppl_const_Constraints_Product_C_Polyhedron_Grid_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_Constraints_Product_C_Polyhedron_Grid_ascii_load(x, stream)
    ccall((:ppl_Constraints_Product_C_Polyhedron_Grid_ascii_load, libppl_c), Cint, (ppl_Constraints_Product_C_Polyhedron_Grid_t, Ptr{Libc.FILE}), x, stream)
end

mutable struct ppl_Pointset_Powerset_C_Polyhedron_iterator_tag end

const ppl_Pointset_Powerset_C_Polyhedron_iterator_t = Ptr{ppl_Pointset_Powerset_C_Polyhedron_iterator_tag}

const ppl_const_Pointset_Powerset_C_Polyhedron_iterator_t = Ptr{ppl_Pointset_Powerset_C_Polyhedron_iterator_tag}

mutable struct ppl_Pointset_Powerset_C_Polyhedron_const_iterator_tag end

const ppl_Pointset_Powerset_C_Polyhedron_const_iterator_t = Ptr{ppl_Pointset_Powerset_C_Polyhedron_const_iterator_tag}

const ppl_const_Pointset_Powerset_C_Polyhedron_const_iterator_t = Ptr{ppl_Pointset_Powerset_C_Polyhedron_const_iterator_tag}

function ppl_new_Pointset_Powerset_C_Polyhedron_iterator(pit)
    ccall((:ppl_new_Pointset_Powerset_C_Polyhedron_iterator, libppl_c), Cint, (Ptr{ppl_Pointset_Powerset_C_Polyhedron_iterator_t},), pit)
end

function ppl_new_Pointset_Powerset_C_Polyhedron_const_iterator(pit)
    ccall((:ppl_new_Pointset_Powerset_C_Polyhedron_const_iterator, libppl_c), Cint, (Ptr{ppl_Pointset_Powerset_C_Polyhedron_const_iterator_t},), pit)
end

function ppl_delete_Pointset_Powerset_C_Polyhedron(ph)
    ccall((:ppl_delete_Pointset_Powerset_C_Polyhedron, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_t,), ph)
end

function ppl_new_Pointset_Powerset_C_Polyhedron_from_space_dimension(pph, d, empty)
    ccall((:ppl_new_Pointset_Powerset_C_Polyhedron_from_space_dimension, libppl_c), Cint, (Ptr{ppl_Pointset_Powerset_C_Polyhedron_t}, ppl_dimension_type, Cint), pph, d, empty)
end

function ppl_new_Pointset_Powerset_C_Polyhedron_from_Pointset_Powerset_C_Polyhedron(pph, ph)
    ccall((:ppl_new_Pointset_Powerset_C_Polyhedron_from_Pointset_Powerset_C_Polyhedron, libppl_c), Cint, (Ptr{ppl_Pointset_Powerset_C_Polyhedron_t}, ppl_const_Pointset_Powerset_C_Polyhedron_t), pph, ph)
end

function ppl_new_Pointset_Powerset_C_Polyhedron_from_C_Polyhedron(pph, ph)
    ccall((:ppl_new_Pointset_Powerset_C_Polyhedron_from_C_Polyhedron, libppl_c), Cint, (Ptr{ppl_Pointset_Powerset_C_Polyhedron_t}, ppl_const_Polyhedron_t), pph, ph)
end

function ppl_new_Pointset_Powerset_C_Polyhedron_from_Pointset_Powerset_C_Polyhedron_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Pointset_Powerset_C_Polyhedron_from_Pointset_Powerset_C_Polyhedron_with_complexity, libppl_c), Cint, (Ptr{ppl_Pointset_Powerset_C_Polyhedron_t}, ppl_const_Pointset_Powerset_C_Polyhedron_t, Cint), pph, ph, complexity)
end

function ppl_new_Pointset_Powerset_C_Polyhedron_from_C_Polyhedron_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Pointset_Powerset_C_Polyhedron_from_C_Polyhedron_with_complexity, libppl_c), Cint, (Ptr{ppl_Pointset_Powerset_C_Polyhedron_t}, ppl_const_Polyhedron_t, Cint), pph, ph, complexity)
end

function ppl_new_Pointset_Powerset_C_Polyhedron_from_Constraint_System(pph, cs)
    ccall((:ppl_new_Pointset_Powerset_C_Polyhedron_from_Constraint_System, libppl_c), Cint, (Ptr{ppl_Pointset_Powerset_C_Polyhedron_t}, ppl_const_Constraint_System_t), pph, cs)
end

function ppl_new_Pointset_Powerset_C_Polyhedron_from_Congruence_System(pph, cs)
    ccall((:ppl_new_Pointset_Powerset_C_Polyhedron_from_Congruence_System, libppl_c), Cint, (Ptr{ppl_Pointset_Powerset_C_Polyhedron_t}, ppl_const_Congruence_System_t), pph, cs)
end

function ppl_Pointset_Powerset_C_Polyhedron_space_dimension(ph, m)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_space_dimension, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_t, Ptr{ppl_dimension_type}), ph, m)
end

function ppl_Pointset_Powerset_C_Polyhedron_affine_dimension(ph, m)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_affine_dimension, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_t, Ptr{ppl_dimension_type}), ph, m)
end

function ppl_Pointset_Powerset_C_Polyhedron_relation_with_Constraint(ph, c)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_relation_with_Constraint, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_t, ppl_const_Constraint_t), ph, c)
end

function ppl_Pointset_Powerset_C_Polyhedron_relation_with_Generator(ph, c)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_relation_with_Generator, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_t, ppl_const_Generator_t), ph, c)
end

function ppl_Pointset_Powerset_C_Polyhedron_relation_with_Congruence(ph, c)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_relation_with_Congruence, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_t, ppl_const_Congruence_t), ph, c)
end

function ppl_Pointset_Powerset_C_Polyhedron_is_empty(ph)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_is_empty, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_t,), ph)
end

function ppl_Pointset_Powerset_C_Polyhedron_is_universe(ph)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_is_universe, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_t,), ph)
end

function ppl_Pointset_Powerset_C_Polyhedron_is_bounded(ph)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_is_bounded, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_t,), ph)
end

function ppl_Pointset_Powerset_C_Polyhedron_contains_integer_point(ph)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_contains_integer_point, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_t,), ph)
end

function ppl_Pointset_Powerset_C_Polyhedron_is_topologically_closed(ph)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_is_topologically_closed, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_t,), ph)
end

function ppl_Pointset_Powerset_C_Polyhedron_is_discrete(ph)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_is_discrete, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_t,), ph)
end

function ppl_Pointset_Powerset_C_Polyhedron_topological_closure_assign(ph)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_topological_closure_assign, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t,), ph)
end

function ppl_Pointset_Powerset_C_Polyhedron_pairwise_reduce(ph)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_pairwise_reduce, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t,), ph)
end

function ppl_Pointset_Powerset_C_Polyhedron_omega_reduce(ph)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_omega_reduce, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t,), ph)
end

function ppl_Pointset_Powerset_C_Polyhedron_bounds_from_above(ph, le)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_bounds_from_above, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_t, ppl_const_Linear_Expression_t), ph, le)
end

function ppl_Pointset_Powerset_C_Polyhedron_bounds_from_below(ph, le)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_bounds_from_below, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_t, ppl_const_Linear_Expression_t), ph, le)
end

function ppl_Pointset_Powerset_C_Polyhedron_maximize(ph, le, ext_n, ext_d, poptimum)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_maximize, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}), ph, le, ext_n, ext_d, poptimum)
end

function ppl_Pointset_Powerset_C_Polyhedron_minimize(ph, le, ext_n, ext_d, poptimum)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_minimize, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}), ph, le, ext_n, ext_d, poptimum)
end

function ppl_Pointset_Powerset_C_Polyhedron_maximize_with_point(ph, le, ext_n, ext_d, poptimum, point)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_maximize_with_point, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}, ppl_Generator_t), ph, le, ext_n, ext_d, poptimum, point)
end

function ppl_Pointset_Powerset_C_Polyhedron_minimize_with_point(ph, le, ext_n, ext_d, poptimum, point)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_minimize_with_point, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}, ppl_Generator_t), ph, le, ext_n, ext_d, poptimum, point)
end

function ppl_Pointset_Powerset_C_Polyhedron_contains_Pointset_Powerset_C_Polyhedron(x, y)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_contains_Pointset_Powerset_C_Polyhedron, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_t, ppl_const_Pointset_Powerset_C_Polyhedron_t), x, y)
end

function ppl_Pointset_Powerset_C_Polyhedron_strictly_contains_Pointset_Powerset_C_Polyhedron(x, y)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_strictly_contains_Pointset_Powerset_C_Polyhedron, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_t, ppl_const_Pointset_Powerset_C_Polyhedron_t), x, y)
end

function ppl_Pointset_Powerset_C_Polyhedron_is_disjoint_from_Pointset_Powerset_C_Polyhedron(x, y)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_is_disjoint_from_Pointset_Powerset_C_Polyhedron, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_t, ppl_const_Pointset_Powerset_C_Polyhedron_t), x, y)
end

function ppl_Pointset_Powerset_C_Polyhedron_geometrically_covers_Pointset_Powerset_C_Polyhedron(x, y)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_geometrically_covers_Pointset_Powerset_C_Polyhedron, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_t, ppl_const_Pointset_Powerset_C_Polyhedron_t), x, y)
end

function ppl_Pointset_Powerset_C_Polyhedron_geometrically_equals_Pointset_Powerset_C_Polyhedron(x, y)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_geometrically_equals_Pointset_Powerset_C_Polyhedron, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_t, ppl_const_Pointset_Powerset_C_Polyhedron_t), x, y)
end

function ppl_Pointset_Powerset_C_Polyhedron_equals_Pointset_Powerset_C_Polyhedron(x, y)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_equals_Pointset_Powerset_C_Polyhedron, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_t, ppl_const_Pointset_Powerset_C_Polyhedron_t), x, y)
end

function ppl_Pointset_Powerset_C_Polyhedron_OK(ph)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_OK, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_t,), ph)
end

function ppl_Pointset_Powerset_C_Polyhedron_add_constraint(ph, c)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_add_constraint, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_const_Constraint_t), ph, c)
end

function ppl_Pointset_Powerset_C_Polyhedron_add_congruence(ph, c)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_add_congruence, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_const_Congruence_t), ph, c)
end

function ppl_Pointset_Powerset_C_Polyhedron_add_constraints(ph, cs)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_add_constraints, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_const_Constraint_System_t), ph, cs)
end

function ppl_Pointset_Powerset_C_Polyhedron_add_congruences(ph, cs)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_add_congruences, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_const_Congruence_System_t), ph, cs)
end

function ppl_Pointset_Powerset_C_Polyhedron_refine_with_constraint(ph, c)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_refine_with_constraint, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_const_Constraint_t), ph, c)
end

function ppl_Pointset_Powerset_C_Polyhedron_refine_with_congruence(ph, c)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_refine_with_congruence, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_const_Congruence_t), ph, c)
end

function ppl_Pointset_Powerset_C_Polyhedron_refine_with_constraints(ph, cs)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_refine_with_constraints, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_const_Constraint_System_t), ph, cs)
end

function ppl_Pointset_Powerset_C_Polyhedron_refine_with_congruences(ph, cs)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_refine_with_congruences, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_const_Congruence_System_t), ph, cs)
end

function ppl_Pointset_Powerset_C_Polyhedron_intersection_assign(x, y)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_intersection_assign, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_const_Pointset_Powerset_C_Polyhedron_t), x, y)
end

function ppl_Pointset_Powerset_C_Polyhedron_upper_bound_assign(x, y)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_upper_bound_assign, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_const_Pointset_Powerset_C_Polyhedron_t), x, y)
end

function ppl_Pointset_Powerset_C_Polyhedron_difference_assign(x, y)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_difference_assign, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_const_Pointset_Powerset_C_Polyhedron_t), x, y)
end

function ppl_Pointset_Powerset_C_Polyhedron_concatenate_assign(x, y)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_concatenate_assign, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_const_Pointset_Powerset_C_Polyhedron_t), x, y)
end

function ppl_Pointset_Powerset_C_Polyhedron_time_elapse_assign(x, y)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_time_elapse_assign, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_const_Pointset_Powerset_C_Polyhedron_t), x, y)
end

function ppl_Pointset_Powerset_C_Polyhedron_upper_bound_assign_if_exact(x, y)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_upper_bound_assign_if_exact, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_const_Pointset_Powerset_C_Polyhedron_t), x, y)
end

function ppl_Pointset_Powerset_C_Polyhedron_simplify_using_context_assign(x, y)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_simplify_using_context_assign, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_const_Pointset_Powerset_C_Polyhedron_t), x, y)
end

function ppl_Pointset_Powerset_C_Polyhedron_constrains(ph, var)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_constrains, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_dimension_type), ph, var)
end

function ppl_Pointset_Powerset_C_Polyhedron_unconstrain_space_dimension(ph, var)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_unconstrain_space_dimension, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_dimension_type), ph, var)
end

function ppl_Pointset_Powerset_C_Polyhedron_unconstrain_space_dimensions(ph, ds, n)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_unconstrain_space_dimensions, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, Ptr{ppl_dimension_type}, Csize_t), ph, ds, n)
end

function ppl_Pointset_Powerset_C_Polyhedron_affine_image(ph, var, le, d)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_affine_image, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, le, d)
end

function ppl_Pointset_Powerset_C_Polyhedron_affine_preimage(ph, var, le, d)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_affine_preimage, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, le, d)
end

function ppl_Pointset_Powerset_C_Polyhedron_bounded_affine_image(ph, var, lb, ub, d)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_bounded_affine_image, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, lb, ub, d)
end

function ppl_Pointset_Powerset_C_Polyhedron_bounded_affine_preimage(ph, var, lb, ub, d)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_bounded_affine_preimage, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, lb, ub, d)
end

function ppl_Pointset_Powerset_C_Polyhedron_generalized_affine_image(ph, var, relsym, le, d)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_generalized_affine_image, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_dimension_type, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, relsym, le, d)
end

function ppl_Pointset_Powerset_C_Polyhedron_generalized_affine_preimage(ph, var, relsym, le, d)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_generalized_affine_preimage, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_dimension_type, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, relsym, le, d)
end

function ppl_Pointset_Powerset_C_Polyhedron_generalized_affine_image_lhs_rhs(ph, lhs, relsym, rhs)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_generalized_affine_image_lhs_rhs, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_const_Linear_Expression_t, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t), ph, lhs, relsym, rhs)
end

function ppl_Pointset_Powerset_C_Polyhedron_generalized_affine_preimage_lhs_rhs(ph, lhs, relsym, rhs)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_generalized_affine_preimage_lhs_rhs, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_const_Linear_Expression_t, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t), ph, lhs, relsym, rhs)
end

function ppl_Pointset_Powerset_C_Polyhedron_add_space_dimensions_and_embed(ph, d)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_add_space_dimensions_and_embed, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_dimension_type), ph, d)
end

function ppl_Pointset_Powerset_C_Polyhedron_add_space_dimensions_and_project(ph, d)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_add_space_dimensions_and_project, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_dimension_type), ph, d)
end

function ppl_Pointset_Powerset_C_Polyhedron_remove_space_dimensions(ph, ds, n)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_remove_space_dimensions, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, Ptr{ppl_dimension_type}, Csize_t), ph, ds, n)
end

function ppl_Pointset_Powerset_C_Polyhedron_remove_higher_space_dimensions(ph, d)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_remove_higher_space_dimensions, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_dimension_type), ph, d)
end

function ppl_Pointset_Powerset_C_Polyhedron_expand_space_dimension(ph, d, m)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_expand_space_dimension, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_dimension_type, ppl_dimension_type), ph, d, m)
end

function ppl_Pointset_Powerset_C_Polyhedron_fold_space_dimensions(ph, ds, n, d)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_fold_space_dimensions, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, Ptr{ppl_dimension_type}, Csize_t, ppl_dimension_type), ph, ds, n, d)
end

function ppl_Pointset_Powerset_C_Polyhedron_map_space_dimensions(ph, maps, n)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_map_space_dimensions, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, Ptr{ppl_dimension_type}, Csize_t), ph, maps, n)
end

function ppl_Pointset_Powerset_C_Polyhedron_drop_some_non_integer_points(ph, complexity)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_drop_some_non_integer_points, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, Cint), ph, complexity)
end

function ppl_Pointset_Powerset_C_Polyhedron_drop_some_non_integer_points_2(ph, ds, n, complexity)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_drop_some_non_integer_points_2, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, Ptr{ppl_dimension_type}, Csize_t, Cint), ph, ds, n, complexity)
end

function ppl_Pointset_Powerset_C_Polyhedron_external_memory_in_bytes(ps, sz)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_external_memory_in_bytes, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_t, Ptr{Csize_t}), ps, sz)
end

function ppl_Pointset_Powerset_C_Polyhedron_total_memory_in_bytes(ps, sz)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_total_memory_in_bytes, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_t, Ptr{Csize_t}), ps, sz)
end

function ppl_Pointset_Powerset_C_Polyhedron_size(ps, sz)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_size, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_t, Ptr{Csize_t}), ps, sz)
end

function ppl_new_Pointset_Powerset_C_Polyhedron_iterator_from_iterator(px, y)
    ccall((:ppl_new_Pointset_Powerset_C_Polyhedron_iterator_from_iterator, libppl_c), Cint, (Ptr{ppl_Pointset_Powerset_C_Polyhedron_iterator_t}, ppl_const_Pointset_Powerset_C_Polyhedron_iterator_t), px, y)
end

function ppl_new_Pointset_Powerset_C_Polyhedron_const_iterator_from_const_iterator(px, y)
    ccall((:ppl_new_Pointset_Powerset_C_Polyhedron_const_iterator_from_const_iterator, libppl_c), Cint, (Ptr{ppl_Pointset_Powerset_C_Polyhedron_const_iterator_t}, ppl_const_Pointset_Powerset_C_Polyhedron_const_iterator_t), px, y)
end

function ppl_Pointset_Powerset_C_Polyhedron_iterator_begin(ps, psit)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_iterator_begin, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_Pointset_Powerset_C_Polyhedron_iterator_t), ps, psit)
end

function ppl_Pointset_Powerset_C_Polyhedron_const_iterator_begin(ps, psit)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_const_iterator_begin, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_t, ppl_Pointset_Powerset_C_Polyhedron_const_iterator_t), ps, psit)
end

function ppl_Pointset_Powerset_C_Polyhedron_iterator_end(ps, psit)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_iterator_end, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_Pointset_Powerset_C_Polyhedron_iterator_t), ps, psit)
end

function ppl_Pointset_Powerset_C_Polyhedron_const_iterator_end(ps, psit)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_const_iterator_end, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_t, ppl_Pointset_Powerset_C_Polyhedron_const_iterator_t), ps, psit)
end

function ppl_Pointset_Powerset_C_Polyhedron_iterator_equal_test(x, y)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_iterator_equal_test, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_iterator_t, ppl_const_Pointset_Powerset_C_Polyhedron_iterator_t), x, y)
end

function ppl_Pointset_Powerset_C_Polyhedron_const_iterator_equal_test(x, y)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_const_iterator_equal_test, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_const_iterator_t, ppl_const_Pointset_Powerset_C_Polyhedron_const_iterator_t), x, y)
end

function ppl_Pointset_Powerset_C_Polyhedron_iterator_increment(psit)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_iterator_increment, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_iterator_t,), psit)
end

function ppl_Pointset_Powerset_C_Polyhedron_const_iterator_increment(psit)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_const_iterator_increment, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_const_iterator_t,), psit)
end

function ppl_Pointset_Powerset_C_Polyhedron_iterator_decrement(psit)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_iterator_decrement, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_iterator_t,), psit)
end

function ppl_Pointset_Powerset_C_Polyhedron_const_iterator_decrement(psit)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_const_iterator_decrement, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_const_iterator_t,), psit)
end

function ppl_Pointset_Powerset_C_Polyhedron_iterator_dereference(ps, d)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_iterator_dereference, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_iterator_t, Ptr{ppl_const_Polyhedron_t}), ps, d)
end

function ppl_Pointset_Powerset_C_Polyhedron_const_iterator_dereference(ps, d)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_const_iterator_dereference, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_const_iterator_t, Ptr{ppl_const_Polyhedron_t}), ps, d)
end

function ppl_delete_Pointset_Powerset_C_Polyhedron_iterator(psit)
    ccall((:ppl_delete_Pointset_Powerset_C_Polyhedron_iterator, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_iterator_t,), psit)
end

function ppl_delete_Pointset_Powerset_C_Polyhedron_const_iterator(psit)
    ccall((:ppl_delete_Pointset_Powerset_C_Polyhedron_const_iterator, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_const_iterator_t,), psit)
end

function ppl_Pointset_Powerset_C_Polyhedron_add_disjunct(ps, d)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_add_disjunct, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_const_Polyhedron_t), ps, d)
end

function ppl_Pointset_Powerset_C_Polyhedron_drop_disjunct(ps, cit, it)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_drop_disjunct, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_const_Pointset_Powerset_C_Polyhedron_iterator_t, ppl_Pointset_Powerset_C_Polyhedron_iterator_t), ps, cit, it)
end

function ppl_Pointset_Powerset_C_Polyhedron_drop_disjuncts(ps, first, last)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_drop_disjuncts, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_const_Pointset_Powerset_C_Polyhedron_iterator_t, ppl_const_Pointset_Powerset_C_Polyhedron_iterator_t), ps, first, last)
end

function ppl_Pointset_Powerset_C_Polyhedron_BHZ03_BHRZ03_BHRZ03_widening_assign(x, y)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_BHZ03_BHRZ03_BHRZ03_widening_assign, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_const_Pointset_Powerset_C_Polyhedron_t), x, y)
end

function ppl_Pointset_Powerset_C_Polyhedron_BHZ03_H79_H79_widening_assign(x, y)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_BHZ03_H79_H79_widening_assign, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_const_Pointset_Powerset_C_Polyhedron_t), x, y)
end

function ppl_Pointset_Powerset_C_Polyhedron_BGP99_BHRZ03_extrapolation_assign(x, y, disjuncts)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_BGP99_BHRZ03_extrapolation_assign, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_const_Pointset_Powerset_C_Polyhedron_t, Cint), x, y, disjuncts)
end

function ppl_Pointset_Powerset_C_Polyhedron_BGP99_H79_extrapolation_assign(x, y, disjuncts)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_BGP99_H79_extrapolation_assign, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, ppl_const_Pointset_Powerset_C_Polyhedron_t, Cint), x, y, disjuncts)
end

function ppl_io_print_Pointset_Powerset_C_Polyhedron(x)
    ccall((:ppl_io_print_Pointset_Powerset_C_Polyhedron, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_t,), x)
end

function ppl_io_fprint_Pointset_Powerset_C_Polyhedron(stream, x)
    ccall((:ppl_io_fprint_Pointset_Powerset_C_Polyhedron, libppl_c), Cint, (Ptr{Libc.FILE}, ppl_const_Pointset_Powerset_C_Polyhedron_t), stream, x)
end

function ppl_io_asprint_Pointset_Powerset_C_Polyhedron(strp, x)
    ccall((:ppl_io_asprint_Pointset_Powerset_C_Polyhedron, libppl_c), Cint, (Ptr{Ptr{Cchar}}, ppl_const_Pointset_Powerset_C_Polyhedron_t), strp, x)
end

function ppl_Pointset_Powerset_C_Polyhedron_ascii_dump(x, stream)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_ascii_dump, libppl_c), Cint, (ppl_const_Pointset_Powerset_C_Polyhedron_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_Pointset_Powerset_C_Polyhedron_ascii_load(x, stream)
    ccall((:ppl_Pointset_Powerset_C_Polyhedron_ascii_load, libppl_c), Cint, (ppl_Pointset_Powerset_C_Polyhedron_t, Ptr{Libc.FILE}), x, stream)
end

mutable struct ppl_Pointset_Powerset_NNC_Polyhedron_iterator_tag end

const ppl_Pointset_Powerset_NNC_Polyhedron_iterator_t = Ptr{ppl_Pointset_Powerset_NNC_Polyhedron_iterator_tag}

const ppl_const_Pointset_Powerset_NNC_Polyhedron_iterator_t = Ptr{ppl_Pointset_Powerset_NNC_Polyhedron_iterator_tag}

mutable struct ppl_Pointset_Powerset_NNC_Polyhedron_const_iterator_tag end

const ppl_Pointset_Powerset_NNC_Polyhedron_const_iterator_t = Ptr{ppl_Pointset_Powerset_NNC_Polyhedron_const_iterator_tag}

const ppl_const_Pointset_Powerset_NNC_Polyhedron_const_iterator_t = Ptr{ppl_Pointset_Powerset_NNC_Polyhedron_const_iterator_tag}

function ppl_new_Pointset_Powerset_NNC_Polyhedron_iterator(pit)
    ccall((:ppl_new_Pointset_Powerset_NNC_Polyhedron_iterator, libppl_c), Cint, (Ptr{ppl_Pointset_Powerset_NNC_Polyhedron_iterator_t},), pit)
end

function ppl_new_Pointset_Powerset_NNC_Polyhedron_const_iterator(pit)
    ccall((:ppl_new_Pointset_Powerset_NNC_Polyhedron_const_iterator, libppl_c), Cint, (Ptr{ppl_Pointset_Powerset_NNC_Polyhedron_const_iterator_t},), pit)
end

function ppl_delete_Pointset_Powerset_NNC_Polyhedron(ph)
    ccall((:ppl_delete_Pointset_Powerset_NNC_Polyhedron, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_t,), ph)
end

function ppl_new_Pointset_Powerset_NNC_Polyhedron_from_space_dimension(pph, d, empty)
    ccall((:ppl_new_Pointset_Powerset_NNC_Polyhedron_from_space_dimension, libppl_c), Cint, (Ptr{ppl_Pointset_Powerset_NNC_Polyhedron_t}, ppl_dimension_type, Cint), pph, d, empty)
end

function ppl_new_Pointset_Powerset_NNC_Polyhedron_from_Pointset_Powerset_NNC_Polyhedron(pph, ph)
    ccall((:ppl_new_Pointset_Powerset_NNC_Polyhedron_from_Pointset_Powerset_NNC_Polyhedron, libppl_c), Cint, (Ptr{ppl_Pointset_Powerset_NNC_Polyhedron_t}, ppl_const_Pointset_Powerset_NNC_Polyhedron_t), pph, ph)
end

function ppl_new_Pointset_Powerset_NNC_Polyhedron_from_NNC_Polyhedron(pph, ph)
    ccall((:ppl_new_Pointset_Powerset_NNC_Polyhedron_from_NNC_Polyhedron, libppl_c), Cint, (Ptr{ppl_Pointset_Powerset_NNC_Polyhedron_t}, ppl_const_Polyhedron_t), pph, ph)
end

function ppl_new_Pointset_Powerset_NNC_Polyhedron_from_Pointset_Powerset_NNC_Polyhedron_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Pointset_Powerset_NNC_Polyhedron_from_Pointset_Powerset_NNC_Polyhedron_with_complexity, libppl_c), Cint, (Ptr{ppl_Pointset_Powerset_NNC_Polyhedron_t}, ppl_const_Pointset_Powerset_NNC_Polyhedron_t, Cint), pph, ph, complexity)
end

function ppl_new_Pointset_Powerset_NNC_Polyhedron_from_NNC_Polyhedron_with_complexity(pph, ph, complexity)
    ccall((:ppl_new_Pointset_Powerset_NNC_Polyhedron_from_NNC_Polyhedron_with_complexity, libppl_c), Cint, (Ptr{ppl_Pointset_Powerset_NNC_Polyhedron_t}, ppl_const_Polyhedron_t, Cint), pph, ph, complexity)
end

function ppl_new_Pointset_Powerset_NNC_Polyhedron_from_Constraint_System(pph, cs)
    ccall((:ppl_new_Pointset_Powerset_NNC_Polyhedron_from_Constraint_System, libppl_c), Cint, (Ptr{ppl_Pointset_Powerset_NNC_Polyhedron_t}, ppl_const_Constraint_System_t), pph, cs)
end

function ppl_new_Pointset_Powerset_NNC_Polyhedron_from_Congruence_System(pph, cs)
    ccall((:ppl_new_Pointset_Powerset_NNC_Polyhedron_from_Congruence_System, libppl_c), Cint, (Ptr{ppl_Pointset_Powerset_NNC_Polyhedron_t}, ppl_const_Congruence_System_t), pph, cs)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_space_dimension(ph, m)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_space_dimension, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_t, Ptr{ppl_dimension_type}), ph, m)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_affine_dimension(ph, m)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_affine_dimension, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_t, Ptr{ppl_dimension_type}), ph, m)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_relation_with_Constraint(ph, c)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_relation_with_Constraint, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Constraint_t), ph, c)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_relation_with_Generator(ph, c)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_relation_with_Generator, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Generator_t), ph, c)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_relation_with_Congruence(ph, c)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_relation_with_Congruence, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Congruence_t), ph, c)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_is_empty(ph)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_is_empty, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_t,), ph)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_is_universe(ph)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_is_universe, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_t,), ph)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_is_bounded(ph)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_is_bounded, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_t,), ph)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_contains_integer_point(ph)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_contains_integer_point, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_t,), ph)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_is_topologically_closed(ph)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_is_topologically_closed, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_t,), ph)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_is_discrete(ph)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_is_discrete, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_t,), ph)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_topological_closure_assign(ph)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_topological_closure_assign, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t,), ph)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_pairwise_reduce(ph)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_pairwise_reduce, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t,), ph)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_omega_reduce(ph)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_omega_reduce, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t,), ph)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_bounds_from_above(ph, le)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_bounds_from_above, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Linear_Expression_t), ph, le)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_bounds_from_below(ph, le)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_bounds_from_below, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Linear_Expression_t), ph, le)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_maximize(ph, le, ext_n, ext_d, poptimum)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_maximize, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}), ph, le, ext_n, ext_d, poptimum)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_minimize(ph, le, ext_n, ext_d, poptimum)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_minimize, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}), ph, le, ext_n, ext_d, poptimum)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_maximize_with_point(ph, le, ext_n, ext_d, poptimum, point)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_maximize_with_point, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}, ppl_Generator_t), ph, le, ext_n, ext_d, poptimum, point)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_minimize_with_point(ph, le, ext_n, ext_d, poptimum, point)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_minimize_with_point, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Linear_Expression_t, ppl_Coefficient_t, ppl_Coefficient_t, Ptr{Cint}, ppl_Generator_t), ph, le, ext_n, ext_d, poptimum, point)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_contains_Pointset_Powerset_NNC_Polyhedron(x, y)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_contains_Pointset_Powerset_NNC_Polyhedron, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Pointset_Powerset_NNC_Polyhedron_t), x, y)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_strictly_contains_Pointset_Powerset_NNC_Polyhedron(x, y)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_strictly_contains_Pointset_Powerset_NNC_Polyhedron, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Pointset_Powerset_NNC_Polyhedron_t), x, y)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_is_disjoint_from_Pointset_Powerset_NNC_Polyhedron(x, y)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_is_disjoint_from_Pointset_Powerset_NNC_Polyhedron, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Pointset_Powerset_NNC_Polyhedron_t), x, y)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_geometrically_covers_Pointset_Powerset_NNC_Polyhedron(x, y)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_geometrically_covers_Pointset_Powerset_NNC_Polyhedron, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Pointset_Powerset_NNC_Polyhedron_t), x, y)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_geometrically_equals_Pointset_Powerset_NNC_Polyhedron(x, y)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_geometrically_equals_Pointset_Powerset_NNC_Polyhedron, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Pointset_Powerset_NNC_Polyhedron_t), x, y)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_equals_Pointset_Powerset_NNC_Polyhedron(x, y)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_equals_Pointset_Powerset_NNC_Polyhedron, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Pointset_Powerset_NNC_Polyhedron_t), x, y)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_OK(ph)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_OK, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_t,), ph)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_add_constraint(ph, c)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_add_constraint, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Constraint_t), ph, c)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_add_congruence(ph, c)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_add_congruence, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Congruence_t), ph, c)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_add_constraints(ph, cs)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_add_constraints, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Constraint_System_t), ph, cs)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_add_congruences(ph, cs)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_add_congruences, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Congruence_System_t), ph, cs)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_refine_with_constraint(ph, c)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_refine_with_constraint, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Constraint_t), ph, c)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_refine_with_congruence(ph, c)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_refine_with_congruence, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Congruence_t), ph, c)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_refine_with_constraints(ph, cs)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_refine_with_constraints, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Constraint_System_t), ph, cs)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_refine_with_congruences(ph, cs)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_refine_with_congruences, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Congruence_System_t), ph, cs)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_intersection_assign(x, y)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_intersection_assign, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Pointset_Powerset_NNC_Polyhedron_t), x, y)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_upper_bound_assign(x, y)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_upper_bound_assign, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Pointset_Powerset_NNC_Polyhedron_t), x, y)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_difference_assign(x, y)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_difference_assign, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Pointset_Powerset_NNC_Polyhedron_t), x, y)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_concatenate_assign(x, y)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_concatenate_assign, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Pointset_Powerset_NNC_Polyhedron_t), x, y)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_time_elapse_assign(x, y)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_time_elapse_assign, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Pointset_Powerset_NNC_Polyhedron_t), x, y)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_upper_bound_assign_if_exact(x, y)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_upper_bound_assign_if_exact, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Pointset_Powerset_NNC_Polyhedron_t), x, y)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_simplify_using_context_assign(x, y)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_simplify_using_context_assign, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Pointset_Powerset_NNC_Polyhedron_t), x, y)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_constrains(ph, var)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_constrains, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_dimension_type), ph, var)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_unconstrain_space_dimension(ph, var)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_unconstrain_space_dimension, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_dimension_type), ph, var)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_unconstrain_space_dimensions(ph, ds, n)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_unconstrain_space_dimensions, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, Ptr{ppl_dimension_type}, Csize_t), ph, ds, n)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_affine_image(ph, var, le, d)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_affine_image, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, le, d)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_affine_preimage(ph, var, le, d)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_affine_preimage, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, le, d)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_bounded_affine_image(ph, var, lb, ub, d)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_bounded_affine_image, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, lb, ub, d)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_bounded_affine_preimage(ph, var, lb, ub, d)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_bounded_affine_preimage, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_dimension_type, ppl_const_Linear_Expression_t, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, lb, ub, d)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_generalized_affine_image(ph, var, relsym, le, d)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_generalized_affine_image, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_dimension_type, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, relsym, le, d)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_generalized_affine_preimage(ph, var, relsym, le, d)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_generalized_affine_preimage, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_dimension_type, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t, ppl_const_Coefficient_t), ph, var, relsym, le, d)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_generalized_affine_image_lhs_rhs(ph, lhs, relsym, rhs)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_generalized_affine_image_lhs_rhs, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Linear_Expression_t, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t), ph, lhs, relsym, rhs)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_generalized_affine_preimage_lhs_rhs(ph, lhs, relsym, rhs)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_generalized_affine_preimage_lhs_rhs, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Linear_Expression_t, ppl_enum_Constraint_Type, ppl_const_Linear_Expression_t), ph, lhs, relsym, rhs)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_add_space_dimensions_and_embed(ph, d)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_add_space_dimensions_and_embed, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_dimension_type), ph, d)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_add_space_dimensions_and_project(ph, d)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_add_space_dimensions_and_project, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_dimension_type), ph, d)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_remove_space_dimensions(ph, ds, n)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_remove_space_dimensions, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, Ptr{ppl_dimension_type}, Csize_t), ph, ds, n)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_remove_higher_space_dimensions(ph, d)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_remove_higher_space_dimensions, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_dimension_type), ph, d)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_expand_space_dimension(ph, d, m)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_expand_space_dimension, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_dimension_type, ppl_dimension_type), ph, d, m)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_fold_space_dimensions(ph, ds, n, d)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_fold_space_dimensions, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, Ptr{ppl_dimension_type}, Csize_t, ppl_dimension_type), ph, ds, n, d)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_map_space_dimensions(ph, maps, n)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_map_space_dimensions, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, Ptr{ppl_dimension_type}, Csize_t), ph, maps, n)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_drop_some_non_integer_points(ph, complexity)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_drop_some_non_integer_points, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, Cint), ph, complexity)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_drop_some_non_integer_points_2(ph, ds, n, complexity)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_drop_some_non_integer_points_2, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, Ptr{ppl_dimension_type}, Csize_t, Cint), ph, ds, n, complexity)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_external_memory_in_bytes(ps, sz)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_external_memory_in_bytes, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_t, Ptr{Csize_t}), ps, sz)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_total_memory_in_bytes(ps, sz)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_total_memory_in_bytes, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_t, Ptr{Csize_t}), ps, sz)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_size(ps, sz)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_size, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_t, Ptr{Csize_t}), ps, sz)
end

function ppl_new_Pointset_Powerset_NNC_Polyhedron_iterator_from_iterator(px, y)
    ccall((:ppl_new_Pointset_Powerset_NNC_Polyhedron_iterator_from_iterator, libppl_c), Cint, (Ptr{ppl_Pointset_Powerset_NNC_Polyhedron_iterator_t}, ppl_const_Pointset_Powerset_NNC_Polyhedron_iterator_t), px, y)
end

function ppl_new_Pointset_Powerset_NNC_Polyhedron_const_iterator_from_const_iterator(px, y)
    ccall((:ppl_new_Pointset_Powerset_NNC_Polyhedron_const_iterator_from_const_iterator, libppl_c), Cint, (Ptr{ppl_Pointset_Powerset_NNC_Polyhedron_const_iterator_t}, ppl_const_Pointset_Powerset_NNC_Polyhedron_const_iterator_t), px, y)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_iterator_begin(ps, psit)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_iterator_begin, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_Pointset_Powerset_NNC_Polyhedron_iterator_t), ps, psit)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_const_iterator_begin(ps, psit)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_const_iterator_begin, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_t, ppl_Pointset_Powerset_NNC_Polyhedron_const_iterator_t), ps, psit)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_iterator_end(ps, psit)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_iterator_end, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_Pointset_Powerset_NNC_Polyhedron_iterator_t), ps, psit)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_const_iterator_end(ps, psit)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_const_iterator_end, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_t, ppl_Pointset_Powerset_NNC_Polyhedron_const_iterator_t), ps, psit)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_iterator_equal_test(x, y)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_iterator_equal_test, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_iterator_t, ppl_const_Pointset_Powerset_NNC_Polyhedron_iterator_t), x, y)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_const_iterator_equal_test(x, y)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_const_iterator_equal_test, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_const_iterator_t, ppl_const_Pointset_Powerset_NNC_Polyhedron_const_iterator_t), x, y)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_iterator_increment(psit)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_iterator_increment, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_iterator_t,), psit)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_const_iterator_increment(psit)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_const_iterator_increment, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_const_iterator_t,), psit)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_iterator_decrement(psit)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_iterator_decrement, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_iterator_t,), psit)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_const_iterator_decrement(psit)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_const_iterator_decrement, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_const_iterator_t,), psit)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_iterator_dereference(ps, d)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_iterator_dereference, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_iterator_t, Ptr{ppl_const_Polyhedron_t}), ps, d)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_const_iterator_dereference(ps, d)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_const_iterator_dereference, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_const_iterator_t, Ptr{ppl_const_Polyhedron_t}), ps, d)
end

function ppl_delete_Pointset_Powerset_NNC_Polyhedron_iterator(psit)
    ccall((:ppl_delete_Pointset_Powerset_NNC_Polyhedron_iterator, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_iterator_t,), psit)
end

function ppl_delete_Pointset_Powerset_NNC_Polyhedron_const_iterator(psit)
    ccall((:ppl_delete_Pointset_Powerset_NNC_Polyhedron_const_iterator, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_const_iterator_t,), psit)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_add_disjunct(ps, d)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_add_disjunct, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Polyhedron_t), ps, d)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_drop_disjunct(ps, cit, it)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_drop_disjunct, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Pointset_Powerset_NNC_Polyhedron_iterator_t, ppl_Pointset_Powerset_NNC_Polyhedron_iterator_t), ps, cit, it)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_drop_disjuncts(ps, first, last)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_drop_disjuncts, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Pointset_Powerset_NNC_Polyhedron_iterator_t, ppl_const_Pointset_Powerset_NNC_Polyhedron_iterator_t), ps, first, last)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_BHZ03_BHRZ03_BHRZ03_widening_assign(x, y)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_BHZ03_BHRZ03_BHRZ03_widening_assign, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Pointset_Powerset_NNC_Polyhedron_t), x, y)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_BHZ03_H79_H79_widening_assign(x, y)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_BHZ03_H79_H79_widening_assign, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Pointset_Powerset_NNC_Polyhedron_t), x, y)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_BGP99_BHRZ03_extrapolation_assign(x, y, disjuncts)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_BGP99_BHRZ03_extrapolation_assign, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Pointset_Powerset_NNC_Polyhedron_t, Cint), x, y, disjuncts)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_BGP99_H79_extrapolation_assign(x, y, disjuncts)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_BGP99_H79_extrapolation_assign, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, ppl_const_Pointset_Powerset_NNC_Polyhedron_t, Cint), x, y, disjuncts)
end

function ppl_io_print_Pointset_Powerset_NNC_Polyhedron(x)
    ccall((:ppl_io_print_Pointset_Powerset_NNC_Polyhedron, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_t,), x)
end

function ppl_io_fprint_Pointset_Powerset_NNC_Polyhedron(stream, x)
    ccall((:ppl_io_fprint_Pointset_Powerset_NNC_Polyhedron, libppl_c), Cint, (Ptr{Libc.FILE}, ppl_const_Pointset_Powerset_NNC_Polyhedron_t), stream, x)
end

function ppl_io_asprint_Pointset_Powerset_NNC_Polyhedron(strp, x)
    ccall((:ppl_io_asprint_Pointset_Powerset_NNC_Polyhedron, libppl_c), Cint, (Ptr{Ptr{Cchar}}, ppl_const_Pointset_Powerset_NNC_Polyhedron_t), strp, x)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_ascii_dump(x, stream)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_ascii_dump, libppl_c), Cint, (ppl_const_Pointset_Powerset_NNC_Polyhedron_t, Ptr{Libc.FILE}), x, stream)
end

function ppl_Pointset_Powerset_NNC_Polyhedron_ascii_load(x, stream)
    ccall((:ppl_Pointset_Powerset_NNC_Polyhedron_ascii_load, libppl_c), Cint, (ppl_Pointset_Powerset_NNC_Polyhedron_t, Ptr{Libc.FILE}), x, stream)
end

const PPL_ppl_c_h = 1


const PPL_VERSION = "1.2"

const PPL_VERSION_MAJOR = 1

const PPL_VERSION_MINOR = 2

const PPL_VERSION_REVISION = 0

const PPL_VERSION_BETA = 0

# Skipping MacroDefinition: PPL_TYPE_DECLARATION ( Type ) \
#/*! \brief Opaque pointer \ingroup Datatypes */ typedef struct ppl_ ## Type ## _tag * ppl_ ## Type ## _t ; \
#/*! \brief Opaque pointer to const object \ingroup Datatypes */ typedef struct ppl_ ## Type ## _tag const * ppl_const_ ## Type ## _t ;

# Skipping MacroDefinition: PPL_DECLARE_PRINT_FUNCTIONS ( Type ) \
#/*! \relates ppl_##Type##_tag */ int ppl_io_print_ ## Type PPL_PROTO ( ( ppl_const_ ## Type ## _t x ) ) ; \
#/*! \relates ppl_##Type##_tag */ int ppl_io_fprint_ ## Type PPL_PROTO ( ( FILE * stream , ppl_const_ ## Type ## _t x ) ) ; \
#/*! \relates ppl_##Type##_tag */ int ppl_io_asprint_ ## Type PPL_PROTO ( ( char * * strp , ppl_const_ ## Type ## _t x ) ) ;

# Skipping MacroDefinition: PPL_DECLARE_ASCII_DUMP_LOAD_FUNCTIONS ( Type ) \
#/*! \relates ppl_##Type##_tag */ int ppl_ ## Type ## _ascii_dump PPL_PROTO ( ( ppl_const_ ## Type ## _t x , FILE * stream ) ) ; \
#/*! \relates ppl_##Type##_tag */ int ppl_ ## Type ## _ascii_load PPL_PROTO ( ( ppl_ ## Type ## _t x , FILE * stream ) ) ;


# Skipping MacroDefinition: PPL_DECLARE_AND_DOCUMENT_PRINT_FUNCTIONS ( Type ) \
#/*! \relates ppl_##Type##_tag \brief Prints \p x to \c stdout. */ int ppl_io_print_ ## Type PPL_PROTO ( ( ppl_const_ ## Type ## _t x ) ) ; \
#/*! \relates ppl_##Type##_tag \brief Prints \p x to the given output \p stream. */ int ppl_io_fprint_ ## Type PPL_PROTO ( ( FILE * stream , ppl_const_ ## Type ## _t x ) ) ; \
#/*! \relates ppl_##Type##_tag \brief Prints \p x to a malloc-allocated string, a pointer to which is returned via \p strp. */ int ppl_io_asprint_ ## Type PPL_PROTO ( ( char * * strp , ppl_const_ ## Type ## _t x ) ) ;

# Skipping MacroDefinition: PPL_DECLARE_AND_DOCUMENT_ASCII_DUMP_LOAD_FUNCTIONS ( Type ) \
#/*! \relates ppl_##Type##_tag \brief Dumps an ascii representation of \p x on \p stream. */ int ppl_ ## Type ## _ascii_dump PPL_PROTO ( ( ppl_const_ ## Type ## _t x , FILE * stream ) ) ; \
#/*! \relates ppl_##Type##_tag \brief Loads an ascii representation of \p x from \p stream. */ int ppl_ ## Type ## _ascii_load PPL_PROTO ( ( ppl_ ## Type ## _t x , FILE * stream ) ) ;

# Skipping MacroDefinition: PPL_DECLARE_AND_DOCUMENT_IO_FUNCTIONS ( Type ) \
#/*! \brief \name Input/Output Functions */ \
#/*@{*/ PPL_DECLARE_AND_DOCUMENT_PRINT_FUNCTIONS ( Type ) PPL_DECLARE_AND_DOCUMENT_ASCII_DUMP_LOAD_FUNCTIONS ( Type )

end # module
