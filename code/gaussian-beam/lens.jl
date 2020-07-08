using Plots

# include variables and function definitions

include("./gaussianbeam.jl")

# effect of a lens in gaussian optics

# before and after lens
before = range(-20e-6, 0, length=100)
after = range(0, 120e-6, length=100)

# beam parameters before lens
sa = 50e-6          # focusing distance
w0a = 1e-6         # waist without lens
zra = rayleigh_length(w0a, λ2)    # Rayleigh length

# diverging lens
fprime = -2e-4

# beam parameters after lens
sb = sprime(sa, fprime, zra)
w0b = w0a * magnification(sa,fprime,zra)
zrb = rayleigh_length(w0b, λ2)

# plot
plot()
plot!(before.*1e6, gaussian_width.(before.-sa,w0a,λ2).*1e6, color=:blue, legend=false)
plot!(before.*1e6, -gaussian_width.(before.-sa,w0a,λ2).*1e6, color=:blue, legend=false)
plot!(after.*1e6, gaussian_width.(after.-sa,w0a,λ2).*1e6, color=:blue, style=:dash)
plot!(after.*1e6, -gaussian_width.(after.-sa,w0a,λ2).*1e6, color=:blue, style=:dash)
plot!(after.*1e6, gaussian_width.(after.-sb,w0b,λ2).*1e6, color=:red)
plot!(after.*1e6, -gaussian_width.(after.-sb,w0b,λ2).*1e6, color=:red)
plot!([0,0], [-20,20], color=:black, lw=2)

title!("gaussian beam optics")
xlabel!("distance from lens (µm)")
ylabel!("beam width (µm)")
ylims!(-20,20)

# savefig("diverginglens")