module ParmaPolyhedra

include("gen/ppl.jl")

function __init__()
    err = PPL.ppl_initialize()
    if !iszero(err)
        error("Error in initialization of the Parma Polyhedra Library: `ppl_initialize` returned error code `$err`.")
    end
end

end # module ParmaPolyhedra
