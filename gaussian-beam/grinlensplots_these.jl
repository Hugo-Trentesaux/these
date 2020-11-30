include("./grinlens.jl")
using .Grinlens
using Plots

# same plots as grinlensplots, but reworked to fit in the figure presented in the these



# === beam profile for different powers ===
exppows = [0.213, 0.248, 0.284, 0.319, 0.355] # experimental powers in watt
P = map(p -> Parameters(P=p, l=1e-6, w0=4e-6, n=1.33), exppows) # parameter array
p = P[1]
O = propagate.(P) # observables for these parameters
ROI = 10100:10770 # ROI for svg

# plot beam profile in water
plot(size=(700,400), gridlinewidth=3, thickness_scaling=1.5)
for (i,pow) in enumerate(exppows)
    p = P[i]
    o = O[i]
    plot!((p.steps[ROI].-p.z0).*1e3, +o.wonlens[ROI].*1e6, lw=3, legend=false, linecolor=colorant"#ff8019a2") # mm / µm
    plot!((p.steps[ROI].-p.z0).*1e3, -o.wonlens[ROI].*1e6, lw=3, legend=false, linecolor=colorant"#ff8019a2") # mm / µm
end
minwidthpos = map(o->o.minwidthpos-p.z0, O).*1e3 # mm 
plot!(minwidthpos, [0,0,0,0,0], seriestype=:scatter, markercolor=:black)

title!("profils des faisceaux")
xlabel!("décalage (mm)")
ylabel!("largeur du faisceau (µm)")

savefig("grinlensplots_these_profile.png")


# === waist position model vs experiments ===
pows = 0.2:0.01:0.38 # pows range for shift computation
P = map(p -> Parameters(P=p, l=1e-6, w0=4e-6, n=1.33), pows)
p = P[1]
O = propagate.(P)

minwidthpos = map(o->o.minwidthpos-p.z0, O).*1e3 # mm 
plot(pows, minwidthpos, label="simulation numérique", lw=5, size=(600,400), legend=:bottomright, gridlinewidth=3, thickness_scaling=1.5) # numerical model

exppows=[0.213, 0.248, 0.284, 0.319, 0.355] # W
expshift=[-130, -80, 0, 50, 110] .* 1e-3 .+ minwidthpos[findfirst(isequal(0.29),pows)]   # mm
# use same shift as in model

plot!(exppows, expshift, seriestype=:scatter, label="données expérimentales", markersize=10, markerstrokealpha=0) # experimental values

xlabel!("puissance laser (W)")
ylabel!("décalage du waist (mm)")

# savefig("grinlensplots_these_model.png")


# === contribution of each slice ===

P = Parameters(P=0.2, w0=4e-6, l=1e-5, steps=0:1e-5:2e-2)   
O = propagate(P)

plot(P.steps*1e2, O.shift*1e6, lw=3, legend=false, size=(500,400), gridlinewidth=3)
xlabel!("distance de propagation dans la cuve (cm)")
ylabel!("décalage dû à une tranche de 10 µm (µm)")

# savefig("grinlensplots_these_contribution.png")

# === minimal width with power ===


# === minimal waist along power ===
pows = 0:0.01:1 # pows range for shift computation
P = map(p -> Parameters(P=p, l=1e-6, w0=4e-6, n=1.33), pows)
O = propagate.(P)

minwidth = map(o->o.minwidth, O).*1e3 # mm 
plot(pows, pows./minwidth.^2, lw=3, size=(600,400), legend=false, gridlinewidth=3, thickness_scaling=1.5) # numerical model

xlabel!("puissance laser (W)")
ylabel!("intensité maximale (W/mm²)")

# savefig("grinlensplots_these_maxpower.png")