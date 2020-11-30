include("./grinlens.jl")
using .Grinlens
using Plots

# === beam profile for different powers ===
pows = 0.2:0.05:0.4 # powers in watt
P = map(p -> Parameters(P=p, l=1e-6, w0=4e-6, n=1.33), pows) # parameter array
O = propagate.(P) # observables for these parameters

# plot beam profile in water
plot()
for (i,pow) in enumerate(pows)
    p = P[i]
    o = O[i]
    plot!(p.steps*1e3, o.wonlens*1e6, label="$pow W", lw=2) # mm / µm
end
xlims!(9,12.5)
ylims!(0,50)

title!("beam profiles")
xlabel!("position in tank (mm)")
ylabel!("beam width at 1/e (µm)")

# savefig("grinlensplots_profile.png")


# === waist position model vs experiments ===
pows = 0.2:0.01:0.4
P = map(p -> Parameters(P=p, l=1e-6, w0=4e-6), pows)
p = P[1]
O = propagate.(P)

minwidthpos = map(o->o.minwidthpos-p.z0, O).*1e3 # mm 
plot(pows, minwidthpos, label="numerical model", lw=3)

exppows=[0.213, 0.248, 0.284, 0.319, 0.355] # W
expshift=[-130, -80, 0, 50, 110] .* 1e-3 .+ minwidthpos[findfirst(isequal(0.29),pows)]   # mm

plot!(exppows, expshift, seriestype=:scatter, label="experimental values")

title!("propagation in absorbing medium")
xlabel!("laser power (W)")
ylabel!("focal shift (mm)")

# savefig("grinlensplots_model.png")


# === contribution of each slice

P = Parameters(P=0.2, w0=5e-6)
O = propagate(P)

plot(P.steps*1e2, O.shift*1e6, lw=3)
title!("contribution of each slice of water, l=10µm")
xlabel!("propagation distance (cm)")
ylabel!("focal shift (µm)")

# savefig("grinlensplots_contribution.png")