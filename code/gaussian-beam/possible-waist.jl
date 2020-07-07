using Plots

# include variables and function definitions

include("./gaussianbeam.jl")

# different possible beam profiles

N = 13 # number of beams to plot
z = range(-350e-6, 350e-6; length=1000)     # z range
wa = range(4.2e-6,5.7e-6, length=N)'        # range of waists for 1P
wb = range(5.8e-6,7.3e-6, length=N)'        # range of waists for 2P
lw = ones(N)'; lw[Int(ceil(N/2))] = 2;      # line widths

# plot it 

 plot(z*1e6, gaussian_width.(z,wa,λ1)*1e6, color=RGBA(0,0,1,0.7), lw=lw, legend=false, size=(800,600))  
plot!(z*1e6, gaussian_width.(z,wb,λ2)*1e6, color=RGBA(1,0,0,0.7), lw=lw)
title!("optimal waist for light sheet in water")
xlabel!("distance to waist (µm)")
ylabel!("beam width (µm)")

gui()

# savefig("gaussianbeamprofilewater.png")
