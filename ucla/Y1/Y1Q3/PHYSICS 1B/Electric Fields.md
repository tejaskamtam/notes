---
title: Electric Fields
author: Tejas Kamtam
date: 2022-05-03
layout: note
---
#UCLA #Y1Q3 #Physics1B 
# Electric Fields

---

## Key Definitions
**Field** - a physical quantity with a value at every point in space-time
- **Scalar Field** - scalar assigned to every point (e.g. temperature)
- **Vector Field** - vector assigned to every point (e.g. air current)

**Electric Field** - a field created by an [[Electric Charge]] which imposes effects on other charges in the field

---

## Electric Field Formula
##### $$\vec{E}\equiv\frac{\vec F_E}{q_1}=k_e\frac{q_2}{r^2}\hat r$$
##### $$\vec F_E=q_1\vec E$$
Where $\vec F_E$ is given by [[Coulomb's Law]]:
##### $$\vec F_E=k_e\frac{q_1q_2}{r^2}\hat r=q_1 \left(k_e\frac{q_2}{r^2}\hat r\right)$$
E.g.
![[Pasted image 20220503224839.png]]

---

## Superposition Principle
Electric fields obey the superposition principle (multiple charges/fields can be summed) i.e. Generalized [[Coulomb's Law]]:

##### $$\vec E=\sum_{i=1}^n \vec E_i$$
**Discrete Charge Distribution:**
##### $$\vec E=k_e\sum_{i=1}^n \frac{q_i}{r^2}\hat r$$

**Continuous Charge Distribution:**
##### $$\vec E=k_e\int \frac{dq}{r^2}\hat r$$

### Charge Density
Electric charges follow the superposition principle s.t. we observe charge densities:
###### $$Q_{net}=\int dq$$
**Linear Charge Density:**
###### $$\lambda=\frac{dq}{dL}\quad\therefore\quad dq=\lambda dL$$
**Surface Charge Density:**
###### $$\sigma=\frac{dq}{dA}\quad\therefore\quad dq=\sigma dA$$
**Volumetric Charge Density:**
###### $$\rho=\frac{dq}{dV}\quad\therefore\quad dq=\rho dV$$

Thus, you can find the electric field for different objects/surfaces using charge density.

---

## Common Fields
### Circulars
#### Ring
##### $$\vec E = k_e\frac{\lambda 2\pi Rz}{(z^2+R^2)^{3/2}}\hat z$$
#### Disk
##### $$\vec E=2\pi\sigma k_ez\left (\frac{1}{z}-\frac{1}{\sqrt{z^2+R^2}} \right )\hat z$$
#### Annulus
##### $$\vec E=2\pi\sigma k_ez\left (\frac{1}{\sqrt{r^2+z^2}}-\frac{1}{\sqrt{R^2+z^2}} \right )\hat z$$
### Infinite Plane
#### Single Plane
##### $$\vec E=\frac{\sigma}{2\epsilon_0}\hat x$$

#### Two Planes
##### $$\vec E = \frac{\sigma}{\epsilon_0}$$

### Hollow Sphere
#### Inside ($r < R_0$)
##### $$\vec E = 0$$
#### Outside ($r > R$)
##### $$\vec E = k_e\frac{Q}{r^2}\hat r$$
#### In ($R_0>r>R$)
##### $$\vec E = k_e\int \frac{dq}{r^2}\hat r=k_e\int \frac{\rho dV}{r^2}\hat r$$



---

## Electric Field Lines
![[Pasted image 20220503225747.png]]

### Rules
![[Pasted image 20220503230019.png]]
