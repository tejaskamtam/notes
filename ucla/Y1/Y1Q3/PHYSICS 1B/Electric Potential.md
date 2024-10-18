---
title: Electric Potential
author: Tejas Kamtam
date: 2022-05-17
layout: note
---
#UCLA #Y1Q3 #Physics1B 
# Electric Potential

---

## Key Definitions
**Potential Energy** - property of every **conservative force** given by:
###### $$\Delta U=-W=-\int \vec F_{cons} \cdot d\vec r$$

---

## Potential Energy
Electrostatic forces are **conservative**

### Electric PE
Thus, **Electric potential energy, $U_{elec}$** (from [[Electric Charge]]) :
##### $$\Delta U_{elec}=W$$
![[Pasted image 20220517164155.png]]

### Electrostatic PE
And, **electrostatic potential energy, $U_E$** (from electrostatic forces):
##### $$\nabla U=-F$$
##### $$\Delta U_E=-W_E=-\int \vec F_E \cdot d\vec r$$
Similarly, of two static charges is derived from [[Coulomb's Law]]:
##### $$U_E=k_e\frac{qQ}{r}=qV$$
Between multiple charges, we can use the **Superposition Principle**:
##### $$U_E(q)=k_eq\sum_{i=1}^n\frac{q_i}{r_i}$$

---

## Conservation of Energy
**Energy is Conserved** - as a charge accelerates in the direction of its Coulomb force, its electric potential energy decreases

Additionally, systems tend towards lower "energy configurations"

---

## Electric Potential
Similar to potential energy for electrostatic forces, $U_E$, static electric fields are also conservative:

**Electric Potential, $V$** (from static [[Electric Fields]]):
##### $$\nabla V=-E$$
##### $$\Delta V=-\int_A^B \vec E\cdot d\vec r$$
Where usually $A=\infty$ if finding potential at a point (reference point; possibly 0 depending on reference)

##### $$V=\frac{U_E}{q}=k_e\frac{Q}{r}$$
##### $$V=k_e\sum_{i=1}^n\frac{Q_i}{r_i}=k_e\int\frac{dq}{r}$$
Where Coulomb's force constant, $k_e=\frac{1}{4\pi\epsilon_o}\approx9\times10^9\space\left[\frac{Nm^2}{C^2}\right]$

![[Pasted image 20220517165830.png]]

Similarity Chart (Gradients):
![[Pasted image 20220517170030.png]]

### Visualization
**Equipotential Lines** - show the "curves" of const. electric potential:
![[Pasted image 20220517170142.png]]

![[Pasted image 20220517170254.png]]

---

## Common Electric Potentials
### Circulars
#### Ring
### Hollow Sphere
#### Outside ($r > R$)
##### $$V=k\frac Q r$$
#### Inside ($r<R$)
##### $$V=k\frac Q R$$

---

## Energy in <u>[[Electric Fields]]</u>
In a volume of space, electric energy us proportional to the square of the electric field:
##### $$\frac{U_E}{\text{Vol}}=\frac{\epsilon_0}{2}E^2$$
Where $\epsilon_o\approx8.854\times10^{-12}\space \left[\frac{C^2}{Nm^2}\right]$