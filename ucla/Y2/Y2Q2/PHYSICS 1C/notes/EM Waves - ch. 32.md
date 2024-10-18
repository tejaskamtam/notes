---
course: PHYSICS 1C
area: ucla
created: 2023-02-13T10:50
updated: 2023-02-27T00:09
📕 courses:
  - "[[Physics 1C- EM, Waves, & Optics]]"
---
# Definitions

---

# Big Ideas

---

## Maxwell and Light

- Maxwell proved that an EM wave should propagate in a vacuum (free space) at the speed of light → thus light is an EM wave → Maxwell Equations
    
    ![[/Untitled 47.png|Untitled 47.png]]
    
- these imply an accelerating electric charge must produce EM waves e.g. power lines have AC which create EM waves → buzzing sound
- the EM spectrum - a description of the from of EM waves (visible light at 80-750 nm) based on wavelength and frequencies such that
    
    ![[/Untitled 1 35.png|Untitled 1 35.png]]
    

$\lambda f=c$

  

## Simple Plane EM Wave

- divide space s.t a plane propagates orth. (transverse) to the electric and magnetic field vectors **behind it** and 0 in front - wave front → resulting wave: plane wave
    
    ![[/Untitled 2 32.png|Untitled 2 32.png]]
    

### Gauss’ Laws

- create a volume from the wave front and behind to the origin
    
    ![[/Untitled 3 26.png|Untitled 3 26.png]]
    
- there is no enclosed charge and magnetic flux through the volume is 0 → satisfies Gauss’ laws if the wave is a transverse wave moving orthogonal to $\vec E$﻿ and $\vec B$﻿

### Faraday’s Law

- drawing a loop of height $a$﻿ and width $\Delta x$﻿ parallel to $\vec E$﻿ s.t. the wave front passes through it gives
    
    ![[/Untitled 4 25.png|Untitled 4 25.png]]
    

$\oint \vec E\cdot d\vec l=-Ea$

- for the iterative magnetic flux for iterative time step $dt$﻿ (by Faraday’s Law) is

$\frac{d\Phi_B}{dt}=Bac\implies E=cB$

### Ampere’s Law

- drawing a loop of height $a$﻿ parallel to $\vec B$﻿ s.t. that the wave front passes through it gives
    
    ![[/Untitled 5 22.png|Untitled 5 22.png]]
    

$\oint\vec B\cdot d\vec l=Ba$

- Ampere’s law gives

$\frac{d\Phi_E}{dt}=Eac\implies B=\epsilon_0\mu_0c E$

## Properties of EM Waves

- EM waves are transverse (in direction $\vec E\times \vec B$﻿)
- $E=cB\implies \frac{E}{B}=c$﻿
- EM waves in a vacuum travel at the speed of light

$c=\frac{1}{\sqrt{\epsilon_0\mu_0}}=2.99\times 10^8$

- EM waves don’t require a medium to propagate through

## Sinusoidal EM Waves

- EM waves by an oscillating point charge are an example of sinusoidal waves but for a small space far enough away, the waves can be approximately modeled by plane waves
- given and amplitude of oscillation we can find the displacement using the wavenumber $k=2\pi/\lambda$﻿

$y(x,t)=\cos(kx-\omega t)$

- Similarly, given a sinusoidal EM wave traveling on the x-axis with electric fields on y-axis and magnetic fields of z-axis

$\vec E_y(x,t)=E_{max}\cos(kx-\omega t)\hat j\quad \vec B_z(x,t)=B_{max}\cos(kx-\omega t)\hat k$

- the characteristics are

$A\sim E_{max}=cB_{max}\\$

## EM Waves in Matter

- EM waves can travel through vacuum and matter → when they travel through dielectric materials, the speed is not the same as the speed of light in a vacuum
- given a material with permittivity $\epsilon = K\epsilon_0$﻿ and permeability $\mu=K_m\mu_0$﻿ the wave travels with speed $v$﻿ s.t.

$E=vB\quad B=\epsilon\mu vE$

$v=\frac{1}{\sqrt{\epsilon\mu}}=\frac{1}{\sqrt{KK_m}}\frac{1}{\sqrt{\epsilon\mu}}=\frac{c}{\sqrt{KK_m}}$

- the index of refraction of the material is the ratio of speed of light in vacuum to speed in the material

$n=\frac cv=\sqrt{KK_m}$

## Energy in EM Waves (Poynting)

- The energy density $u$﻿ in a region of space containing field vectors (given $B=E/c$﻿) is

$u=\frac12\epsilon_0E^2+\frac1{2\mu_0}B^2=\epsilon_0E^2$

- then the energy into a volume swept out by a propagating plane wave is

$dU=u\space dV=(\epsilon_0E^2)(Ac\space dt)$

- then, the energy flow per unit time per unit area $S$﻿ is, the vector form of this is the Poynting vector which shows the direction of energy flow rate

$S=\frac 1A\frac{dU}{dt}=\epsilon_0cE^2=\frac{EB}{\mu_0}$

$\vec S=\frac 1{\mu_0}\vec E\times \vec B$

- the total energy through any closed surface is

$P=\oint \vec S\cdot d\vec A$

- for sinusoidal waves with E in y-dir and B in z-dir

$\vec S(x,t)=\frac{1}{\mu_0}\vec E(x,t)\times \vec B(x,t)=\frac{E_{max}B_{max}}{2\mu_0}\cos^2(kx-\omega t)\space\hat i$

- the average of the magnitude of the Poynting vector is the intensity of the wave

$I=S_{avg}=\frac{E_{max}B_{max}}{2\mu_0}=\frac12\epsilon_0cE^2_{max}$

## Radiation Pressure

- EM waves carry energy AND momentum $p$﻿ with a density

$\frac{dp}{dV}=\frac{EB}{\mu_0c^2}=\frac S{c^2}$

- the momentum flow rate for the iterative volume $dV= Ac\space dt$﻿ s.t.

$\frac 1A\frac{dp}{dt}=\frac Sc=\frac{EB}{\mu_0c}$

- the momentum is responsible for the radiation pressure that can be absorbed or reflected by a surface

$p_{rad}=\frac{S_{avg}}{c}=\frac Ic\quad \text{(Totally Absorbed)}\\\space\\$

- Power

$I=\frac{P}{A}\space [W/m^2]$

## Standing EM Waves

- a standing EM wave is a superposition of an incident and reflected wave using conductors/dielectrics as reflection surfaces s.t.

$E_y(x,t)=-2E_{max}\sin kx\space\sin\omega t=E_{max}\cos(kx-\omega t+\phi)\\$

- at the boundaries of the standing wave, the electric field is always 0
- the nodes for the standing wave occur at nodal planes where $\sin kx=0$﻿ s.t.

$x=0,\frac \lambda2,\frac{2\lambda}2,\frac{3\lambda}2,...\quad \text{for $\vec E$}\\\space\\$

- the standing wave on distance $L$﻿ has allowed wavelengths and frequencies

$\lambda_n=\frac{2L}{n}\quad f_n=\frac{c}{\lambda_n}=\frac{nc}{2L}\quad (n\in\Z^+)$

# Resources

---

![[/ch32_lecture.pdf|ch32_lecture.pdf]]

  

📌

**SUMMARY  
**