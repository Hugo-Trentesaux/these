include("./gaussianbeam.jl")
using .GaussianBeam

using Plots

# variables
n = 1       # medium refraction index
λ1 = 488e-9 # 1P laser wavelength
λ2 = 915e-9 # 2P laser wavelength

# different possible beam profiles

N = 13 # number of beams to plot
z = range(-100e-6, 100e-6; length=1000)     # z range
wa = range(2.2e-6,3.7e-6, length=N)'        # range of waists for 1P
wb = range(3.8e-6,5.3e-6, length=N)'        # range of waists for 2P
lw = ones(N)'; lw[Int(ceil(N/2))] = 3;      # line widths

# plot it 

plot(size=(800,600))
plot([-100, 100], [4, 4], linewidth=1, linestyle=:dash, linecolor=:gray, thickness_scaling=1.5, gridlinewidth=2)
plot!(z*1e6, gaussian_width.(n,z,wa,λ1)*1e6, color=RGBA(0,0,1,0.7), lw=lw, legend=false, size=(800,600))  
#plot!(z*1e6, gaussian_width.(n,z,wb,λ2)*1e6, color=RGBA(1,0,0,0.7), lw=lw)
title!("optimal waist for light sheet in water")
xlabel!("distance to waist (µm)")
ylabel!("beam width (µm)")
ylims!(0,8);

title!("waist optimal d'une nappe laser dans l'eau")
xlabel!("distance au waist (µm)")
ylabel!("largeur du faisceau (µm)")

gui()

# savefig("possible-waist.png")
