using Clang.Generators
using PPL_jll

cd(@__DIR__)

include_dir = normpath(PPL_jll.artifact_dir, "include")

options = load_options(joinpath(@__DIR__, "generator.toml"))

args = get_default_args()
push!(args, "-I$include_dir")

headers = [joinpath(include_dir, header) for header in readdir(include_dir) if endswith(header, ".h")]

ctx = create_context(headers, args, options)

build!(ctx)

function manual_corrections(file)
    tmp = tempname()
    cp(file, tmp)
    open(tmp, "r") do input
    open(file, "w") do output
        for line in readlines(input)
            if !contains(line, "protos") && !contains(line, "PPL_DECLARE_IO_FUNCTIONS")
                println(output, line)
            end
        end
    end
    end
end
manual_corrections(joinpath(@__DIR__, "..", "src", "gen", "ppl.jl"))
