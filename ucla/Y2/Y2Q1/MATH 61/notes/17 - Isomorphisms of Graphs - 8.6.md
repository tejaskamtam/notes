---
course: MATH 61
area: ucla
created: 2022-11-06T22:10
updated: 2022-11-08T15:09
📕 courses:
  - "[[Math 61- Discrete Structures]]"
tags: math
---
# Definitions

---

- visualizations of graphs
    - we can visualize graphs in multiple ways
    - e.g. isomorphic representation
        
        ![[/Untitled 17.png|Untitled 17.png]]
        
- injective function
    - a function that is “one-to-one”
    - it maps every value of the domain to a single value in the codomain
    - $f:X\to Y$﻿ is injective $\iff f(x)=f(y)\implies x=y\space |\space x\in X,y\in Y$﻿
- surjective function
    - a function that is “onto”
    - $f:X\to Y$﻿ is surjective $\iff \forall y\in Y,\exists x\in X\space |\space f(x)=y$﻿
- bijective function
    - a function that is both injective and surjective
- equivalence relation
    - a relation which is reflexive, transitive, and symmetric
- simple cycle
    - a path $a\to a$﻿ for $a\in V(G)$﻿ such that no edge is crossed more than once

# Big Ideas

---

## Isomorphism

- graphs $G_1,G_2$﻿ are isomorphic if there is are bijective functions:
    - $f:V(G_1)\to V(G_2)$﻿
    - $g:E(G_1)\to E(G_2)$﻿
    - s.t. $\exists e=(v\in V(G_1),w\in V(G_1)\iff g(e)=(f(v),f(w))$﻿
- this pair of functions $f,g$﻿ is an isomorphism of $G_1$﻿ onto $G_2$﻿

### Relations

- a relation $R$﻿ on the set of graphs s.t. $G_1RG_2$﻿ when $G_1,G_2$﻿ are isomorphic
- this is an equivalence relation

### Theorem

- $G_1,G_2$﻿ are isomorphic $\iff$﻿ for some ordering of their vertices, their adjacency matrices are equal
- e.g. isomorphism of adjacency matrices
    
    ![[/Untitled 1 8.png|Untitled 1 8.png]]
    

### Corollary

- let $G_1,G_2$﻿ be simple graphs, then $G_1,G_2$﻿ are isomorphic if:
- $\exists f:V(G_1)\longmapsto V(G_2)$﻿ s.t. $v,w$﻿ are adjacent in $G_1\iff f(v),f(w)$﻿ are adjacent in $G_2$﻿

## Invariants

- a property of graphs that is preserved under isomorphism
- property $P$﻿ is an invariant when $G_1$﻿ has property $P$﻿ s.t. $G\in [G_1]$﻿ has property $P$﻿

### Proving Not Isomorphic

- detect discrepancies in invariants of graphs
- e.g. vertices, edges
    
    ![[/Untitled 2 7.png|Untitled 2 7.png]]
    
- e.g. degree
    
    ![[/Untitled 3 4.png|Untitled 3 4.png]]
    

### Proposition

- the property of having a simple cycle of length $k$﻿ is an invariant

# Resources

---

![[/61_-_Week_6_notes_--_8.4_8.5_8.6 2.pdf|61_-_Week_6_notes_--_8.4_8.5_8.6 2.pdf]]

📌

**SUMMARY  
**