---
area: ucla
quarter: Y3Q1
created: 2024-01-09 17:21
updated: Tuesday 9th January 2024 17:21:31
course: CS M151B
📕 courses:
parent: CS M151B

title: 1 - Intro to Computer Architecture

layout: note

---
## CPU Time
- CPI = Clock per instructions $$\text{CPU Time}=\frac{\text{Instruction Count}\times\text{CPI}}{\text{Clock Rate}}=IC\times CPI\times\text{Clock Time}$$
- Clock Frequency/Rate$$\text{Clock Rate}=\frac{1}{\text{Clock Time}}$$

## Denard's (MOSFET) Scaling 
- as transistors get smaller, capacitance and voltage reduce
- then should be possible to increase (we don't increase it is just a result of the equation) frequency if power is the same
- higher frequency means higher clock/performance
- where alpha is transistor switching rate $$Power=\alpha\cdot CFV^2$$

## Power Wall
- quantum tunneling of electrons of transistors becoming too small
- comes from Denard's scaling
- solutions come from introducing more ores/making dies bigger at the same transistor size

## Memory Wall
- the gap between cpu performance at a transistor level (following Moore's doubling law) vs memory performance increase rate (linear)


