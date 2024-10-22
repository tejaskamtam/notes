---
course: MATH 61
area: ucla
created: 2022-10-24T11:05
updated: 2022-10-27T17:20
📕 courses:
  - "[[Math 61- Discrete Structures]]"
tags: math
parent: MATH 61

title: 12 - Recurrence Relations Cont. - 7.2

layout: note

---
# Recall

# Notes

Supplemental Definitions

- recurrence relation (rr.)
    - an equation for a series that defines an element at n using an element n-k where 0 < k < n
- closed formula of a series
    - an expression to show how to compute every term in a sequence without need for other terms in the sequence

Examples

- e.g. $a_n=a_{n-1}+3,n\ge2,a_1=2$﻿
    - iteration
        - $a_n=a_{n-1}+3=(a_{n-2}+3)+3=a_{n-2}+2\cdot3$﻿
        - $\implies a_n=a_{n-k}+3k\space|\space k=n-1$﻿
        - $\therefore a_n=a_1+3(n-1)=2+3(n-1)$﻿
        - can be proven by induction
- e.g. $c_n=2c_{n-1}+1,n\ge2,c_1=1$﻿
    - iteration
        - $c_n=2c_{n-1}+1=2(2c_{n-2}+1)+1=2^2c_{n-2}+2+1$﻿
        - $\implies c_n=2^kc_{n-k}+2^k-1$﻿
        - $\implies c_n=2^kc_{n-k}+2^{k-1}+2^{k-2}+…+2-1$﻿
        - $\therefore c_n=2^{n-1}c_1+2^{n-1}-1=2^n-1$﻿
- e.g. $d_n=3d_{n-1}-2d_{n-2},n\ge2$﻿
    
- e.g. $d_n=4d_{n-1}-4d_{n-2},n\ge2,d_0=d_1=1$﻿
    - $t^2-4t+4=0\implies t=r=2$﻿
    - $\therefore d_n=b\cdot2^n+d\cdot2^n\cdot n,n\ge0$﻿
    - $\implies b=1,d=\frac {-1}{2}$﻿
    - $d_n=2^n-n2^{n-1}$﻿

Big Ideas

- methods of finding closed form from an rr.
    - iteration
    - (certain cases) linear homogeneous rr. w/ constant coefficients
- linear homogeneous RR of order k w/ constant coefficients (LHRC)
    - an RR of form:
    - $a_n=c_1a_{n-1}+…+c_ka_{n-k}\space |\space c_k\neq0,c_i\in\mathbb{R}$﻿
    - order k is the “farthest in term”
    - we will only discuss order ≤ 2 in Math 61
    - examples
        - e.g. Fibonacci: $f_n=f_{n-1}+f_{n-2}\space|\space n\ge2$﻿
            - lin. hom. RR of order 2
        - e.g. $s_n=2s_{n-1}$﻿
            - lin. hom. RR of order 1
    - non examples
        - n.e.g. $a_n=2a_{n-1}a_{n-2}$﻿
            - not lin.
        - n.e.g. $a_n=3_na_{n-1}$﻿
            - not const. coeff.
- thm. for LHRC
    - $a_n=c_1a_{n-1}+c_2a_{n-2}$﻿ is an LHRC s.t.:
    - $a_0=A_0,\space a_1=A_1$﻿
    - let $r_1\neq r_2$﻿ be roots of the equation: $t^2-c_1t-c_2=0$﻿
    - there exists constants $b,d$﻿ s.t. $a_n=br_1^n+dr_2^n,n\ge0$﻿
    - where $b+d=A_0$﻿ and $br_1+dr_2=A_1$﻿
- thm. for LHRC for repeated roots
    - $a_n=c_1a_{n-1}+c_2a_{n-2}$﻿ is LHRC
    - $a_0=A_0,a_1=A_1$﻿
    - $r$﻿ is the repeated root of the equation: $t^2-c_1t-c_2=0$﻿
    - there exists constants $b,d$﻿ s.t. $a_n=br^n+dnr^n\space |\space n\ge0$﻿

# Lecture

![[/61_-_Week_5_notes_--_7.2_8.1_8.2_8.3.pdf|61_-_Week_5_notes_--_7.2_8.1_8.2_8.3.pdf]]

📌

**SUMMARY  
**