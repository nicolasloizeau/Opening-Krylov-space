include("models.jl")

using PauliStrings
using PyPlot
using LinearAlgebra



function buildL(b)
    diag_values = zeros(length(b))
    L = Tridiagonal(b[1:end-1], diag_values, -b[1:end-1])
    L[end, end] = -2 * b[end]
    L[end, end-1] += b[end]
    return 1im * L
end


N = 20

H = chaotic_chain(N)
O = chaotic_chain_op(N)

steps = N

b = lanczos(H, O, steps, 2^20)
L = buildL(b)
e = eigvals(L)
plt.xlabel("Re ω")
plt.xlabel("Im ω")
plt.scatter(real(e), imag(e))
plt.show()
