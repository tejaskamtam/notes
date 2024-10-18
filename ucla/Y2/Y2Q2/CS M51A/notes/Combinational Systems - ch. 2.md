---
course: CS M51A
area: ucla
created: 2023-01-12T14:11
updated: 2023-01-31T14:09
📕 courses:
  - "[[CS M51A- Digital Logic]]"
tags: cs
---
# Definitions

---

- e.g. combinational system
    
    ![[/Untitled 28.png|Untitled 28.png]]
    
    - specify binary conversion “helper functions”
    
    ![[/Untitled 1 19.png|Untitled 1 19.png]]
    
    - then re-implement I/O sets to define the function
    
    ![[/Untitled 2 18.png|Untitled 2 18.png]]
    
- e.g. conditional expression (input-output func)
    
    ![[/Untitled 3 15.png|Untitled 3 15.png]]
    
- e.g. boolean algebra
    
    ![[/Untitled 4 14.png|Untitled 4 14.png]]
    
- e.g. base $2^n$﻿ conversion
    
    (B2451)_16 : 010 110 010 010 001 010 001  
    (x)_8 : 2 6 2 2 1 2 1  
    -> x = (2622121)_8
    

# Big Ideas

---

## Input-Output Functions

- described by the function $z(t)=F(x(t))\implies z=F(x)$﻿

### Binary Level

- $z_b=F_b(x_b)$﻿
- e.g. a high level overview
    
    ![[/Untitled 5 12.png|Untitled 5 12.png]]
    

  

### High Level Spec

- input set - set of input values
- output set - set of output values
- input-output function - $z=F(x)$﻿
    - can be specified as:
    - table
        
        ![[/Untitled 6 12.png|Untitled 6 12.png]]
        
    - arithmetic
        
        ![[/Untitled 7 12.png|Untitled 7 12.png]]
        
    - conditional
        
        ![[/Untitled 8 11.png|Untitled 8 11.png]]
        
    - logical
        
        ![[/Untitled 9 9.png|Untitled 9 9.png]]
        
    - composition of function
        
        ![[/Untitled 10 7.png|Untitled 10 7.png]]
        

## Encoding

### ASCII

- a standardized bit-vector encoding for character which include letters, digits, and special characters

### Integer Encoding

- integer ←→ digit-vector
- digit ←→ bit-vector
- e.g. 4-digit integer
    
    ![[/Untitled 11 6.png|Untitled 11 6.png]]
    

  

## Binary Encoding Methods

### Gray Code

- a form of binary encoding that implements character conversion differently
- gray code changes only a singular bit between two adjacent characters (whereas binary encoding can change multiple)
- e.g. gray code example
    
    ![[/Untitled 12 6.png|Untitled 12 6.png]]
    

  

### Other Binary Encoding Method

![[/Untitled 13 6.png|Untitled 13 6.png]]

### General Encoding Principle

- radix sum method
    
    - $x=(x_{n-1},x_{n-2},…,x_1,x_0)$﻿
    
    $(x)_{10}=\sum_{i=0}^{n-1}x_ir^i$
    
- base $2^n$﻿ encoding conversion
    - $(x)_{2^n}=(y)_{2^r}$﻿
    - $\log_22^n=n$﻿
    - $n$﻿ is the number of binary digits you should have
    - $r$﻿ is the number of binary digit subsets of $n$﻿
    - prepend 0 to follow base conversion

## Switching Functions

### Comb. Sys. vs. Switching Functions

- e.g. binary combinational system
    
    ![[/Untitled 14 4.png|Untitled 14 4.png]]
    
- representing the previous comb. sys. as a switching function for $n$﻿ bit-encoding
    
    ![[/Untitled 15 4.png|Untitled 15 4.png]]
    

### Tabular Representation

![[/Untitled 16 3.png|Untitled 16 3.png]]

### Special Switching Functions

![[/Untitled 17 3.png|Untitled 17 3.png]]

![[/Untitled 18 3.png|Untitled 18 3.png]]

## Switching Expressions (Boolean)

- symbol representing binary/boolean variables are SEs

### SE Arithmetic (of @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$A,B$﻿)

- $(A)’$﻿ is a SE - the “A complement”
- $(A)+(B)$﻿ is a SE - “$A$﻿ or $B$﻿”
- $(A)\cdot(B)$﻿ is a SE - “$A$﻿ and $B$﻿”
- order of operations:
    - complement → prod → sum

### SE (Boolean) Algebra

![[/Untitled 19 3.png|Untitled 19 3.png]]

### Boolean Algebraic Properties

![[/Untitled 20 2.png|Untitled 20 2.png]]

### 2-var Logic Gates as SE

![[/Untitled 21 2.png|Untitled 21 2.png]]

### N-var Logic Gates as SE

![[/Untitled 22 2.png|Untitled 22 2.png]]

### Equivalence Classes representation

![[/Untitled 23 2.png|Untitled 23 2.png]]

### Logic Gate Expression

![[/Untitled 24 2.png|Untitled 24 2.png]]

## Minterm/Maxterm Notation

- representing SEs as a simplified notation by defining a type conversion
- minterm - sum of products
- maxterm - product of sums
- e.g. minterms
    
    ![[/Untitled 25 2.png|Untitled 25 2.png]]
    

### Tabular Representation

![[/Untitled 26 2.png|Untitled 26 2.png]]

### Logic Gate Representation

![[/Untitled 27 2.png|Untitled 27 2.png]]

# Resources

---

![[/ch2.pdf|ch2.pdf]]

SOP → POS and SSOP/SPOS → Canonical SOP/POS

[https://youtu.be/TMxMPJeJ_18](https://youtu.be/TMxMPJeJ_18)

Truth Table

[https://youtu.be/YmKmS9bpMqM](https://youtu.be/YmKmS9bpMqM)

📌

**SUMMARY  
**