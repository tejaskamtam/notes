---
course: MATH 61
area: ucla
created: 2022-10-04T21:42
updated: 2022-10-27T19:47
📕 courses:
  - "[[Math 61- Discrete Structures]]"
tags: math
parent: MATH 61

title: 5 - Relations - 3.3

layout: note

---
# Recall

# Notes

Supplemental Definitions

- partial order
    - if a relation R is reflexive, antisymmetric, and transitive it is a partial order
    - denoted $a \preceq b$﻿
- comparable
    - if R is a partial order on X
    - and if $x,y\in X$﻿
    - and $xRy$﻿ or $yRx$﻿,
    - then x and y are comparable
- incomparable
    - not comparable
- total order
    - if each pair $x,y\in R$﻿ are comparable, R is a total order
    - denoted $a\prec b$﻿
- inverse
    - $R\sube X\times Y$﻿
    - $R^{-1}=\{(y,x)|xRy\}\sube Y\times X$﻿
- composition
    - $R_1\sube X\times Y,R_2\sube Y\times Z$﻿
    - $R_2\circ R_1=\{(x,z)|xR_1y,yR_2z\space\text{for some}\space y\in Y\}$﻿

Examples

- e.g. relations
    - $X=\{13,7\},Y=\mathbb{Z}$﻿
    - $R\sube X\times Y$﻿ where $xRy$﻿ if x divides y
    - $(7,21),(13,26)\in R$﻿
    - $(7,26)\notin R$﻿
- e.g. digraph
    
    ![[/Untitled 2.png|Untitled 2.png]]
    
- e.g. reflexive relation
    
    ![[/Untitled 1.png|Untitled 1.png]]
    
- e.g. symmetric relation
    
    ![[/Untitled 2 2.png|Untitled 2 2.png]]
    
- e.g. antisymmetric relation
    
    ![[/Untitled 3.png|Untitled 3.png]]
    
- e.g. transitive relation
    
    ![[/Untitled 4.png|Untitled 4.png]]
    
- e.g. partial order
    
    ![[/Untitled 5.png|Untitled 5.png]]
    
- e.g. total order
    
    ![[/Untitled 6.png|Untitled 6.png]]
    

Big Ideas

- relation
    - (binary) relation R from X to Y is a subset of $X\cdot Y$﻿
    - if $(x,y)\in\mathbb{R}\implies x\mathbb{R}y$﻿
    - if $X=Y$﻿ R is a relation on X
- digraph
    
    - visualize relations on X
    
    1. draw a dot (vertex) for each $x\in X$﻿
    2. draw an arrow (directed edge) from the vertex $x_1$﻿ to $x_2$﻿ if $x_1Rx_2$﻿
    3. if $x_1Rx_1$﻿ the directed edge is called a loop
- properties of relations
    - reflexive
        - if $(x,x)\in R$﻿ for ever x in X
    - symmetric
        - if for all $x,y\in X\implies xRy,yRx$﻿
    - antisymmetric
        - if for all $x,y\in X$﻿ if $xRy,yRx\implies x=y$﻿
        - that is, if $x\neq y\implies(x,y)\notin R \space\text{or}\space (y,x)\notin R$﻿
    - transitive
        - if for all $x,y,z\in X$﻿ if $(x,y),(y,z)\in R\implies(x,z)\in R$﻿

# Lecture

![[/61_-_Week_2_notes_--_3.3_3.4_3.5_6.1.pdf|61_-_Week_2_notes_--_3.3_3.4_3.5_6.1.pdf]]

📌

**SUMMARY  
**