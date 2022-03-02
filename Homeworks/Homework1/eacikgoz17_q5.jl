using Random, Statistics, Plots, Printf
Random.seed!(430)
N = 10000;

# generate 10000 realizations of a Gaussian random variable Xn with mean 1 and variance 4
X_n = 2 * randn(N) .+ 1;
@printf("%d Gaussian random variable Xn with mean: %.5f and variance: %.5f\n", N, mean(X_n), var(X_n))

# Calculate S_n
S_n = 1/length(X_n[1:N]) * sum(X_n[1:N])
@printf("Obtained Sn: %.5f from Xn samples\n", S_n)

# Define the running average
function running_avg(n)
    values = []
    for i in 1:n
        S_n = 1/length(X_n[1:i]) * sum(X_n[1:i])
        push!(values, S_n)
    end
    return values
end

# Samples for each n values from 1 to 10,000
X_nSamples = running_avg(N);

# Plot |Sn − 1| as a function of n
S_nMinus1 = abs.(X_nSamples .- 1);
display(plot(1:N, S_nMinus1, labels="|Sn − 1|", xlabel="N", ylabel="|Sn − 1|"))

# Define the time correlation
function time_correlation(X_n, n)
    Kn_list = []
    for n in 1:N-1
        Kn=0
        for k in 1:n
            Kn += X_n[k]*X_n[k+1]
        end
        val = 1/n * Kn;
        push!(Kn_list, val)
    end
    return Kn_list
end

# Plot Kn
T = time_correlation(X_n, N);
display(plot(1:length(T), T, labels="Kn", xlabel="N", ylabel="Kn"))


