---
course: PHYSICS 1C
area: ucla
created: 2023-02-06T11:06
updated: 2023-03-19T23:00
📕 courses:
  - "[[Physics 1C- EM, Waves, & Optics]]"
---
# Definitions

---

# Big Ideas

---

## Phasors and RMS

- an ac source supplies sinusoidally varying voltage or current
- the voltage, current with amplitude $V,I$﻿ and angular frequency $\omega=2\pi f$﻿ is

$v=V\cos\omega t\\$

- the US uses RMS values of 120 V at 60 Hz while others may use 240 V at 50 Hz

### Phasors

- phasors are vectors that rotate counterclockwise with constant ang. speed $\omega$﻿ which represents varying voltage and current
    
    ![[/Untitled 40.png|Untitled 40.png]]
    
- a phasor sweeps an angle of $\theta(t)=\omega t$﻿
- the projection of a phasor on the horizontal gives instantaneous values ($v,i$﻿)

### RMS Values

- root-mean-square values for voltage and current are used to represent “average”

$I_{\text{rms}}=\frac{I}{\sqrt 2}\quad V_{\text{rms}}=\frac{V}{\sqrt 2}$

## AC Circuit Elements

### Resistors

Sps. $V_R=IR$﻿ is the voltage amplitude across the resistor

$v_R=iR=(IR)\cos\omega t=V_R\cos\omega t$

### Inductors

- bc inductors’ voltage are proportionate to the rate of change of current

$v_L=L\frac{di}{dt}=-I\omega L\sin\omega t=I\omega L\cos(\omega t+\phi)\\$

- thus, inductors are out of phase with current by phase angle $\phi=90\degree$﻿ i.e. the phasor for the inductor is ahead of the voltage by the phase angle
- thus amplitude of voltage

$V_L=I\omega L$

- such that the inductive reactance $X_L=\omega L$﻿ thus

$V_L=IX_L$

### Capacitors

- because capacitors’ voltage is proportional to charge

$i=\frac{dq}{dt}=I\cos\omega t\quad v_C=\frac{q}{C}=\frac{I}{\omega C}\sin\omega t$

- the phase angle is $\phi=-90\degree$﻿

$v_C=\frac{I}{\omega C}\cos(\omega t+\phi)=V_C\cos(\omega t-\frac{\pi}{2})$

- the voltage amplitude is given by the capacitive reactance

$X_C=\frac{1}{\omega C}\implies V_C=\frac{I}{\omega C}=IX_C$

### Comparison

![[/Untitled 1 29.png|Untitled 1 29.png]]

## LRC Circuit (In Series)

- the current is $i=I\cos\omega t$﻿
- amplitudes

$I,V,Q\propto e^{i\omega t}$

- Kirchhoff’s formula

$\mathcal E-i_1\\\space\\V=L\frac{dI}{dt}+IR+\frac{Q}{C}\\\space\\$

- the parenthesized terms are complex impedances ($\tilde Z$﻿) _(_added bc in series) such that the impedance is

$Z=\sqrt{R^2+\left(\omega L-\frac{1}{\omega C}\right)^2}$

- the parenthesized terms are reactances $X_L,X_C$﻿

$V_0=I_0Z\quad V_{\text{rms}}=I_{\text{rms}}Z\\V_R=I_0R_0\\V_L=I_0X_L\\V_C=I_0X_C$

  

### Phase Angles

- given the current $I$﻿ is a real number, it scales the phasor parenthesized in the formula for the voltage → a phase angle

$V=I\left(R+i\left(\omega L-\frac{1}{\omega C}\right)\right)$

$\phi_0=\arctan\left(\frac{\omega L-\frac{1}{\omega C}}{R}\right)$

## Power

- we know

$P_{avg}=I^2_{rms}R=V_{rms}I_{rms}\\$

- power graphs
    
    ![[/Untitled 2 27.png|Untitled 2 27.png]]
    
- in general

$p=vi=(I\cos\omega t)\cdot V\cos(\omega t+\phi)$

$P_{\text{avg}}=\frac12VI\cos\phi=V_\text{rms}I_\text{rms}\cos\phi$

- the power factor is $\cos\phi$﻿ s.t. $\phi=0\implies P_{avg}=V_{rms}I_{rms}$﻿ which occurs at pure resistance

## Resonance

- the an freq of the source is varied → maximum current occurs at minimum impedance - resonance frequency
    
    ![[/Untitled 3 22.png|Untitled 3 22.png]]
    
- the driving ang freq at which this occurs is the resonance angular frequency ($\omega_0$﻿)
    
    ![[/Untitled 4 21.png|Untitled 4 21.png]]
    

$\omega=\omega_0\implies Z=R\implies X_L=X_C\implies \omega_0=\frac{1}{\sqrt{LC}}$

## Transformers

- used to step-up/down voltages using a transformer
    
    ![[/Untitled 5 18.png|Untitled 5 18.png]]
    
- a transformer has power supply to a primary coil around a core with high relative magnetic permeability $K_m$﻿ (iron) and a secondary coil is wrapped around that delivers power to a resistor → via an emf in the core
    
    ![[/Untitled 6 18.png|Untitled 6 18.png]]
    

$\mathcal E_k=-N_k\frac{d\Phi_B}{dt}\quad$

- the flux per turn is the same in both coils so the ratio of emfs is proportional to the turns:

$\frac{\mathcal E_2}{\mathcal E_1}=\frac{N_2}{N_1}\implies \frac{V_2}{V_1}=\frac{N_2}{N_1}=\frac{I_1}{I_2}$

- $N_2\gt N_1\implies V_1\gt V_2$﻿step-up transformer and vice versa
- the resistance in the secondary coil allows us to find

$V_1I_1=V_2I_2\implies \frac{V_1}{I_1}=\frac{R}{(N_2/N_1)^2}$

## Discussion 5 Review

## Review

### Imaginary

- complex conjugate operator

$*:i\to -i$

- of form

$z=a+ib\implies (z_1+z_2)=(a_1+a_2)+i(b_1+b_2)$

- magnitude

$|z|=\sqrt{z\cdot z^*}=\sqrt{(a+ib)(a-ib)}=\sqrt{a^2+b^2}$

### Polar Imaginary

$z=|z|\cos\phi\space+\space i|z|\sin\phi=|z|(\cos\phi\space+\space i\sin\phi)\\\space\\$

- time dependent phasor

$z(t)=|z|(\cos\omega t\space+\space \sin\omega t)$

### RLC Circuit

- amplitudes

$I,V,Q\propto e^{i\omega t}$

- Kirchhoff’s formula

$V=L\frac{dI}{dt}+IR+\frac{Q}{C}\\\space\\$

- the parenthesized terms are complex impedances ($\tilde Z$﻿) _(_added bc in series) such that the impedance is

$|\tilde Z|=\sqrt{R^2+\left(\omega L-\frac{1}{\omega C}\right)^2}$

- the parenthesized terms are reactances $X_L,X_C$﻿

$V_0=I_0|\tilde Z|\\V_R=I_0R_0\\V_L=I_0X_L\\V_C=I_0X_C$

### Phase Angles

- given the current $I$﻿ is a real number, it scales the phasor parenthesized in the formula for the voltage → a phase angle

$V=I\left(R+i\left(\omega L-\frac{1}{\omega C}\right)\right)$

$\phi=\arctan\left(\frac{\omega L-\frac{1}{\omega C}}{R}\right)$

  

# Resources

---

![[/ch31_lecture.pdf|ch31_lecture.pdf]]

  

📌

**SUMMARY  
**