# using Plots

# include variables and function definitions

include("./gaussianbeam.jl")

# discrete model for continuous grin lens

l = 1e-3 # width of the liquid slice (m)
λ = λ2 # wavelength (m)
P = 1 # power of laser (W)
k = 0.6 # water thermic diffusion coefficient (W/m/K)
α = 8 # water absorption coefficient (1/m)
dndT = -1e-4 # index variation coefficient (1/K)

focale(l,w) = π * k * w^2 / ( α * P * l * dndT)  # thermally induced focal length of liquid slice

z0 = 1e-2 # initial position of the waist without lens effect (m)
w0 = 6.5e-6 # initial waist of the beam (m)

steps = 0:l:4e-2 # along the tank
for z in steps
    global z0, w0
    
    sa = z0 - z                         # algebric distance lens-object
    w0a = w0                            # waist before lens
    zra = rayleigh_length(w0a, λ)       # Rayleigh length before lens
    wa = gaussian_width(sa, w0a, λ)     # beam width at lens position
    fprime = focale(l, wa)              # thermally induced focal length

    sb = sprime(sa, fprime, zra)        # algebric distance lens-image
    w0b = w0a * magnification(sa, fprime, zra)        # waist after lens

    z0 = z + sb                         # update z0 with new absolute beam position
    w0 = w0b                            # update w0 with new beam waist
end