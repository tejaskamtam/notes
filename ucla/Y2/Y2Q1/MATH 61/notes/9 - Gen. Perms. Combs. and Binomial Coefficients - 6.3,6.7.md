---
course: MATH 61
area: ucla
created: 2022-10-10T11:45
updated: 2023-01-27T01:54
📕 courses:
  - "[[Math 61- Discrete Structures]]"
tags: math
parent: MATH 61

title: 9 - Gen. Perms. Combs. and Binomial Coefficients - 6.3,6.7

layout: note

---
# Recall

  

# Notes

Supplemental Definitions

- binomial coefficients
    - $(a+b)^n=\prod_{k=1}^n (a+b)$﻿
    - $a^{n-k}b^k$﻿ appears as a term in our expansion by choosing b from k of the factor (a+b) and choosing a from (n-k) of the factors (a+b)
    - $a^{n-k}b^k$﻿ chosen in $\binom nk=\binom n{n-k}$﻿ ways

Examples

- e.g. anagrams
    - how many ways to reorder “MISSISSIPPI”
    - $\frac{11!}{1!4!4!2!}$﻿
- e.g. RGB piles (thm. 2)
    - sps you have piles of RGB cubes w/ ≥ 8 in each color
    - how many ways to select 8 total cubes
        - t-elements: 8 cubes
        - k-elements: 3 colors
        - $\binom {8+3-1}{3-1}$﻿
- e.g. non-neg solutions (thm. 2)
    - how many non-neg integer solutions to
    - $x_1+x_2+x_3+x_4=29$﻿
    - t-elements = 4 x’s
    - k-elements = 29
    - $\binom {29+4-1}{4-1}$﻿
    - how many solutions if $x_1>0,x_2>1,x_3>2,x_4\ge0$﻿
        - t-elts = 4
        - k-elts = 29 - 1 - 2 - 3 = 23
            - bc constraints for roots “Eats up” options
        - $\binom {23+4-1}{4-1}$﻿
- e.g. binomial coefficients
    - $(a+b)^3=(a+b)(a+b)(a+b)$﻿
    - $a^3+3a^2b+3ab^2+b^3$﻿
- e.g. binom. thm.
    - expand $(3x-2y)^4$﻿
    - $a=3x,b=2y$﻿
    - $(a+b)^4=\sum_{k=0}^4 \binom 4k a^{4-k}b^k$﻿
- e.g. proof of pascals triangle thm. (combinatorically)
    - show LHS & RHS are different ways to count the same set
    - LHS
        - $\binom {n+1}k$﻿
        - i.e. ways to choose k-subset from n+1 elements
    - RHS
        - case 1: element $a_{n+1}$﻿ is in the k-subset
            - $\binom n{k-1}$﻿ options left
        - case 2: not in k-subset
            - $\binom nk$﻿ options left
        - by addition principle (of distinct combinations)
        - $\binom n{k-1} + \binom nk$﻿
    - both LHS & RHS are computing cardinalities of the same set, they must be equal
- e.g. proof of $\sum_{k=0}^n \binom nk=2^n$﻿ using binom. thm
    - sps. a=1, b=1
    - binom. thm. suggests
    - $\sum_{k=0}^n \binom nk (a)^{n-k}(b)^k = (1+1)^n = 2^n$﻿

Big Ideas

- Theorem 1
    - suppose sequence S has n items with $n_t$﻿ objects of type t
    - the number of permutations is:
    - $\frac{n!}{\prod_1^t n_t!}$﻿
- Theorem 2
    - sps. x has t elts. the number of k=elt. selections from X, allowing repetitions, is
    - $C(k+t-1,t-1)=C(k+t-1,k)$﻿
    - $\binom {k+t-1}{t-1}=\binom {k+t-1}{k}$﻿
- binomial theorem
    - for $a,b\in\mathbb{R},n\in\mathbb{Z}_{>0}$﻿, then
    - $(a+b)^n=\sum_{k=0}^n \binom nk a^{n-k}b^k$﻿
- pascals triangle
    
    - in levels of rows, enumerated i, starting with 1, where each level represents the monomials $(a+b)^i$﻿
    
    ![[/Untitled 16.png|Untitled 16.png]]
    
- pascals triangle theorem
    
    - for $1\le k\le n \implies \binom {n+1}k=\binom n{k-1} + \binom nk$﻿
    
    ![[/Untitled 1 7.png|Untitled 1 7.png]]
    

# Lecture

![[/61_-_Week_3_notes_--_6.2_6.3_6.7_6.8.pdf|61_-_Week_3_notes_--_6.2_6.3_6.7_6.8.pdf]]

  

📌

**SUMMARY  
**