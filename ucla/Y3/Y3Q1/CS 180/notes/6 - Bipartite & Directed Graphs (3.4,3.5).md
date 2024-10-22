---
area: ucla
quarter: Y3Q1
created: 2023-10-17 08:03
updated: Tuesday 17th October 2023 08:03:03
course: CS 180
📕 courses:
  - "[[CS 180 - Algorithms]]"
parent: CS 180

title: 6 - Bipartite & Directed Graphs (3.4,3.5)

layout: note

---
## Bipartite Graphs
- a graph where we can differentiate 2 sets of vertices
	- ![[Pasted image 20231017081109.png]]
- also called 2-colorable - no 2 adjacent vertices are same color
### Odd Cycles
- any cycle of odd length $C_{2n+1}$ indicates NOT bipartite
### Algo for proving not bipartite
- $G=(V,E)$ is undirected (we assume one component for simplicity)
- consider [[5 - Graph Traversal (3.2, 3.3)#BFS - level order|BFS]] tree w/ leveling
- we say a graph is not bipartite iff there is an edge between vertices of the same level
$$O(n+m)$$
### Proof - odd cycle length 
- sps. there are two vertices $a,b$ on level $i$ ($\ell_i$), if these vertices are connected on the same level, then the graph is not bipartite
- these two vertices have parents $a',b'$ on a higher level $i-1$ ($\ell_{i-1}$) must merge at some point $x$ somewhere between level $0$ and level $i-1$
- this cycle is  length $2(\ell_i - \ell_x)+1$ -> so it cannot be bipartite by the odd cycle property

## Directed Graphs
### Connectivity
- strongly connected - $\forall u,v\in V$ there is a directed path from $u\to v$ and $v \to u$
	- regardless of path length
### Naive connectivity algo
- check every PAIR: $O\big(n^2(n+m)\big)$
- from every node run [[5 - Graph Traversal (3.2, 3.3)#BFS - level order|BFS]] to check if every other node is connected
- then run again for every node going in the opposite direction i.e. check $a\to b$ for each $a$ then $b\to a$ for every $b$
### Better algo
1. pick an arbitrary vertex $S$
2. from $S$ run [[5 - Graph Traversal (3.2, 3.3)#BFS - level order|BFS]] on the graph $G$
3. from $S$ run [[5 - Graph Traversal (3.2, 3.3)#BFS - level order|BFS]] on the graph $G^{\text{rev}}$ (Grev is G with all directions reversed)
- if $S$ can reach $B$ in both graphs, then it is strongly connected TO the graph
- $S$ is known a connector p> so for any other vertices, $u,v$ to find a connection $u\to v == u\to S\to v$
$$O(n+m)$$