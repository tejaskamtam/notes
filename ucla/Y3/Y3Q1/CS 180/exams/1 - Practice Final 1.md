---
area: ucla
quarter: Y3Q1
created: 2023-12-07 07:55
updated: Thursday 7th December 2023 07:55:51
course: CS 180
📕 courses:
  - "[[CS 180 - Algorithms]]"
parent: CS 180

title: 1 - Practice Final 1

layout: note

---
## Problem 1
### Part a
> Consider an instance of the weighted interval scheduling problem (find a maximum weighted non-overlapping interval). Design an $O(nlogn)$ time algorithm to solve the problem. Prove its correctness and analyze its time complexity.

**Algo**



## Problem 2
> A Hamiltonian path in a DAG is a path that contains each vertex exactly once. Is the problem of finding a Hamiltonian path in a DAG NP- Complete? Either prove it or design an O(e+n) time algorithm for finding a Hamiltonian path in a DAG.

- In a DAG hamiltonian path finding is not np-complete
- we create a topo ordering
- bc all edges must go forward (i.e. we cant go backward) there is only a valid hamiltonian path if we go from the source node 1 directly to 2 to 3 and so on
- if we reach the end (last node) then that is the hamiltonian path
- otherwise no such path

## Problem 3
> Given an nxn matrix where every row is sorted in increasing order, design an algorithm that outputs the smallest common element in all rows. If there is no common element return -1. Analyze the time complexity of your algorithm.

## Problem 6
> Prove that finding a vertex cover (VC) in a graph is NP-complete. You can assume that finding a maximum independent set (MIS) in a graph is known to be NP-complete.VC is the minimum number of vertices that contains at least one end point of every edge. MIS is the maximum number of vertices that are pairwise dis- connected (there is no edge between them)

- i.e. show $MIS \le_p VC$
- we observe set of all nodes $N\setminus VC=MIS$ and $N\setminus MIS = VC$
- say we have $u,v\in MIS(G)$ then there are no edges $(u,v)$ thus all edges are not in the MIS
- say we have $VC(G)=T$ then for all edges in G, at least 1 endpoint is in T
- BWOC, assume there's an edge bw 2 nodes not in T thus, it is in the solution MIS
- this is a contradiction by the definition of VC

## Extra: $SAT \le_p MC$
- satisfiability: given a set of boolean statements using a set of bools, find an assignment of bools to make the boolean statement true
- 3sat: a conjunction of 3 disjunctions: $(a | b| c)\land (d|e|f)$
- any sat can be expressed a bunch of 3sats
- so now we must show $3SAT\le_p MC$
- we can show nodes as the boolean variables and we create "groups of the nodes" for each statement in the sat problem
- we draw connections if the statement of any 2 booleans across thee groups are valid
- thus the maxclique represents a compelte graph with 1 endpoint in each group -> a satisfiability
### Time Complexity
- for $n$ booleans, we create $O(n)$ connections overall is $O(n^2)$
### Proof
- sps. we have a 3sat of $n$ terms
- show any clique of size $n$ is a valid solution to satisfiabiliity
	- a clique of size $n$ must have a true value in each clause, thus whole term is true
- how is any satisfiable assignment transformable into a clique
	- a satisfiable assignment must be legal thus there are edges for al legal assignments across clauses thus the legal assignment will show a clique in the graph across the clauses the assignment incorporates

