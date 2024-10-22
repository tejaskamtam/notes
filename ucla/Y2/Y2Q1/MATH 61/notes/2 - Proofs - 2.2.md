---
course: MATH 61
area: ucla
created: 2022-09-26T11:03
updated: 2022-10-27T17:19
📕 courses:
  - "[[Math 61- Discrete Structures]]"
tags: math
parent: MATH 61

title: 2 - Proofs - 2.2

layout: note

---
# Recall

1. Prove statements of form
    1. $p\implies q$﻿
    2. $p\iff q$﻿
2. Proof methods
    1. direct
    2. contradiction
    3. contrapositive
    4. cases
3. Miscellaneous proofs
    
    1. equivalence
    2. false statement
    3. existence
    
      
    

# Notes

Supplemental Definitions

Big Ideas

- proof statements
    - if, then
        - p implies q: $p \implies q$﻿
    - if and only if (iff.)
        - p implies q and q implies p: $p\iff q$﻿
- methods of proof
    
    - direct proof eg.
        
        assume p is true, use existing facts/theorems to prove the claim
        
        - claim:
            - for $m,n \in \mathbb{Z}$﻿, _m_ is odd and _n_ is even $\implies$﻿ $m\cdot n$﻿ is even
        - pf
            
            assume _p_ is true
            
            - n is even $\iff$﻿$n=2\cdot k$﻿ where $k\in\mathbb{Z}$﻿
            - m is odd $\iff$﻿$m=2\cdot l + 1$﻿ where $l\in\mathbb{Z}$﻿
            - $m\cdot n=(2k)(2l+1)=4kl+2k=2(k(2l+1))$﻿ therefore $m\cdot n$﻿ is even
    - proof by contradiction
        - $p\not\implies q \iff p \implies \lnot q$﻿
        - claim:
            
            $\sqrt{2}$﻿ is irrational
            
        - pf
            - assume _p_ is false: $\sqrt{2}$﻿ is rational
            - $\sqrt{2}=\frac{a}{b}\space\vert\space a,b\in\mathbb{Z}\space\vert\space b\neq 0$﻿ and $a,b$﻿ have no common factors
            - $2=\frac{a^2}{b^2}\implies 2b^2=a^2\implies a^2$﻿ is even $\iff a$﻿ is even $\iff a=2k, k\in\mathbb{Z}$﻿
            - $2b^2=(2k)^2=4k^2\implies b^2$﻿ is even $\iff b$﻿ is even
            - but this implies $a,b$﻿ have the common factor of 2, so $\sqrt{2}$﻿ must not be rational $\implies \sqrt 2$﻿ is irrational
    - proof by contrapositive
        - $p\implies q \iff $﻿(opposite of _p_)$\implies$﻿(opposite of _q_)
        - claim:
            - $x\in\mathbb{R}$﻿ is irrational$\implies \sqrt x$﻿ is irrational
        - pf
            - assume the contrapositive: $\sqrt{x}$﻿ is rational
            - $\sqrt x=\frac a b\space |\space a,b\in\mathbb{Z}\space |\space b\neq 0$﻿ and _a,b_ have no common factors
            - $x=\frac{a^2}{b^2} \space | \space a^2,b^2\in\mathbb{Z}$﻿
            - implies _x_ is rational, thus proved by contrapositive
    - proof by cases
        - break down _p_ into cases and prove _q_ in each case
        - claim
            - $x\in\mathbb{R}\implies x\le\vert{x}\vert$﻿
        - pf
            - case 1: $x\ge0$﻿
                - $|x|=x \space \text{so}\space x\le|x|=x$﻿
            - case 2: $x\lt 0$﻿
                - $|x|\gt0 \space\text{so}\space x\lt0\lt |x|$﻿
            - this covers all cases of _p_ so proof by cases
    - proof of equivalence
        - $p\iff q$﻿
        - prove: $p\implies q$﻿ and $q \implies p$﻿
    - proof of false statement
        - option 1: find a contradiction
        - option 2: find a counterexample
    - proof of existence
        
        find the existence of a instance/situation when the statement is true
        
    
      
    

# Lecture

![[/61_-_Week_1_notes_--_2.2_2.4_3.2 3.pdf|61_-_Week_1_notes_--_2.2_2.4_3.2 3.pdf]]

📌

**SUMMARY  
**In Math 61, we explore proving mathematical problems of truth concerning forms “if p is true, then q” or “if and only if p is true, then q” and vice versa  
We achieve these proofs using methods such as proofs by direct theorem, contradiction/counterexample, contrapositive, exploration of cases  
We also explore proving byproducts of mathematical statements such as proofs of existence, equivalence, and false statements