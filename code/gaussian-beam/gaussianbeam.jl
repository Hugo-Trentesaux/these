
n = 1 # water index

λ1 = 488e-9 # 1P laser index
λ2 = 915e-9 # 2P laser index


# Rayleigh length
function rayleigh_length(w0,λ) 
    # w0 waist
    # λ wavelength
    global n
    return n * π * w0^2 / λ
end

# beam width
function gaussian_width(z,w0,λ)
    # z propagation
    # w0 waist
    # λ wavelength
    global n # index of refraction
    zr = rayleigh_length(w0,λ)
    w = w0*sqrt(1+(z/zr)^2)
    return w
end

# radial intensity
function gaussian_intensity(r,z,w0,λ)
    # r radius
    # z propagation
    # w0 waist
    # λ lambda wavelength
    w = gaussian_width(z,w0,λ)
    return (w0/w)^2 * exp(-2*(r/w)^2)
end


# gaussian beam optics

# magnification
function magnification(s,fprime,zr)
    # s algebric distance object-lens
    # fprime lens focal length
    # zr Rayleigh length
    return abs(fprime) / sqrt( (s+fprime)^2 + zr^2 )
end

# algebric distance image-lens
function sprime(s,fprime,zr) 
    # s algebric distance object-lens
    # fprime lens focal length
    # zr Rayleigh length
    return 1 / ( 1/fprime + 1/(s+(zr^2/(s-fprime))) )
end

sprimethinlens(s,fprime,zr) = 1 / (1/fprime + 1/s)