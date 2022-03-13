# Imports
using Random, Statistics, Plots, Printf
Random.seed!(430);

# Part (a)
N = 10000;
Xₙ = randn(2, 1);
μₓ = [0.5; 0.3];
Cₓ = [1 0.6; 0.6 sqrt(2)];

# 2-dimensional Gaussian vector
X = Cₓ * Xₙ + μₓ;
println("Answer of part (a)")
println("2-dimensional Gaussian vector:")
println(X)

# Part (b)
# Generate 10000 vector with related parameters
function generate(matrix, μₓ, n)
    samples = zeros(N, 2)
    for i in 1:n
        X = randn(2, 1);
        X = sqrt(matrix) * X + μₓ;
        samples[i, :] = X;
    end
    return samples
end

# Plot generated samples
samples = generate(Cₓ, μₓ, N)
X₁, X₂ = samples[:, 1], samples[:, 2];
display(plot(X₁, X₂, seriestype = :scatter, title = "Scatter Plot"))

# Part (c)
#∑ = zeros(2,2)
∑ = []
for i in 1:N
    #∑ += samples[i, :]*samples[i, :]'
    push!(∑, samples[i, :]*samples[i, :]')
end
#Sₓ = ∑/N
Sₓ = sum(∑) / N;
println("\nAnswer of part (c) for $N samples: ")
println(Sₓ)


# When we increase "N", convergence will be [1.25 0.75; 0.75 1.504] matrix
println("Convergence limit matrix:")
convergence = Cₓ + μₓ*μₓ'




