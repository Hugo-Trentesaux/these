using Plots

# include model
include("./grinlens.jl")

# set parameters and run simulation
p = Parameters()
o = propagate(p)

# plot beam profile in water
plot(p.steps*1e6, o.wonlens*1e6)