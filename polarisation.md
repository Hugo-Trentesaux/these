### Maintenir la polarisation

When illumination is in in the same direction as the light we collect, polarization is not a problem, since the dipole (fluorophore) is seen from the same direction. But when illumination is orthogonal to light collection, rotating the polarization changes the dipole's emission direction and then the collected light intensity as shown in below figure.

![polarization](./img/polarization.png)

Depending on the α angle, the perceived light can vary from 100% (α = 0°) to 0° (α = 90°). That's why keeping the polarization as stable as possible is a big issue. Since there is no polarization-maintaining fiber for pulsed laser, the solution is to use the rotation-invariant circular polarization. The remaining issue is then change in polarization ellipticity and transmission variation.

#### Polarisation circulaire

To transform a linear polarization to a circular one, I use a quarter wave plate. This induces a near λ/4 or φ=π/2+dφ  retardance on one direction of polarization. In the plate's coordinate system :
$$
\vec{E} = \vec{E}_x \cos(\vec{k}.\vec{r}-\omega t) + \vec{E}_y \cos(\vec{k}.\vec{r}-\omega t + \varphi)
$$
If we tune the plate's orientation at 45° of the linear polarized light, we get Ex = Ey and by projecting on the x+y direction :
$$
E \propto (1+\sin\mathrm{d}\varphi)\cos(\vec{k}.\vec{r}-\omega t) + (\cos \mathrm{d}\varphi) \sin(\vec{k}.\vec{r}-\omega t)
$$
This gives the major axis and the minor axis of the ellipsis and the ratio for small dφ :
$$
\left\lbrace \begin{array}{ll} a & = & 1+\sin\mathrm{d}\varphi & \simeq & 1+\mathrm{d}\varphi \\
b & = & \cos\mathrm{d}\varphi & \simeq & 1-(\mathrm{d}\varphi)^2
\end{array} \right. \\
\tan{\theta} = \frac{a}{b} = \frac{1+\mathrm{d}\varphi }{ 1-(\mathrm{d}\varphi)^2} = \frac{1}{1-\mathrm{d}\varphi} \simeq 1 + \mathrm{d}\varphi 
$$
This means that to keep a variation under 1% we have to keep a phase shift under 1% for all wavelength present in the beam.

#### Application à un laser pulsé

A pulsed laser spans over multiple wavelength with a total spectral width.
$$
\Delta \lambda_t = \frac{\lambda^2}{c}\Delta\nu_t
$$
The total frequency width can be deducted from the pulse width.
$$
\Delta\nu_t = \frac{1}{\Delta t}
$$
Thus at 930nm and 100fs pulse (FP cavity 80MHz), this leads to ≃30nm of span. The associated dφ is around 2%. We should get a quasi circular polarized light at the output of the waveplate. To measure this, I project the polarization with a polarizing cube and rotate it's axis.

![waveplate_carac](./img/waveplate_carac.png)

> the polarizer cube is rotating around the laser axis, projecting the quasi-circular polarization on all the directions

The maximum intensity measured in the power-meter corresponds to the long axis direction while the minimum corresponds to the short axis direction. The polarizer cube is rotated by hand on several rounds. This leads to a sinusoid.

![zero](./img/zero-order_942nm.svg)

> A quasi circular polarization projected on a rotating polarizer. The variation of power show the difference between long axis and short axis.




