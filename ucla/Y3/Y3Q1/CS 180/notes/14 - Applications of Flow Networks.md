
## Sid's Notes
- $Y \propto pX$﻿
- $Y$﻿ is polynomial time transformable to $X$﻿
- Assuming there is a polynomial time transformation of a problem $Y$﻿ to $X$﻿ and a polynomial time transformation back from the problem $X$﻿ to $Y$﻿:
    - $X$﻿ is polynomial time $\impliedby Y$﻿ is polynomial time

### NP-Complete Problems
- These problems are called NP-complete or NP-hard
### Traveling Salesman
- Best way to visit all cities
- This is solved in exponential time
### Satisfiability Problem
- $F(x)=(x_1|\bar{x_2}|x_3) \& (\bar{x_1}|x_4|x_7) \& …$﻿
- Is there an assignment that results in $F(x)$﻿ being true?
- Solving this in polynomial time is impossible

---

- Final will be 2 hours, 6 problems, 7 minutes for scanning
- Focused mostly on the second half (after the midterm)
    - Obviously will still need concepts from the first half
- If he had to assign grades to midterm (before regrading)
    - 78+ would be an A
    - 67+ would be a B
    - 50+ would be a C


## Bipartite Matching Problem
### Problem
- given a bipartite graph, maximize the number of one-to-one matches
	- not a bipartite graph can have multiple from part A math to a single value n Match B
### Algorithm
- include a new node $S$ and $T$
- connet all nodes of Part A to node $S$ and vice versa, connect all of part B to node $T$
- set all edges to cap 1
- run Maxflow algo and the maxflow s the maximum number of one-to-one matchings
### Time Complexity
- we acess all edges to set to cap 1 so it is $O(E)$
- we access all nodes to connect to either $S$ or $T$ so it is $O(V)$
- Then we can have up to $f$ flows for a maxflow of $f$
- thus overall, $O(|f|(V+E))$
### Proof
- assume maxflow is correct
- take the cut $A$ as the cut of all nodes connect to and include $S$ and cut $B$ s the converse
- then the cut $A$ cuts the edges and has some capacity, because the maxflow is = cap of the cut, and bc all caps are 1, the maxflow = # of matchings
- also bc cap is 1, the flow only takes one path from part A to part B, thus the matching is indeed one-to-one

## Cellphone Towers
### Problem
- $m$ cell phone towers with some cap each
- $n$ cell phones with some range
- maximize the number of cell phones to connect
### Algo
- connect all phones to the source $S$ with capacity 1
- connect all towers to the sink $T$ with capacity 1
- connect all phones in range of a tower to the tower with capacity 1
- run Ford-Fulkerson -> maxflow is max number of cellphones connected to the internet
### Analysis
- time compelxity and proof is very smilar to bipartite matching

## NP-Completeness
- until this point all algos are polynomial
- NP : class of problems whose solutions can be verified in polynomial time
	- P : class of problems solvable in polynomial time
- NP-complete : class of problems with a polynomial verifiable solution
	- all NP-Complete problems are NP
### Transformability
- if we have algo $X$ and we use it as a subroutine of algo $Y$
- then $Y \le X$ bc at worst we use $X$ to solve $Y$ but can possibly do it faster
	- Y is polynomial time transformable to X
- e.g., bipartite matching <= max flow
- there exists some NP-Hard problems that are NP-Complete
- NP-Hard is the class of problems not solvable/provable in polynomial time