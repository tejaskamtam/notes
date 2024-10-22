---
course: PHYSICS 1C
area: ucla
created: 2023-01-25T12:41
updated: 2023-01-31T20:19
📕 courses:
  - "[[Physics 1C- EM, Waves, & Optics]]"
parent: PHYSICS 1C

title: Electromagnetic Induction - ch. 29

layout: note

---
# Definitions

---

# Big Ideas

---

## Magnetic Flux

$\Phi_B=\oint\vec B\cdot d\vec A=\int B\space dA\cos\phi\space[\text{Wb}]$

- where $\phi$﻿ is the angle between the magnetic field and normal vectors
    
    ![[/Untitled 41.png|Untitled 41.png]]
    
- for a uniform magnetic field over a flat area

$\Phi_B=\vec B\cdot\vec A=BA\cos\phi\space [\text{Wb}]$

- Field Lines
    
    ![[/Untitled 1 30.png|Untitled 1 30.png]]
    

## Faraday’s Law of Induction (EMF)

- the induced electromotive force (emf) in a closed loop is time-variant

$\mathcal E=-\frac{d\Phi_B}{dt}\space [\text{V}=\text{Wb/s}]$

$\frac{d\Phi_B}{dt}=\begin{cases}$

- the emf can induce a current in the loop
- the curled right-hand rule curls in the direction of positive emf (thumb pointing parallel to normal vector)
    
    ![[/Untitled 2 28.png|Untitled 2 28.png]]
    

### Coil (@import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$N$﻿ turns and same rate of flux change)

$\mathcal E=-N\frac{d\Phi_B}{dt}$

### Simple Alternator (AC Generator)

- alternator - a device that generates a emf by rotating a rectangular loop at an angular speed $\omega$﻿ through a constant magnetic field $\vec B$﻿
    
    ![[/Untitled 3 23.png|Untitled 3 23.png]]
    
- if the angle $\phi=0$﻿ w/ respect to $\vec B$﻿ at $t=0$﻿

$\Phi_B(t)=BA\cos\phi=BA\cos(\omega t)$

$\mathcal E=-\frac{d\Phi_B}{dt}=-\frac{d}{dt}(BA\cos\omega t)=\omega BA\sin(\omega t)$

### Slidewire Generator

- a U-shaped conductor with a metal rod of length $L$﻿ that is allowed to slide along the rails in a uniform magnetic field
- the flux through the loop bound by the rod changes as the rod moves with velocity $v$﻿ such that an induced emf → current counterclockwise around the loop
    
    ![[/Untitled 4 22.png|Untitled 4 22.png]]
    

$\mathcal E=-\frac{d\Phi_B}{dt}=-B\frac{dA}{dt}\cos\phi=-BLv\space [\text{V}]$

### Work and Power

- the rod has resistance $R$﻿ → the induced current gives us the power dissipated

$I=\frac{|\mathcal E|}{R}=\frac{BLv}{R}\\\space\\$

- the rod’s motion is sustained by an external force counteracting the magnetic force caused by the current running through the rod
    
    ![[/Untitled 5 19.png|Untitled 5 19.png]]
    

$F=ILB=\frac{B^2L^2v}{R}$

- this gives the rate of work NECESSARY keep the rod moving

$P_\text{applied}=Fv=\frac{B^2L^2v^2}{R}$

## Lenz’s Law

- to find the direction of induced EMF and current
- the direction of the induced magnetic field is opposite the cause of the effect (the change in magnetic field)
    
    ![[/Untitled 6 19.png|Untitled 6 19.png]]
    
- e.g. bar magnets on a loop of wire
    
    ![[/Untitled 7 18.png|Untitled 7 18.png]]
    

## Motional EMF

### Isolated moving rod

- a conducting rod of length $L$﻿ is moving with velocity $v$﻿, the motion of this rod causes a magnetic (Lorentz) force on the free charges within the rod
- Because there is no voltage yet, the charges move towards the ends of the rod → voltage difference → electric force opposite the magnetic force
- these forces reach equilibrium when

$F_E=F_B\implies qE=qvB\implies E=vB$

- this allows us to find the potential difference ass this mimics the voltage difference across capacitor plates → motional emf

$V_{ab}=EL=vBL=|\mathcal E|$

- this presents 2 explanations for the current in the slide-wire generator:
    - 1) the Lorentz force of a moving rod creates an electric field, which when connected in a loop → creates a current
    - 2) the change in magnetic flux due to changing area induces a current in the wire

### General Form

- motional emf generalized to conductors of any shape, uniform or non-uniform magnetic fields, differing velocities per section under CONSTANT magnetic field

$d\mathcal E=(\vec v\times\vec B)\cdot d\vec l$

- for a closed loop
    
    ![[/Untitled 8 16.png|Untitled 8 16.png]]
    

$\mathcal E=\oint (\vec v\times\vec B)\cdot d\vec l$

## Faraday Disk Dynamo

- a conducting disk of radius $R$﻿ with constant angular velocity $\omega$﻿ in a uniform magnetic field $\vec B$﻿ perpendicular to the disk
    
    ![[/Untitled 9 13.png|Untitled 9 13.png]]
    
- there is a motional emf between the center of rotation to the rim of the disk (due to infinitesimal sections on the disk are moving → have changing flux
- the partial emf of each point shows that there is a tangential velocity at each differential pint on the disk (in the direction of angular momentum) which, by right-hand rule, causes emf toward the rim along the radial line denoting the differential section of the disk → to the rim

$d\vec l=dr\cdot \hat r\implies\\$

- integrating over the radius of the disk due to the emf depending on the radial direction

$\mathcal E=\int_0^R\omega Brdr=\frac12\omega BR^2$

- To use Faraday’s law, you must consider the area “swept out” by the change in position of any differential point on the disk → causing a change in flux
    
    ![[/Untitled 10 11.png|Untitled 10 11.png]]
    

## Eddy Currents (Induced Electric Fields)

### Induced electric fields

- stationary solenoid has cross-sectional area $A$﻿ with $n$﻿ turns per unit length and time-varying current $I(t)$﻿, then flux
    
    ![[/Untitled 11 9.png|Untitled 11 9.png]]
    

$\Phi_B(t)=B(t)A_{\text{sol}}=\mu_0nA_{\text{sol}}\cdot I(t)$

- then the EMF and induced current is

$\mathcal E=-\frac{d\Phi_B}{dt}=-\mu_0nA\frac{dI}{dt}\quad\quad I_{\text{ind}}=\frac{|\mathcal E|}{R}$

- this current is induced because of the non-conservative electric field induced in the wire such that

$\oint \vec E\cdot d\vec l=\mathcal E=-\frac{d\Phi_B}{dt}\implies E=\frac{|\mathcal E|}{2\pi r}=\frac1{2\pi r}\left|\frac{d\Phi_B}{dt}\right|$

### Eddy Currents

- a conducting material moving through a magnetic field experiences induced electric currents through the material
    
    ![[/Untitled 12 9.png|Untitled 12 9.png]]
    

## Displacement Current

- Ampere’s law is incomplete (in previous chapters) as it is agnostic to surface are but in the case of aa capacitor, a surface can be drawn such that no current is enclosed → there is something missing due to the electric field between the plates
    
    ![[/Untitled 13 9.png|Untitled 13 9.png]]
    

### Charge as Electric Flux

- we can write the charge on the plates in terms of the electric flux through the Amperian surface

$q=CV=\frac{\epsilon_0 A}d(Ed)=\epsilon_0 EA=\epsilon_0 \Phi_E\\\space\\$

- the current into the plate is $i_C=dq/dt$﻿ such that

$i_C=\frac{dq}{dt}=\epsilon_0\frac{d\Phi_E}{dt}$

- therefore, **displacement current** is

$i_D=\epsilon_0\frac{d\Phi_E}{dt}\implies j_D=\epsilon_0\frac{dE}{dt}$

### Ampere’s Law pt. 2

$\oint\vec B\cdot d\vec l=\mu_0(i_C+i_D)_{\text{enc}}=\mu_0\left(i_C+\epsilon_0\frac{d\Phi_E}{dt}\right)_{\text{enc}}$

- then, for the capacitor system in the image, the magnetic field between the plates due to the changing electric field st. $R$﻿ is the radius of the plates and $r$﻿ is the radius of the Amperian loop
    
    ![[/Untitled 14 6.png|Untitled 14 6.png]]
    

$\oint\vec B\cdot d\vec l=B(2\pi r)=\mu\frac{r^2}{R^2}i_C\implies B=\frac{\mu_0}{2\pi}\frac r{R^2}i_C$

## Maxwell’s Equations for EM

- Along with the Lorentz Force, w hav all the fundamental relationships of electrodynamics

$\vec F=q(\vec E+\vec v\times\vec B)\quad\text{(Lorentz Force)}$

![[/Untitled 15 5.png|Untitled 15 5.png]]

### Empty Space

![[/Untitled 16 4.png|Untitled 16 4.png]]

## Superconductivity

- a superconductor loses electrical resistance when its cooled below critical temp
    
    ![[/Untitled 17 4.png|Untitled 17 4.png]]
    
- increasing the external magnetic field → critical temp decreases

# Resources

---

![[/ch29_lecture.pdf|ch29_lecture.pdf]]

  

📌

**SUMMARY  
**