---
course: PHYSICS 1C
area: ucla
created: 2023-02-01T13:00
updated: 2023-02-06T12:55
📕 courses:
  - "[[Physics 1C- EM, Waves, & Optics]]"
parent: PHYSICS 1C

title: Inductance - ch. 30

layout: note

---
# Definitions

---

# Big Ideas

---

## Mutual Inductance

- sps. 2 concentric coils with one having time-varying current
- coil 1’s time-varying current creates a magnetic field which induces a current iin coil 2 by Faraday’s Law

$\mathcal E_2=-N_2\frac{d\Phi_{B,2}}{dt}$

- then the mutual inductance is

$M=\frac{N_2\Phi_{B,2}}{i_1}=\frac{N_1\Phi_{B,1}}{i_2}\space [\text{H : Henry}]$

- the mutual inductance of solenoids/coils can find the EMF as

$\mathcal E_2=-M\frac{di_1}{dt}\quad \text{and}\quad\mathcal E_1 = -M\frac{di_2}{dt}$

  

  

## Self-Inductance

- any circuit with a coil and time-varying current can produce a self-induced emf
- the self-induced inductance $L$﻿ for a coil of $N$﻿ turns and current $i$﻿ and magnetic flux $\Phi_B$﻿

$L=\frac{N\Phi_B}{i}$

- because a time-varying current changes the magnetic field, so we can describe the inductance as

$\mathcal E=-N\frac{d\Phi_B}{dt}=-L\frac{di}{dt}$

## Inductor Circuit Element

- an inductor as a circuit element is used to limit changes in current by opposing the current via a self-induced EMF
- For which the total electric field in the coil has both conservative and non-conservative electric fields for which $\vec E_c+\vec E_n=0$﻿ for negligible resistance
- Faraday’s law for an inductor with terminals $a,b$﻿ (consider $\vec E_c=-\vec E_n$﻿)

$\mathcal E=\int_a^b \vec E_n\cdot d\vec l=-L\frac{di}{dt}\quad \text{(non-conservative)}\\$

- thus, an inductor has a potential difference across its terminals (due to the conservative electric field) given by
    
    ![[/Untitled 35.png|Untitled 35.png]]
    

$V_{ab}=V_a-V_b=L\frac{di}{dt}$

$V_{ab}=\begin{cases}$

## Magnetic Field Energy

- the energy in an inductor is stored in the magnetic field of the coil (similar to capacitance stored in electric field between plates)
- WE can find energy stored as the current flows from $i=0\to i=I$﻿, such thaat the power delivered

$P_{\text{in}}=V_{ab}\cdot i=Li\frac{di}{dt}$

- then the energy supplied for an interval $dt$﻿ is $dU= P\space dt$﻿

$\text{d} U=Li\space\text di$

$U_{\text{total}}=L\int_0^Ii\cdot\text di=\frac12LI^2$

### Magnetic Energy Density

- consider a toroidal solenoid with volume is $V=2\pi r A$﻿

$L=\frac{N\Phi_B}{I}=\frac{\mu_0N^2A}{2\pi r}$

- for which the energy is

$U=\frac12 LI^2=\frac12\frac{\mu_0N^2A}{2\pi r}I^2$

- then per unit volume is

$u=\frac U{2\pi rA}=\frac{\mu_0}2\frac{N^2I^2}{(2\pi r)^2}$

- in terms of the magnetic field

$B=\frac{\mu_0 NI}{2\pi r}\implies \frac{B^2}{\mu_0^2}=\frac{N^2I^2}{(2\pi r)^2}$

- then, in a vacuum OR a material with magnetic permeability $\mu=K_m\mu_0$﻿

$u=\frac{B^2}{2\mu_0}=\frac{B^2}{2\mu}$

## R-L Circuit

- contains both inductor and resistor and possibly an EMF source
- sps. an R-L circuit with emf source $\mathcal E$﻿ and we close a switch at $t=0$﻿ to allow current to flow
    
    ![[/Untitled 1 24.png|Untitled 1 24.png]]
    
- Kirchhoff’s Loop rule

$\mathcal E-iR-L\frac{\text di}{\text dt}=0\implies \frac{\text di}{\text dt}=\frac{\mathcal E-iR}{L}$

- The current is initially 0 and reaches some steady state value $I$﻿
- Thus the solution to the differential equation is

$i=\frac{\mathcal E}{R}\left[1-e^{-(R/L)t}\right]$

- the time constant is

$\tau = L/R$

### Current Decay

- Consider the previous R-L circuit reaches steady state current then switch is opened so there is no longer an EMF
- the differential equation

$-iR-L\frac{di}{dt}=0\implies \frac{di}{dt}=-\frac RL i$

- then for the initial current (steady state) $I_0=\frac{\mathcal E}{R}$﻿

$i=I_0e^{-(R/L)t}\implies \tau=L/R$

## L-C Circuit

- contains inductor and capacitor → oscillating behavior of current and charge
    
    ![[/Untitled 2 23.png|Untitled 2 23.png]]
    
- the differential equation describing an LC circuit

$-L\frac{di}{dt}-\frac{q}{C}=0\implies\frac{d^2q}{dt^2}+\frac{q}{LC}=0$

- this is modeled as simple harmonic motion for a total charge $Q$﻿

$q=Q\cos(\omega t+\phi)\quad\omega=\sqrt{\frac{1}{LC}}\\\space\\$

$i=\frac{dq}{dt}=-\omega Q\sin(\omega t+\phi)$

### LC-Mass-Spring Analogies

![[/Untitled 3 19.png|Untitled 3 19.png]]

## L-R-C Circuit

- contains inductor, resistor, capacitor → damped harmonic oscillator

$-iR-L\frac{di}{dt}-\frac{q}{C}=0\implies \frac{d^2q}{dt^2}+\frac RL \frac{dq}{dt}+\frac{q}{LC}=0$

$q=Qe^{-(R/2L)t}\cos(\omega't+\phi)\quad \omega'=\sqrt{\frac{1}{LC}-\frac{R^2}{4L^2}}$

- The damping cases
    
    ![[/Untitled 4 18.png|Untitled 4 18.png]]
    

# Resources

---

![[/ch30_lecture.pdf|ch30_lecture.pdf]]

  

📌

**SUMMARY  
**