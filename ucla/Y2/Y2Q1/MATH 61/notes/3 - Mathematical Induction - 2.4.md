---
course: MATH 61
area: ucla
created: 2022-09-28T10:58
updated: 2022-10-27T17:19
📕 courses:
  - "[[Math 61- Discrete Structures]]"
tags: math
parent: MATH 61

title: 3 - Mathematical Induction - 2.4

layout: note

---
# Recall

1. Induction Principle
    1. we can prove a statement is true for each iteration if we can show it is true for
    2. basis step
        1. holds for n=1
    3. inductive step
        
        1. if held for previous n, then holds for next n
        
          
        

# Notes

Supplemental Definitions

- mathematical induction
    - proof technique of proving the truth of a series based on certain evidence

Big Ideas

- induction principle
    - suppose we have a function of propositions S(n), runs over $n\in\mathbb{Z}_{>0}$﻿
    - basis step
        - S(1) is true
    - inductive step
        - for each $n\ge n_0$﻿ if S(n) is true$\implies$﻿S(n+1) is true
    - Then, S(n) is true for each $n\in\mathbb{Z}_{>0}$﻿
        - $n\in\{n_0,n_0+1,n_0+2,...\}$﻿
- example 1
    - let $S_n=1+2+...+n$﻿ for $n\in\mathbb{Z}_{>0}$﻿
    - claim: $S_n=\frac{n(n+1)}{2}$﻿ for $n\ge1$﻿
    - proof
        - step 1: basis step
            - $S_1=\frac{1(1+1)}{2}=1$﻿
        - suppose for n≥1, $S_n=\frac{n(n+1)}{2}$﻿, we want to show $S_{n+1}=\frac{(n+1)(n+2)}{2}$﻿
        - step 2: inductive step
            - $S_{n+1}=1+2+...+n+(n+1)\implies S_{n+1}=S_n+(n+1)=\frac{n(n+1)+2(n+1)}{2}=\frac{(n+1)(n+2)}{2}$﻿
            - thus, by inductive principle, the claim is proved
- example 2: Geometric Sum
    - for $r\neq 1, a+ar+ar^2+...+ar^n=\frac{a(r^{n+1}-1)}{r-1}$﻿ for all n ≥ 0
    - proof
        - basis step
            - $n=0\implies a=\frac{a(r^1-1)}{r-1}=a$﻿
        - WTS: $a+ar+...+ar^n+ar^{n+1}=\frac{a(r^{n+2}-1)}{r-1}, n\ge0$﻿
        - inductive step
            - $\text{LHS}=\frac{a(r^{n+1}-1)}{r-1}+ar^{n+1}\implies\frac{a(r^{n+2}-1)}{r-1}=\text{RHS}$﻿
- example 3: theorem
    - if $|X|=n\implies|P(X)|=2^n\space\text{for}\space n\ge 0$﻿
    - basis step:
        - $n=0\implies X=\phi\implies P(X)=\{\phi\}\implies|P(X)|=1=2^0$﻿
    - Suppose $X \text{st.} |X|=n, |P(X)|=2^n$﻿
    - WTS: $Y=\{y\}\space\text{st.}\space|Y|=n+1$﻿ so $X\sube Y$﻿ so $X\cup\{y\}=Y$﻿
    - inductive step
        - $|P(X)|=2^n=|P(Y-\{y\})|$﻿
        - $P(Y)=P(Y-\{y\})\cup\{S\in P(Y)|y\in S\}$﻿
        - Bijection: $f:\{S\in P(Y)|y\in S\}\to P(Y-\{y\})$﻿
        - Fact: if you have a bijective function $f:X\to Y$﻿ which takes two sets of finite cardinality, then $|X|=|Y|$﻿
        - $2^n=|P(Y-\{y\})|=|\{S\in P(Y)|y\in S\}|$﻿
        - $|P(Y)|=|P(Y-\{y\})|+|\{S\in P(Y)|y\in S\}=2^n+2^n=2^{n+1}$﻿
        - hence proved

# Lecture

![[/61_-_Week_1_notes_--_2.2_2.4_3.2 2.pdf|61_-_Week_1_notes_--_2.2_2.4_3.2 2.pdf]]

📌

**SUMMARY  
**You can prove a claim about a sequence/series for some n if you can prove the claim stands true at (base case) e.g. n=0, and inductively n≥0