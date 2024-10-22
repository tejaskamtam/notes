---
course: PHYSICS 1C
area: ucla
created: 2023-01-09T16:47
updated: 2023-01-29T20:58
📕 courses:
  - "[[Physics 1C- EM, Waves, & Optics]]"
parent: PHYSICS 1C

title: Magnetic Forces - ch. 27

layout: note

---
# Definitions and Examples

---

# Big Ideas

---

## Bar Magnets

- polarized with North being red
- ferromagnetic: objects that contain iron but are not magnetic themselves can be attracted by magnets
- Earth is a magnetic dipole with South pole near true geographical North
- magnetic monopoles have not been discovered

### How Magnets work

- magnets originate from the electrons that orbit the nucleus of the atoms in the substance
    - electrons have a magnetic moment due to quantum mechanical characteristics
- an individual tom obtains a magnetic moment when a significant fraction of its electrons align in the same direction → in large quantities of atoms → bar magnets
- in unmagnetized materials, the magnetic moments of individual toms are randomly oriented → 0 net magnetic moment
- a bar magnet attracts an unmagnetized iron nail by:
    - magnetic field of the bar magnetic inducing a non-zero net magnetic moment in the iron
    - the nonuniform field of the bar magnet causes the nail dipole to attract towards the magnet

## Electric currents and Magnetic Fields

- moving charges (current $\vec I$﻿) create **magnetic fields** in space
- magnetic fields exert force on other moving charges present in the field
- magnetic fields are vector fields denoted $\vec B$﻿
- the direction of $\vec B$﻿ is denoted by the direction of the South pole (where compass points N)

### Magnetic Force

- Right-hand rule gives direction of the force on a moving Positive charge
- index in the direction of velocity, middle points to $\vec B$﻿, thumb points at $\vec F$﻿

$\vec F=q(\vec v \times \vec B + \vec E)$

- magnetic force is applied perpendicular to the magnetic field lines i.e. $\vec F \perp \vec B$﻿
- this suggests if the charge is moving parallel to $\vec B$﻿ then $\vec F = 0$﻿

### Units

- SI for magnetic field is called the Tesla (1 T) in honor of Nikola Tesla

$1\space T=1\space N/A\cdot m$

- another unit is the Gauss ($1\space G=10^{-4}\space T$﻿)
- The magnetic field of Earth is on the magnitude of 1 Gauss

## Magnetic Flux

- the amount of magnetic field going through a surface of area $dA$﻿ given by surface normal vector $d\vec A$﻿
- magnetic flux is given by

$d\Phi_B=B_\perp dA$

- total magnetic flux is defined as

$\Phi_B=\int Bcos\phi dA=\int B_\perp dA=\int \vec B\cdot d\vec A$

- the SI unit of magnetic flux is the Weber ($1\space Wb=1 \space T\cdot m^2$﻿) in honor of Wilhelm Weber
- e.g.
    
    ![[/Untitled 56.png|Untitled 56.png]]
    

## Gauss’s Law

### Gauss’s law for Electric Flux

- the total electric flux through a closed surface $\propto$﻿ electric charge enclosed

$\oint \vec E\cdot d\vec A=\frac{q_{\text{enc}}}{\epsilon_0}$

- if the enclosed charge was an electric dipole, the total electric flux is 0

### Gauss’s Law for Magnetic Flux

- the total magnetic flux passing through a closed surface

$\oint\vec B\cdot d\vec A=0$

- because magnetic monopoles have never been found, the magnetic flux through any closed surface is 0
- this implies and proves that all magnetic field lines form closed loops

## Uniform Magnetic Fields

### Circular Motion

- uniform circular motion and magnetic field
    
    ![[/Untitled 1 43.png|Untitled 1 43.png]]
    
    - we can use the centripetal force formula to solve for the magnetic field and force
    
    ![[/Untitled 2 39.png|Untitled 2 39.png]]
    
- cyclotron frequency
    
    - referring to the previous question, we can use the angular speed to find the cyclotron frequency $f$﻿
    
    ![[/Untitled 3 33.png|Untitled 3 33.png]]
    

### Helical Motion

- when the velocity has distinct parallel and perpendicular components to the field, its path can be described by a helix w/ constant speed and kinetic energy
    
    ![[/Untitled 4 31.png|Untitled 4 31.png]]
    
- Radius of orbit

$R=\frac{mv_\perp}{|q|B}$

- Angular speed $\omega$﻿

$\omega=\frac{|q|B}{m}$

### Velocity Selector

- uses perpendicular electric and magnetic fields to select particles of a specific speed
- $qE=qvB \iff$﻿ particles travel in a straight line (no deflection)

$v=\frac E B$

- used in Thomson’s $e/m$﻿ experiment to find the mass of an electron
- kinetic energy from lost electric potential

$\frac 1 2mv^2=eV\implies v=\sqrt{\frac{2eV}{m}}$

### Mass Spectrometer

- uses velocity selector to send particles of $v=E/B$﻿ into another magnetic field to calculate mass by measuring orbit radius
- mass by radial orbit

$m=\frac{qB'R}{v}=\frac{qBB'R}{E}$

## Nonuniform Magnetic Fields

- the motion of charges in such fields are complex
    - charges can be trapped in magnetic bottles
    - the field shape causes particles to oscillate between the ends of the magnetic bottle
    - this characteristic is used to trap content like plasmas
    - e.g. magnetic bottle
        
        ![[/Untitled 5 25.png|Untitled 5 25.png]]
        

### Van Allen Radiation Belts

- the Earth’s magnetic poles cause magnetic bottles → belts of charged particles in the atmosphere
- aurora borealis (northern lights) and aurora australis (southern lights)
- e.g.
    
    ![[/Untitled 6 24.png|Untitled 6 24.png]]
    

## Magnetic Forces on Current-Carrying Conductors

### Force on Point Charges in a Wire

- conductors have some current density $\vec J=nq\vec v_d\space [A/m]$﻿
    
    - where $n$﻿ is the total number of charges per unit volume
    - $\vec v_d$﻿ is the drift velocity of charges
    
    $\vec v_d=\frac{\vec I}{neA}$
    
- force on a single charge in a wire

$F=qv_dB$

- total force on all charges in the segment

$F=(nAl)(qv_dB)=(nqv_dA)(lB)$

### Force on Segments of a Wire

- magnetic force on a segment of a straight wire

$\vec F=I\vec l\times \vec B=IlB\sin\phi$

- if the wire is not straight wee can iterate over straight segments

$d\vec F=I\cdot d\vec l\times \vec B\implies\vec F = \int I\cdot d\vec l\times \vec B$

### Force and Torque on a Current Loop

- In uniform magnetic fields, total force on a current loop = 0
- however, magnetic fields can induce torque on the loop
    
    - torque formula ($\vec r$﻿ is the moment arm)
    
    $\vec \tau =\vec r\times \vec F$
    
- magnetic moment (for $A$﻿ is the area of the loop)

$\mu=IA$

- torque due to magnetic force

$\tau=\mu B\sin\phi=IAB\sin\phi$

### Magnetic Torque and Potential Energy

- magnetic moment vector for a magnetic dipole (for normal vector $\vec A$﻿ to the area of the planar loop) i.e. **loop must be bound to a single plane**
    - the loop must exist n only 1 plane
    - the direction of the moment is in the direction of the area vector $\vec A$﻿ which is normal to the surface itself (counter-clockwise→up; clockwise→down)

$\vec u=I\vec A$

- magnetic torque of a loop

$\vec\tau=\vec\mu\times\vec B$

- potential energy due to magnetic torque

$U=-\vec\mu\cdot\vec B=-\mu B\cos\phi$

- for a solenoid with $N$﻿ loops

$\mu=NIA\\\tau=NIAB\sin\phi$

## Magnetic Dipole in Nonuniform Magnetic Fields

- a magnetic dipole in a nonuniform magnetic field can experience aa non-zero magnetic force
- a current loop placed near a pole can induce a force on itself depending on the direction of the magnetic moment and pole

![[/Untitled 7 23.png|Untitled 7 23.png]]

- this is due to the current loop acting much like a bar magnet

## DC Motor

![[/Untitled 8 21.png|Untitled 8 21.png]]

- rotor - a wire loop that is free to rotate about an axis with ends attached to the curved conductors of the commutator
- current flows into the red side and out. the blue side
- → magnetic torque causes rotor to spin
- the potential difference between its terminals is $V_{ab}$﻿ and current $I$﻿
- power

$P_{\text{in}}=V_{ab}I\\ P_{\text{dissipated}}=I^2r\\$

- for series motor with internal resistance $r$﻿:
- emf and potential difference

$\mathcal{E}=V_{ab}-Ir \\ V_{ab}=\mathcal{E}+Ir$

## Hall Effect

- passing a current with current density $\vec J=nq\vec v_d$﻿ through a conductor while in a magnetic field $\vec B$﻿ produces the Hall effect
- point charges in the current are deflected due to the imposed magnetic field (same for pos/neg charges)
- as charges accumulate in the conductor in the transverse direction of the current → electric field $\vec E$﻿ is generated to counteract magnetic force → allows charges to pass through undeflected

$v_d=-\frac{E}{B}\\ E=-v_dB=\frac{J}{nq}B=\frac{V}{l}=\frac{\mathcal{E}_H}{l}$

- Hall voltage - the potential difference across the conductor due to the generated electric field
- this gives the sign of charge carriers and charge pr unit volume within the conductor

$nq=-\frac{JB}{E}$

# Slides

---

![[/ch27_lecture.pdf|ch27_lecture.pdf]]

  

📌

**SUMMARY  
**