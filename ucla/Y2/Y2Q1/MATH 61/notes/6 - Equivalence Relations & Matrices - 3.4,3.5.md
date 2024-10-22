---
course: MATH 61
area: ucla
created: 2022-10-05T11:04
updated: 2022-10-27T17:19
📕 courses:
  - "[[Math 61- Discrete Structures]]"
tags: math
parent: MATH 61

title: 6 - Equivalence Relations & Matrices - 3.4,3.5

layout: note

---
# Recall

  

# Notes

Supplemental Definitions

- partial order
    - an antisymmetric, transitive, reflexive relation
    - not an equivalence relation

Examples

- e.g. equivalence relation
    
    partitions of X
    
    ![[/Untitled 8.png|Untitled 8.png]]
    
- e.g. equivalence classes
    
    last [3]=[6] = {3,6} NOT {1,3,6}
    
    ![[/Untitled 1 3.png|Untitled 1 3.png]]
    
- e.g. proof of equivalence relation
    - let $X=\{1,...,10\}$﻿
    - $R=\{(x,y)|(x-y)\%3=0\}$﻿
    - proof of equivalence relation theorem
        - reflexive, symmetric, transitive
    - proof of partition by equivalence classes
        - $[1]=\{x\in X|(x-1)\%3\}=\{1,4,7,10\}$﻿
        - $[2]=\{2,5,8\}$﻿
        - $[3]=\{3,6,9\}$﻿
- e.g. matrix of relation
    
    ![[/Untitled 2 4.png|Untitled 2 4.png]]
    
- e.g. proof of equivalence relation by composition
    - suppose R is reflexive, transitive on X
    - show $R\cap R^{-1}$﻿ is an equivalence relation
    - reflexive
        - b/c R is reflexive b hypothesis, for any $x\in X\implies xRx$﻿
        - then $xR^{-1}x\implies (x,x)\in R^{-1}$﻿
        - $\implies (x,x)\in R\cap R^{-1}$﻿
    - symmetric
        - if (x,y) is in R, by the definition of inverse, (y,x) is in $R^{-1}$﻿ and if (y,x) is in the inverse then it is also in R
    - transitive
        - if (x,y),(y,x) are in $R\cap R^{-1}$﻿ then by symmetry, (z,y),(y,x) are in the intersect
        - by the since R is transitive, (z,x) is in R and by definition of inverse, (x,z) is in $R^{-1}$﻿
        - thus, (x,z) is in the intersect so the intersect is transitive
    - thus, the intersect is an equivalence relation

Big Ideas

- equivalence relation
    - Let S be a partition of X, define xRy to mean that for some $A\in S\quad x,y\in A$﻿
    - then, R is reflexive, symmetric, and transitive i.e. an equivalence relation on X
- equivalence classes
    - let R be an equivalence relation on X
    - for each $a\in X, [a]=\{x\in X|xRa\}$﻿
    - then $S=\{[a]|a\in X\}$﻿ is a partition of X
    - the sets [a] are equivalence classes on X by R
- equivalence cardinality
    - $|\{\text{equivalence relations on X}\}| = |\{\text{partitions of X}\}|$﻿
- matrix of relation
    - used to visualize relations
    - matrix of relation $R\sube X\times Y$﻿
    - formed by labeling the rows by $x\in X$﻿ and the cols by $y\in Y$﻿
    - then, matrix entry [x,y] is 1 if xRy else 0

# Lecture

![[/61_-_Week_2_notes_--_3.3_3.4_3.5_6.1 2.pdf|61_-_Week_2_notes_--_3.3_3.4_3.5_6.1 2.pdf]]

📌

**SUMMARY  
**