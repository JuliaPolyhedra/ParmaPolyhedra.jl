module ParmaPolyhedra

include("gen/ppl.jl")

function ppl(f, args...)
    err = f(args...)
    if !iszero(err)
        error("Error in call of the Parma Polyhedra Library function: `$f` returned error code `$err`.")
    end
end

function ppl_new(T, f, args...)
    ret = Ref{T}()
    ppl(f, ret, args...)
    return ret[]
end

function ppl_get(T, f, args...)
    ret = Ref{T}()
    ppl(f, args..., ret)
    return ret[]
end

function __init__()
    ppl(PPL.ppl_initialize)
end

import Polyhedra

include("hrep.jl")

end # module ParmaPolyhedra
