---
course: MATH 61
area: ucla
created: 2022-11-21T01:33
updated: 2022-11-21T17:29
📕 courses:
  - "[[Math 61- Discrete Structures]]"
tags: math
---
# Definitions

---

- simple graph
    - a graph with no loops or parallel edges
    - [[Graphs - 8.1]]
- connected graph
    - a graph with no isolated vertices
    - [[Graphs - 8.1]]
- isomorphic graphs
    - graphs that are equivalent and can be proved by rearranging/reassigning vertices and edges
    - [[Isomorphisms of Graphs - 8.6]]

# Big Ideas

---

## Definitions

### Planar graph

- a graph is planar if it can be drawn on a plane without crossing edges
- e.g. planar graph
    
    ![[/Untitled 26.png|Untitled 26.png]]
    

### Cycle graph

- the cycle graph $C_n$﻿ has $|V(C_n)|=n$﻿ vertices is the simple, connected graph consisting of a single cycle
- every vertex has degree 2
- is a planar graph
- e.g. planar (cycle) graph
    
    ![[/Untitled 1 17.png|Untitled 1 17.png]]
    

### Faces

- for a connected planar graph, the edges $E(G)$﻿ divide the plane into regions called faces
- each face is defined by the cycle that forms its boundary (including the graph itself)
- e.g. faces of $G=K_4$﻿
    
    ![[/Untitled 2 16.png|Untitled 2 16.png]]
    

## Euler Theorem

- for connected planar graph $G$﻿ with $f$﻿ faces and $v=|V(G)|,e=|E(G)|$﻿
- $\implies f=e-v+2$﻿
- therefore, if $G$﻿ does not follow the theorem, then it is not planar
- e.g. $K_{3,3}$﻿
    
    ![[/Untitled 3 13.png|Untitled 3 13.png]]
    
- e.g. $K_5$﻿
    
    ![[/Untitled 4 12.png|Untitled 4 12.png]]
    

## Series Reduction

### Series Reduction

- $\exists v\in V(G)\space :\space \delta(v)=2\space|\space v_1,v_2\in V\space :\space v_1\neq v_2\space |\space (v_1,v),(v_2,v)\in V(G)$﻿
- $\implies$﻿ edges $(v_1,v),(v_2,v)$﻿ are in series
- Then, a series reduction forms a graph $G'\space|\space V(G')=V(G)-\{v\}\space,\space E(G')=E(G)-\{(v_1,v),(v_2,v)\}\cup\{(v_1,v_2)\}$﻿
- then, $G'$﻿ is obtained from $G$﻿ by a series reduction
- e.g. $K_{3,3}$﻿
    
    ![[/Untitled 5 10.png|Untitled 5 10.png]]
    

### Homeomorphic

- graphs $G_1,G_2$﻿ are homeomorphic if $G_1+G_2$﻿ can be reduced to isomorphic graphs by applying a sequence of series reductions
- e.g. $K_{3,3}$﻿
    
    ![[/Untitled 6 10.png|Untitled 6 10.png]]
    
- e.g. relation
    
    ![[/Untitled 7 10.png|Untitled 7 10.png]]
    

## Kuratowski Theorem

- a graph is planar $\iff$﻿ it does not contain a subgraph homeomorphic to $K_5$﻿ or $K_{3,3}$﻿
- e.g. not planar by $K_{3,3}$﻿
    
    ![[/Untitled 8 9.png|Untitled 8 9.png]]
    

# Resources

---

![[/61_-_Week_8_notes_--_8.7_9.1_9.2.pdf|61_-_Week_8_notes_--_8.7_9.1_9.2.pdf]]

📌

**SUMMARY  
**