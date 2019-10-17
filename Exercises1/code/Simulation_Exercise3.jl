#### Simulation Exercise 3 #### 

using Plots; pyplot()
using SymPy
using LaTeXStrings

x  = symbols("x", real=true)
ex = ((2+x)^y[1])*((1-x)^(y[2]+y[3]))*x^y[4]
solution = solve(diff(ex))
argmle = SymPy.N(solution[5])
mle    = round(SymPy.N(ex.subs(x,argmle)))

function rejection_sampling(N=1000)
    post(θ,y) = ((2+θ)^y[1])*((1-θ)^(y[2]+y[3]))*θ^y[4]
    y = [69,9,11,11]
    size = 0
    sample = zeros(N)
    T = zeros(0)
    t = 0
    while size < N
        x = rand()
        u = rand()
        if u <= post(x,y)/mle
            size+=1
            sample[size] = x
            append!(T , t)
            t = 0
        end
        t += 1
        
    end
    return sample, T
end


sample, T = rejection_sampling(10_000) 
