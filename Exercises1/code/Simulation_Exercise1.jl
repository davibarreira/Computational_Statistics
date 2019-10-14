#### Simulation Exercise 1 #### 

using Plots; pyplot()

# x^2 + y^2 <= r^2
function calculate_pi(N = 1000)
    S = 0
    x, y = rand(N), rand(N)
    c    = zeros(N)
    for i in 1:N
        if x[i]^2+y[i]^2 <= 1
            S+=1
            c[i] = 1
        end
    end
    π = 4*S/N
    return π,x,y,c
end

N = [100,1_000,10_000,100_000]
v,x,y,c = calculate_pi(10_000)

p = scatter(x,y,zcolor=c,markersize=2,markerstrokewidth = 0,c=:bluesreds,fmt =:png,legend=false)