
using PauliStrings


function chaotic_chain(N::Int)
    H = Operator(N)
    H += 'X', 1, 'X', 2
    H += -1.05, 'Z', 1
    H += 0.5, 'X', 1
    return OperatorTS1D(H, full=false)
end

function chaotic_chain_op(N::Int)
    H = Operator(N)
    H += 1.05, 'X', 1, 'X', 2
    H += 'Z', 1
    return OperatorTS1D(H, full=false)
end
