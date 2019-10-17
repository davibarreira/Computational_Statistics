#### Simulation Exercise 4 #### 

function mixture(N=1000,mix_rate=0.5,mu1=0,sigma1=1,mu2=0,sigma2=1)
    W   = rand(N) .<= (1-mix_rate)
    X,Y = box_muller(N)
    X   = sigma1.*X .+ mu1
    Y   = sigma2.*Y .+ mu2
    Mix = (X).*(W*1) + Y.*(.!W*1)
    return Mix
end
