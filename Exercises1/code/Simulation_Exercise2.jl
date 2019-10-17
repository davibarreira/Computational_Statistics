#### Simulation Exercise 2 #### 

function box_muller(N=100)
    R = (-2*log.(rand(N))).^(1/2)
    v = 2*\pi*rand(N)
    X = R.*cos.(v)
    Y = R.*sin.(v)
    return X,Y
end
