---
course: MATH 61
area: ucla
created: 2022-10-07T11:05
updated: 2022-10-27T17:19
📕 courses:
  - "[[Math 61- Discrete Structures]]"
tags: math
parent: MATH 61

title: 7 - Counting Principles - 6.1

layout: note

---
# Recall

# Notes

Supplemental Definitions

Examples

- e.g. multiplication principle
    - what’s the number of strings of length 4 from ABCDE with no repetition
    - $n_1=5,n_2=4,n_3=3,n_4=2$﻿
    - $\prod_{k=1}^4 n_k=5\cdot4\cdot3\cdot2$﻿ strings
    - no need to expand
    - e.g. how many of those strings start w/ B
        - $n_1=1,n_2=4,n_3=3,n_4=2$﻿
        - $\prod_{k=1}^4 n_k=1\cdot4\cdot3\cdot2$﻿ strings
- e.g. multiplication principle proof
    - prove $|X|=n\implies |P(X)|=2^n$﻿
    - consider the number of ways to build $S\in P(X)$﻿
    - for each $x\in X$﻿ we decide
        - add x to S or
        - not add x to S
        - i.e. 2 choices for each element x
    - therefore there are n steps
    - $\implies 2_1\cdot2_2\cdot...\cdot2_n=2^n$﻿
    - by the Multiplication Principle
- e.g. multiplication principle
    - suppose you must choose 2 movies from distinct genres: 3 romance, 4 comedy, 5 children’s
    - how many ways to choose 2 movies
    - $X_1=\{\text{romance+comedy}\}$﻿
    - $X_2=\{\text{romance+children}\}$﻿
    - $X_3=\{\text{comedy+children}\}$﻿
    - Multiplication Principle
        - $|X_1|=3\cdot4$﻿
        - $|X_2|=3\cdot5$﻿
        - $|X_3|=4\cdot5$﻿
    - by the addition principle, because $X_1,X_2,X_3$﻿ are disjoint:
        - $\implies3\cdot4+3\cdot5+4\cdot5$﻿
- e.g. inclusion-exclusion principle
    - you have a committee of members A,B,C,D,E,F
    - from this committee choose a unique president, secretary, and treasurer
    - what is the total # of ways to choose
        - $n_1=6,n_2=5,n_3=4$﻿
        - $\implies 6\cdot5\cdot4$﻿ ways by the multiplication principle
    - what if A or B must be president
        - $n_1=2,n_2=5,n_3=4$﻿
        - $\implies 2\cdot5\cdot4$﻿ ways by the multiplication principle
    - what if A or D or both to be officers
        - $X=\{\text{A on board}\}$﻿
        - $Y=\{\text{D on board}\}$﻿
        - $|X\cup Y|$﻿ is desired count
        - by the inclusion-exclusion principle $\implies |X|+|Y|-|X\cap Y|$﻿

Big Ideas

- multiplication principle
    - if an event can be broken down into t independent steps
    - where there are n ways to do step 1, n2 ways to do step 2, …
    - then, there are $n_1\cdot n_2 \cdot...n_t$﻿ possible events
- addition principle
    - suppose $X_1,…,X_t$﻿ are sets where $|X_i|=n_i$﻿
    - if each set $X_i,X_j$﻿ are disjoint when $i\neq j$﻿
    - the number of elements that can be chosen from $X_1$﻿ or $X_2$﻿ or … or $X_t$﻿ is:
    - $\sum_{k=1}^t n_k=n_1+...+n_t$﻿
- inclusion-exclusion principle
    
    - if $X,Y$﻿ are finite sets
    - $|X\cup Y|=|X|+|Y|-|X\cap Y|$﻿
    
      
    

# Lecture

![[/61_-_Week_2_notes_--_3.3_3.4_3.5_6.1 3.pdf|61_-_Week_2_notes_--_3.3_3.4_3.5_6.1 3.pdf]]

📌

**SUMMARY  
**