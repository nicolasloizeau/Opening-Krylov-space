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


N = 30
# construct a Hamiltonian and an operator
H = chaotic_chain(N)
O = chaotic_chain_op(N)

steps = N
# compute the Lanczos coefficients
b = lanczos(H, O, steps, 2^20)

# construct the open krylov chain and diagonalize it
L = buildL(b)
e = eigvals(L)

# plot the liouvillian spectrum
plt.xlabel("Re ω")
plt.ylabel("Im ω")
plt.scatter(real(e), imag(e))
plt.savefig("example.png", dpi=300)
