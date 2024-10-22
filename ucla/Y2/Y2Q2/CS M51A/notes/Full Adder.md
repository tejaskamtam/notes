---
course: CS M51A
area: ucla
created: 2023-01-10T14:35
updated: 2023-01-13T08:36
📕 courses:
  - "[[CS M51A- Digital Logic]]"
tags: cs
parent: CS M51A

title: Full Adder

layout: note

---
# Definitions

---

- prime
    - when the incoming bit is 0, denote its variable with a prime
    - e.g. Xi’ denotes 0 bit while Xi denotes 1 bit

# Big Ideas

---

## Logic Gates

![[/Untitled 42.png|Untitled 42.png]]

### NOT Gate

- inverter, ON only when input is bit 0

|   |   |
|---|---|
|in|out|
|0|1|
|1|0|

## Full Adder

- sum of products

$Zi = X_i’Y_i’C_{in} + X_i’Y_iC_{in}’ + X_iY_i’C_{in}’ + X_iY_iC_{in}$

- product of sums

$Z_i = (X_i+Y_i+C_{in})(X_i+Y_i’+C_{in}’)(X_i’+Y_i+C_{in}’)(X_i’+Y_i’+C_{in})$

- singular addition unit with a carry forward capability and 2 parameters
- can be placed in series to carry forward addition parameters and carry bits
- truth table
    
    ![[/Untitled 1 31.png|Untitled 1 31.png]]
    
- equations can be written as:
    - $Zi=(Xi+Yi+Ci)…(Xi’+Yi’+Ci’)$﻿

# Resources

---

![[/M51a_Adder_Design.pdf|M51a_Adder_Design.pdf]]

  

📌

**SUMMARY  
**