#### Simulation Exercise 5 #### 

using Plots, Distributions, StatsPlots
pyplot()


# Item 1 - Exact answer
x  = symbols("x")
eq = cos(50*x)+sin(20*x)
I  = integrate(eq,(x,0,1))
Iv = SymPy.N(I)
println(I," = ",Iv)

# Item 2 and 3 - Rejection Sampling
function rejection_sampling(N=1000,M=4)
    f(x) = cos(50*x)+sin(20*x)+2
    size = 0
    sample = zeros(N)
    T = zeros(0)
    t = 0
    while size < N
        x = rand()
        u = rand()
        if u <= f(x)/M
            size+=1
            sample[size] = x
            append!(T , t)
            t = 0
        end
        t += 1
        
    end
    return sample, T
end

erro = 0
for i = 1:10
    N = 1_000_000
    sample, T = rejection_sampling.(N)
    erro += abs(N / sum(T)*4 - 2 - Iv)/Iv*100
end

error = erro/10


# Item 4 - Importance sampling

f(x) = cos(50*x)+sin(20*x)
error = 0
for i = 1:10
    N = 1_000_000
    sample = rand(Distributions.Beta(2,2),N)
    q(x)   = Distributions.pdf(Beta(2,2),x)
    w   = exp.(-log.(q.(sample)))
    error += abs(sum(f.(sample)'* w)/N - Iv)*100
end

error = error / 10
