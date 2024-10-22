---
course: MATH 61
area: ucla
created: 2022-10-30T16:38
updated: 2022-11-01T01:16
📕 courses:
  - "[[Math 61- Discrete Structures]]"
tags: math
parent: MATH 61

title: 14 - Paths and Cycles - 8.2, 8.3

layout: note

---
# Definitions

---

- simple graph
    - a graph with no parallel edges or loops
- isolated vertices
    - a vertex which has no edges to/from it

# Big Ideas

---

## Connected graph

- graph $G$﻿ is connected if for any $v,w\in V$﻿ there exists a path starting at $v$﻿ and ending at $w$﻿ on $G$﻿
- i.e. no vertex is isolated
- e.g. non-connected graph
    
    ![[/Untitled 64.png|Untitled 64.png]]
    

## Subgraphs and Components

### Subgraph

- let $G=(V,E)$﻿ be a graph, then $G'=(V',E')$﻿ is a subgraph of $G$﻿ if
    - $V'\sube V$﻿ and $E'\sube E$﻿ and
    - if $e=(v,w)\in E'\implies v,w\in V'$﻿
- e.g. subgraph
    
    ![[/Untitled 1 49.png|Untitled 1 49.png]]
    

### Component

- The subgraph $G’$﻿ of $G$﻿ containing all the edges and vertices contained in paths beginning at $v\in V(G)$﻿ is the component of $G$﻿ containing $v$﻿
- $\implies G$﻿ is connected $\iff G$﻿ has only 1 component
- e.g. components of $G$﻿
    
    ![[/Untitled 2 43.png|Untitled 2 43.png]]
    

## Paths

### Path

- let $v_0,v_n\in V(G)$﻿
- a path $v_0\to v_n$﻿ of length $n$﻿ is an alternating sequence of $n+1$﻿ vertices and $n$﻿ edges
- beginning with $v_0$﻿ and ending with $v_n$﻿
- $\implies (v_0,e_1,v_1,e_2,…,v_{n-1},e_n,v_n)$﻿ where each $e_i=(v_{i-1},v_i)\in E$﻿
- for simple graphs, we list only vertices
- e.g. path
    
    ![[/Untitled 3 37.png|Untitled 3 37.png]]
    

### Simple Path

- for $v,w\in V(G)$﻿, a simple path $v\to w$﻿ is a path $v\to w$﻿ with **no repeated vertices**

## Cycles

### Cycle

- for $v\in V(G)$﻿, a cycle at $v$﻿ is a path $v\to v$﻿ of non-zero length w/ **no repeated** **edges**

### Simple Cycle

- a simple cycle at $v$﻿ is a cycle $v\to v$﻿ in which there are **no repeated** **vertices** except $v$﻿ (first/last vertex)

## Eulerian cycles

### Euler cycle

- a cycle in $G$﻿ that includes each edge and vertex in $G$﻿ is an Eulerian cycle

### Degree

- the degree of $v\in V$﻿ (denoted $\delta(v)$﻿) is the number of edges incident to $v$﻿
- a loop at $v$﻿ → +2 to the degree of $v$﻿

### Degree Sequence

- a sequence of degrees of vertices in a graph
- e.g. degree sequence for $G$﻿
    - $V(G)=\{v_1,…,v_n\}\implies \text{deg seq:} \space\delta(v_1),…,\delta(v_n)$﻿

### Theorem (existence)

- graph $G$﻿ has an Euler cycle $\iff G$﻿ is connected and every vertex has even degree
- e.g. $G$﻿ has an Euler cycle
    
    ![[/Untitled 4 35.png|Untitled 4 35.png]]
    

### Theorem (degree)

- if $G$﻿ has $m$﻿ edges and $V=\{v_1,…,v_n\}$﻿, then
- $\sum_{i=1}^n \delta(v_i)=2m$﻿

### Corollary (degree)

- for any graph $G$﻿, there always exists an even number of vertices $v\in V$﻿ s.t. $\delta(v)$﻿ is odd

### Theorem (path)

- graph $G$﻿ has a path $v\to w\neq v$﻿ with no repeated edges $\iff G$﻿ is connected and $v,w$﻿ are the only vertices with odd degree

### Theorem (simple cycle)

- if $G$﻿ contains a cycle $v\to v \implies G$﻿ has a simple cycle $v\to v$﻿

## Hamiltonian cycles

### Hamiltonian Cycle

- a cycle in $G$﻿ that contains each vertex $v\in V$﻿ exactly once (except start/end) is a Hamiltonian cycle
- e.g. Hamiltonian cycle
    
    ![[/Untitled 5 29.png|Untitled 5 29.png]]
    

### Traveling salesman problem

- given a weighted graph $G$﻿ find a minimum length Hamiltonian cycle in $G$﻿

### Proving non-existence

- typically very difficult → analyze the graph then logic a reason why no Hamiltonian cycle can exist
- note: $\rightarrow\leftarrow$﻿ refers to a “contradiction”
- e.g. prove no Hamiltonian cycle in $G$﻿
    
    ![[/Untitled 6 28.png|Untitled 6 28.png]]
    
- e.g. prove non-existence
    
    ![[/Untitled 7 26.png|Untitled 7 26.png]]
    

# Resources

---

![[/61_-_Week_5_notes_--_7.2_8.1_8.2_8.3 3.pdf|61_-_Week_5_notes_--_7.2_8.1_8.2_8.3 3.pdf]]

> [!info]  
> undefined  
> [http://epgp.inflibnet.ac.in/epgpdata/uploads/epgp_content/S000025MS/P001478/M015488/ET/1462360146E-textofChapter7Module2.pdf](http://epgp.inflibnet.ac.in/epgpdata/uploads/epgp_content/S000025MS/P001478/M015488/ET/1462360146E-textofChapter7Module2.pdf)  

📌

**SUMMARY  
**