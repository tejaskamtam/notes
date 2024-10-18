---
course: CS M51A
area: ucla
created: 2023-01-24T14:34
updated: 2023-01-31T14:10
📕 courses:
  - "[[CS M51A- Digital Logic]]"
tags: cs
---
# Definitions

---

# Big Ideas

---

## 2-input Multiplexers (MUXes)

- a 2-input multiplexer unit can be described by the switching expression

$z=MUX[x_1,x_0,s]=x_1\cdot s+x_0\bar s$

- the set of multiplexers $\{MUX\}$﻿ is universal (can be represented as NOT and NAND)
- an example of implementations of NOT and AND:

$NOT(x)=MUX[0,1,x]=0\cdot x+1\cdot\bar x=\bar x\\\space\\$

### Shannon’s Decomposition (SD)

$f(x_{n-1},...,x_0)=f(x_{n-1},...,1)\cdot x_0+f(x_{n-1},...,0)\cdot \bar x_0\\\implies\\$

- an example
    
    $z=x_3(x_2+x_0)x_1=MUX[x_3x_1,x_3x_2x_1,x_0]$
    
- you can use SD recursively to obtain a tree of multiplexers
    
    ![[/Untitled 80.png|Untitled 80.png]]
    
      
    

  

# Resources

---

![[/ch6.pdf|ch6.pdf]]

📌

**SUMMARY  
**