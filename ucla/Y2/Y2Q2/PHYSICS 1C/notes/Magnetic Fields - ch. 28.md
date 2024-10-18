---
course: PHYSICS 1C
area: ucla
created: 2023-01-17T13:05
updated: 2023-01-29T21:49
📕 courses:
  - "[[Physics 1C- EM, Waves, & Optics]]"
---
# Definitions

---

# Big Ideas

---

## Magnetic Fields of a Moving Charge

- magnetic fields are determined at a point (distance) away from the source and depends on the velocity vector

$\vec B=\frac{\mu_0}{4\pi}\frac{q\vec v\times \hat r}{r^2}=\frac{\mu_0}{4\pi}\frac{q\vec v\times \vec r}{r^3}\quad\text{st.}\quad \hat r=\frac{\vec r}{|\vec r|}$

- $\mu_0$﻿ is the **permeability of free space** given as the magnetic constant

$\mu_0=4\pi\times10^{-7}\space [T\cdot \frac m A]$

- Field Lines:  
    the magnetic field lines form concentric circles around the velocity vector of the charge given by the “curled right hand rule” $\therefore \vec B=0\iff \vec r\times \vec v=0$﻿ (i.e. point of measurement is on the velocity vector)
    
    ![[/Untitled 75.png|Untitled 75.png]]
    

## due to a Straight Current Element

- for a current-carrying conductor segment with constant cross-sectional area $A$﻿, length $dl$﻿, and $n$﻿ charges per unit volume of charge $q$﻿
- given total charge in the segment

$dQ=nqAdl\quad\quad Q=\int nqA\space dl$

- the magnitude of current through the wire

$I=n|q|v_d\cdot A=J\cdot A\quad\text{st.}\quad J=nqv_d$

- Field Lines
    
    ![[/Untitled 1 56.png|Untitled 1 56.png]]
    

### Biot-Savart Law (current elements)

$d\vec B=\frac{\mu_0}{4\pi}\frac{dQ(\vec v_d\times\hat r)}{r^2}=\frac{\mu_0I}{4\pi}\frac{d\vec l\times\hat r}{r^2}$

$\vec B=\frac{\mu_0}{4\pi}\int\frac{Id\vec l\times\hat r}{r^2}$

- Using Biot-Savart for a wire of length $l$﻿ at a distance $r$﻿ away is shown dependent to $r_\perp$﻿

$B=\frac{\mu_0I}{4\pi}\frac{l}{r_\perp\sqrt{r_\perp^2+(l/2)^2}}$

### Infinitely Long Wire

- a rigorous solution provided by Biot-Savart law
- field strength at a perpendicular distance $r$﻿ from the wire

$B=\frac{\mu_0I}{2\pi r_\perp}$

### Between 2 parallel conductors (wires)

- given 2 infinitely long wires → the direction of their currents tell us thheir interaction
- when in the same direction → the wires attract each other through exerted attractive forces on each other
- we can find the force exerted by any given wire as:

$\vec F=I_1\vec L\times\vec B\\$

- this allows us to find force pr unit length of the wire:

$\frac F L=\frac{\mu_0I_1I_2}{2\pi r}$

- Field Lines
    
    Current in SAME direction
    
    ![[/Untitled 2 49.png|Untitled 2 49.png]]
    
    Current in OPPOSITE direction
    
    ![[/Untitled 3 42.png|Untitled 3 42.png]]
    

## due to a Circular Current Loop(s)

### Current Loop

- we can use Biot-Savart to find the differential parts of the field due to a loop with radius $a$﻿ on its normal (central) axis $x$﻿ distance away from the center

$dB=\frac{\mu_0I}{4\pi}\frac{dl}{x^2+a^2}$

- the radial components cancel out and we are left with only the field exerted in the direction of the normal vector

$dB_x=dB\cos\theta=\frac{\mu_0I}{4\pi}\frac{dl}{x^2+a^2}\frac{a}{\sqrt{x^2+a^2}}\\\space\\$

- Field Lines
    
    ![[/Untitled 4 40.png|Untitled 4 40.png]]
    
    ![[/Untitled 5 32.png|Untitled 5 32.png]]
    

### Coil

- a coil can be represented as $N$﻿ stacked current loops such that on the axis of the loop:

$B_x=\frac{\mu_0NIa^2}{2(x^2+a^2)^{3/2}}\\$

- the **magnetic moment** for 1 loop is $\mu=I\pi a^2$﻿, so for $N$﻿ loops → $\mu=NI\pi a^2$﻿
- this implies the field can also be written as

$B_x=\frac{\mu_0\mu}{2\pi(x^2+a^2)^{3/2}}$

## Ampere’s Law

- Ampere’s law works on highly symmetric situations using the line integral in place of Gauss’ flux on a closed path ($l$﻿) enclosing the current element
    
    ![[/Untitled 6 31.png|Untitled 6 31.png]]
    

$\oint\vec B\cdot d\vec l=\mu_0I_{\text{enc}}$

- it is intended to be used on an enclosed path such that $d\vec l\parallel\vec B$﻿
    
    ![[/Untitled 7 29.png|Untitled 7 29.png]]
    
- if $\oint\vec B\cdot d\vec l=0\implies I_{\text{enc}}=0$﻿ NOT that the magnetic field is zero

  

## due to Cylindrical Conductor

- on a thick wire of outer radius $R$﻿ with total current $I$﻿ distributed evenly across the cross-sectional area of the conductor
- the enclosed charge can be expressed as

$I_{\text{enc}}=\frac{\pi r^2I}{\pi R^2}$

- magnetic field inside the conductor using Amperian loop of radius $r<R$﻿

$\oint\vec B\cdot d\vec l\implies B=\frac{\mu_0I}{2\pi}\frac{r}{R^2}$

- field outside the conductor with Amperian loop of $r > R$﻿

$\oint\vec B\cdot d\vec l\implies B=\frac{\mu_0I}{2\pi r}$

## due to a straight Solenoid

- magnetic field at the center of a solenoid of $n$﻿ turns per unit length and current $I$﻿passing through each turn using an Amperian loop through a length $L$﻿
- assume the solenoid is infinitely long as to define field lines as straight and contained within the solenoid (no leakage outside)

$I_{\text{enc}}=\frac{NIL}{L}=nLI$

$\oint vec B\cdot d\vec l=BL\implies B=\frac{\mu_0NI}{L}=\mu_0nI$

- Field Lines
    
    ![[/Untitled 8 26.png|Untitled 8 26.png]]
    

## due to a Toroidal Solenoid

- has N turns around a doughnut shaped ferrous metal
- the field lines are circular around the inside of the metal
- the central hollow region has $B=0$﻿
- the outside region has $B\approx0$﻿ (due to helical windings instead of circular)
- **inside the solenoid**

$I_{\text{enc}}=NI\\\space\\$

- Field Lines
    
    ![[/Untitled 9 22.png|Untitled 9 22.png]]
    

## Bohr Magneton

- in atomic physics: magnetism begins with the motion of electrons
- we can model a quantum mechanically incorrect model of an electron with orbit of radius $r$﻿ and tangential velocity $v$﻿
    
    ![[/Untitled 10 20.png|Untitled 10 20.png]]
    
- using the charge of the electron $e$﻿ and period of motion $T$﻿

$I=\frac e T=\frac{ev}{2\pi r}$

- resulting magnetic moment

$\mu=IA=\frac{ev}{2\pi r}(\pi r^2)=\frac{evr}{2}$

- given the angular moment $L=mvr$﻿

$\mu=\frac{e}{2m}L$

### Quantized Angular Momentum

- atomic angular moment is quantized: its component of ang. mom. in any particular direction is an integer multiple of the reduced Planck’s constant: $\hbar=\frac{h}{2\pi}$﻿ where $h=6.626\times 10^{-34}$﻿ is Planck’s Constant
- thus for $L=\frac{h}{2\pi}$﻿ the **Bohr Magneton**

$\mu_B=\frac{e}{2m}\frac{h}{2\pi}=\frac{eh}{4\pi m}=9.274\times10^{-24}\space[A\cdot m^2]$

- the spin of an electron is very close to the Bohr magneton

## Paramagnetism and Diamagnetism

- most orbital and spin magnetic moments are cancelled out, but in some materials, they can have a net magnetic moment on the order of Bohr Magneton
- if such materials are place in an external magnetic field $\vec B_0$﻿, the individual magnetic moments tend to align with the field → produce another magnetic field proportional to total magnetic moment $\vec\mu_{\text{total}}$﻿ of the material
- magnetization of a material is its magnetic moment per unit Volume

$\vec M=\frac{\vec\mu_{\text{total}}}{V}=\chi_m\frac {\vec B_0} {\mu_0}$

- therefore the total magnetic field is

$\vec B=\vec B_0+\mu_0\vec M=\vec B_0K_m$

- materials that exhibit this behavior are paramagnetic: the magnetic field inside the material is stronger than outside

### Diamagnetism

- paramagnetism implies the internal field is greater than an equivalent field in the vacuum around by a factor of $K_m$﻿ known as the relative permeability of the material (i.e. depends on the material)
- this can give us the permeability ($\mu$﻿) of the material (NOT MAGNETIC MOMENT)

$\mu=K_m\mu_0$

- magnetic susceptibility is the amount the relative permeability differs from 1

$\chi_m=K_m-1$

- diamagnetism is the property that the internal fields of the material oppose the external field in direction such that $K_m<1$﻿

### Magnetism Table at 20 ºC

![[/Untitled 11 18.png|Untitled 11 18.png]]

## Ferromagnetism

- ferromagnetic materials (iron, nickel, cobalt, etc.) have strong interactions between magnetic moments that cause magnetic moments to align parallel to each other in magnetic domains regardless of external magnetic field
- when there is no external fields, the magnetic fields are randomly oriented → presence of magnetic field causes domains to orient in the net direction of the field → most materials return to normal after being removed from the field → ferromagnetic materials do not
- such materials are magnetized so their domains don’t revert (bar magnet, other magnets) and have relative permeabilities $K_m$﻿ on the order of $10^3,\space10^5$﻿

### Hysteresis

- the behavior of the relationship of magnetization $M$﻿ to the external magnetic field $B_0$﻿ strength is hysteresis
    
    ![[/Untitled 12 18.png|Untitled 12 18.png]]
    
- this occurs until the material reaches saturation $M_{\text{sat}}$﻿
    
    ![[/Untitled 13 17.png|Untitled 13 17.png]]
    

  

# Resources

---

![[/ch28_lecture.pdf|ch28_lecture.pdf]]

  

📌

**SUMMARY  
**