---
course: MATH 61
area: ucla
created: 2022-09-30T11:02
updated: 2022-10-27T17:19
📕 courses:
  - "[[Math 61- Discrete Structures]]"
tags: math
---
# Recall

  

# Notes

Supplemental Definitions

- functions review
    - injective
        - “one-to-one”
        - if for any $x_1,x_2\in X$﻿ such that $f(x_1)=f(x_2)\implies x_1=x_2$﻿
    - surjective
        - “onto”
        - if for each $y\in Y$﻿ there is some $x\in X\space |\space f(x)=y$﻿
    - bijective
        - both “one-to-one” and “onto”
        - both injective and surjective
- sequence
    - a function $s:I\to X$﻿ for some set X
        - $I\sube \mathbb{Z}_{\ge0}$﻿
    - $s_i=s(i)$﻿
    - $I$﻿ is the domain of the sequence $s$﻿
    - $i$﻿ is the index of the sequence
    - if $I$﻿ is finite, $s$﻿ is a finite sequence, else infinite
- subsequence of $s$﻿
    - a sequence formed from $s$﻿ by deleting some terms of $s$﻿
    - keep order of terms/elements
    - denoted if n1,n2,… are indices of he sequence that are in the subsequence
        - $\{s_{n_k}\}$﻿
- strings
    - a finite sequence of characters
    - if all characters in a set X, the string is over X
    - concatenation
        - combining strings (union)
    - substring
        - a selection of consecutive elements of the parent string

Examples

- e.g. even sequence
    - $s:\mathbb{Z}_{\ge0}\to\mathbb{Z}_{\ge0}, s(i)=2i$﻿
    - $s_k=2k$﻿
- e.g. find a closed formula for
    - $s:\frac{-1} 3,\frac 3 5,\frac{-5} 7, \frac 7 9,...$﻿
    - find a pattern
        - alternating negative implies a $(-1)^k$﻿
        - odd numbers implies $\frac{2k-1}{2k+1}$﻿
        - thus $s_k=\{\frac{(-1)^k(2k-1)}{2k+1}\}^\infin_{k=1}$﻿
- e.g. subsequence
    - sequence
        - $\{2k\}^\infin_0$﻿
    - subsequences
        - $\{4k\}^\infin_0$﻿
        - $\{2k\}^5_0$﻿
- e.g. geometric sum (notation)
    - $\sum^n_0 ar^k$﻿
- e.g. sequences proof
    - $s_n=2^n+4\cdot 3^n,n\in\mathbb{Z}_{\ge0}$﻿
    - $s_0=2^0+4\cdot3^0=5$﻿
    - $s_{n-1}=2^{n-1}+4\cdot3^{n-1}$﻿
    - claim
        - $s_n=5s_{n-1}-6s_{n-2}, n\ge2$﻿
    - proof
        - assume $n\ge2$﻿
        - $5s_{n-1}-6s_{n-2}\implies2^n+4\cdot3^n=s_n$﻿

Big Ideas

- closed formulas of sequence $s$﻿
    - if $I=\{i,i+1,...,j-1,j\}=[i,j]$﻿
        - $s$﻿ is $\{s_k\}^j_{k=i}$﻿
    - if $I=[i,\infin)$﻿
        - $s$﻿ is $\{s_k\}^\infin_{k=i}$﻿
- properties of sequences
    - suppose $i,j\in I$﻿ for $s$﻿
    - increasing
        - if $s_i\lt s_j$﻿
    - decreasing
        - if $s_i\gt s_j$﻿
    - nonincreasing
        - if $s_i\ge s_j$﻿
    - nondecreasing
        - if $s_i\le s_j$﻿
    - e.g.
        - 5,6,12,81,4108
            - increasing and nondecreasing
        - 5,6,12,81,81,4108
            - nondecreasing
- operations on $\{s_i\}^\infin_k$﻿ or $\{s_i\}^j_k$﻿
    - addition
        - $\sum^n_{i=k} s_i:=s_k+s_{k+1}+...+s_n$﻿
    - multiplication
        - $\prod^n_{i=k}s_i:=s_k\cdot s_{k+1}\cdot ... \cdot s_n$﻿

# Lecture

![[/61_-_Week_1_notes_--_2.2_2.4_3.2.pdf|61_-_Week_1_notes_--_2.2_2.4_3.2.pdf]]

📌

**SUMMARY  
**