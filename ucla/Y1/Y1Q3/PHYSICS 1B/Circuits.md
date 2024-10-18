---
title: Circuits
author: Tejas Kamtam
date: 2022-05-25
layout: note
---
#UCLA #Y1Q3 #Physics1B 
# Circuits

---

## Key Definitions
**Steady-state circuit** - circuit which maintains constant current

**Power** - the rate of energy delivered or extracted from a circuit

---

## Steady-State Circuits
- Conductors must form a **closed loop** to maintain a steady [[Current]]
- Additionally, a source of **constant voltage** must be in the circuit (unless using a superconductor)
- Steady current requires the [[Electric Fields]] to be constant and thus the [[Electric Potential]] to be constant

---

## Potential in a Circuit
The net change in potential energy for a travelling [[Electric Charge]] around a circuit must be **zero**
Thus, the electric potential around a circuit must also be 0.
I.e. [[Resistance#Ohm's Law]]
##### $$V_{source}=IR$$

---

## Energy and Power
The power flowing through a circuit is given by:
##### $$P=IV$$
The power is independent of Ohm's Law, but if the law is true, then:
##### $$P=IV=I^2R=\frac{V^2}{R}$$

---

## Circuit Organization
### In Series
#### Potential Difference
##### $$\Delta V_{eq}=\sum \Delta V_{R_i}$$
#### Current
##### $$I_{eq} = I_{R_i}$$
#### Resistance
##### $$R_{eq}=\sum R_i$$
#### Capacitance
##### $$\frac{1}{C_{eq}}=\sum \frac{1}{C_i}$$

### In Parallel
#### Potential Difference
##### $$\Delta V_{eq}=\Delta V_{R_i}$$
#### Current
##### $$I_{eq}=\sum I_{R_i}$$
#### Resistance
##### $$\frac{1}{R_{eq}} = \sum \frac{1}{R_i}$$
#### Capacitance
##### $$C_{eq}=\sum C_i$$

---

## Kirchhoff's Rules
### Current/Junction Rule
The current entering a junction is equivalent to the current leaving the junction:
##### $$\sum I_{in} = \sum I_{out}$$

### Voltage/Loop Rule
Because in a DC circuit the [[Electric Fields]] draining the current in the circuit is conservative:
###### $$\oint \vec E \cdot d\vec l = 0$$
Thus in closed loop circuits:
##### $$(\sum \Delta V)_{loop}=0$$
