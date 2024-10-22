---
area: ucla
quarter: Y3Q1
created: 2023-12-05 08:13
updated: Tuesday 5th December 2023 08:13:04
course: CS 180
📕 courses:
  - "[[CS 180 - Algorithms]]"
parent: CS 180

title: 15 - NP Completeness

layout: note

---
## NP-Completeness
- until this point all algos are polynomial
- NP : class of problems whose solutions can be verified in polynomial time
	- P : class of problems solvable in polynomial time
- NP-complete : class of problems with a polynomial verifiable solution
	- all NP-Complete problems are NP
- ![[Pasted image 20231205081446.png]]
### Transformability
- if we have algo $X$ and we can use it to solve algo $Y$
- then $Y \le_p X$ (Y is polynomial time transformable to X) bc at worst we use $X$ to solve $Y$ but can possibly do it faster
	- Y is polynomial time transformable to X
- e.g., bipartite matching <= max flow
- there exists some NP-Hard problems that are NP-Complete
- NP-Hard is the class of problems not solvable/provable in polynomial time
### Traveling Salesman
- Best way to visit all cities
- This is solved in exponential time
### Satisfiability Problem
- $F(x)=(x_1|\bar{x_2}|x_3) \& (\bar{x_1}|x_4|x_7) \& …$﻿
- Is there an assignment that results in $F(x)$﻿ being true?
- Solving this in polynomial time is impossible
- But it is certifiable in polynomial time, thus it is NP-Complete


### Max Clique by Max Independent Set
- a max clique (MC) is a set of vertices that create a complete graph
- a max independent set (MIS) is the largest set of vertices that are not mutually connected (no edges between them)
- show MC is NP-complete given MIS is np-complete, thus prove $MC\le_p MIS$
- solving MIS solves MC (MIS is solved by creating the inverse of the graph and finding max clique), so if MC is NP-complete, then MIS is also NP-Complete
- Also we must prove MIS is poly-time transformable (i.e. representable as the max clique problem in poly-time) which we can see is true bc to make the complement graph we look at E edges or vhange links between at worst $V^2$ which is polynomial in the input size
#### Proof
- MIS is the max set of vertices without edges, thus the inverse of it, they must all have edges between them
- BWOC: assume MIS of G' is not max clique on G
- then, on G there must be an edge between 2 nodes of the MIS (on G)
- however, because we assume the MIS on the inverse is not the max clique, then there must be an edge in the inverse (because there's not one in the clique on G) thus making it not an MIS on the inverse

### Vertex Cover and Set Cover Problem
- vertex cover: minimum number of vertices adjacent to all edges
- set cover: minimum number of sets whose union contains all elements
#### Proof
- Prove: vertex-cover $\le_p$ set-cover
	- ![[Pasted image 20231205084124.png]]
	- 
- create a graph to represent nodes as sets, and edges as the elements
	- ![[Pasted image 20231205084251.png]]
- because vertex cover is representable by set over, a minimum solution for set over solves the other
- but to prove this is a true representation transformation, we must prove all of the following or generalize by bounding by VC
	- ![[Pasted image 20231205084539.png]]
	- an SC S is a selection of vertices that can be transformed to VC, thus VC is bounded by $n$ : $|VC| \le n$
	- a VC T with $k$ vertices is at worst a minimum set cover bounded by $k$: $|SC|\le k$
	- 
- therefore, if VC is NP-complete, then SC is also NP-complete as it is the upper bound and polynomial time transformable
- We also have to prove the transformation is poly-time which we can see is true bc we can represent the set-cover problem by creating sets for each node and keeping each of their adjacent edges as the elements of the nodes this is $O(V+E)$ which is polynomial in the inputs]
### Proving Poly-time transformability
- to prove $Y\le_p X$ 
- take an arbitrary instance of $Y$, show that you can use polynomial steps to represent it as the problem for $X$
- then show that after solving, the transformation back to the representation of $Y$ can be done in polynomial time
- prove this for all instances of $Y$