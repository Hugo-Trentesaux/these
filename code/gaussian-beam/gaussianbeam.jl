
n = 1.33 # water index

λ1 = 488e-9 # 1P laser index
λ2 = 915e-9 # 2P laser index

function gaussian_width(z,w0,l)
    # z propagation
    # w0 waist
    # l wavelength
    global n # index of refraction
    zr = n*pi*w0^2/l
    w = w0*sqrt(1+(z/zr)^2)
    return w
end

function gaussian_intensity(r,z,w0,l)
    # r radius
    # z propagation
    # w0 waist
    # l lambda wavelength
    w = gaussian_width(z,w0,l)
    return (w0/w)^2 * exp(-2*(r/w)^2)
end

