---
course: MATH 61
area: ucla
created: 2022-10-10T11:04
updated: 2022-10-27T17:19
📕 courses:
  - "[[Math 61- Discrete Structures]]"
tags: math
parent: MATH 61

title: 8 - Permutations and Combinations - 6.2

layout: note

---
# Recall

# Notes

Supplemental Definitions

Examples

- e.g. conditional permutation
    - how many perms of A,B,C,D,E,F where DEF appear together
    - i.e. elements = A B C DEF
    - $\therefore 4!$﻿
    - e.g. ABCDEF where DEF together but in any order
        - step 1: permute A B C DEF
            - 4!
        - step 2: permute D E F
            - 3!
        - by mult. principle: $4!\cdot3!$﻿
- e.g. linear permutation
    - seat 6 people at a table here rotation is equivalent to non-rotation
    - idea 1: place 1 then place 5 remaining in a line
        - $5!$﻿
    - idea 2:
        - line up 6 people in any permutation then divide by the extra factor of 6 where the first and last persons where “rotated”
        - $\frac{6!} 6$﻿
- e.g. r-perm
    - pick 4 specific members from 10 person committee
    - $P(10,4)=10\cdot9\cdot8\cdot7=\frac{10!}{6!}$﻿
- e.g. r-comb
    - choose 4 person subcommittee from 10 members
    - $C(10,4)=\frac{10!}{6!4!}$﻿
- e.g. r-comb strings
    - how many 8-bit strings have four 1s
    - the string is determined by the position of the 1s $\therefore$﻿ we should find all combinations of positions of the four 1s
    - $C(8,4)=\frac{8!}{4!4!}$﻿
- e.g. deck of cards
    - set X is an ordinary deck of 52 cards
    - how many (unordered) 5 card hands are there
        - $\binom {52} 5=C(52,5)=\frac{52!}{47!5!}$﻿
    - how many of those hands contain all of same suit
        - step 1: choose suit = 4
        - step 2: how many from the suit = C(13,5)
        - $4\cdot C(13,5)$﻿
    - how many 5 card hands contain 3 of one number and 2 of another
        - $13\binom 43\cdot12\binom 42$﻿

Big Ideas

- permutation
    - an ordering of n elements
    - number of perms = n!
        - $n!=n\cdot(n-1)\cdot...\cdot2\cdot1$﻿
- r-permutation
    
    - an ordering of an r-element set is a subset of n-element set
    - denoted $P(n,r)$﻿
    - $P(n,r)=n\cdot(n-1)\cdot…\cdot(n-r+1)=\frac{n!}{(n-r)!}$﻿
    
      
    
- r-combination
    - an r-element subset of set X
    - denoted $C(n,r)=\binom nr$﻿
    - $C(n,r)=\frac{P(n,r)}{r!}=\frac{n!}{(n-r)!r!}$﻿
- (shortest) grid walk
    
    - between two integer tuples: $(0,0)\to(m,n)\space |\space m,n\in\mathbb{Z}_{\ge0}$﻿
    
    ![[/Untitled 74.png|Untitled 74.png]]
    
    - $C(n+m,n)=\binom {n+m} n$﻿ possible grid walks from $(0,0)\to(m,n)$﻿

# Lecture

![[/61_-_Week_3_notes_--_6.2_6.3_6.7_6.8 3.pdf|61_-_Week_3_notes_--_6.2_6.3_6.7_6.8 3.pdf]]

📌

**SUMMARY  
**