---
area: ucla
quarter: Y3Q1
created: 2023-10-26 08:03
updated: Thursday 26th October 2023 08:03:31
course: CS 180
📕 courses:
  - "[[CS 180 - Algorithms]]"
---
## Supplemental
### Searching
- searching - use heap sort $O(n\log n)$
- may be const time if we know the range of value - then count frequencies and reproduce same frequencies in the output list
### Log N Complexities
- there can be at most $n-1\le e\le n^2$ edges so we can simplify any log operations on nodes as: $O(e\log n^2)=O(2e\log n)\approx O(e\log e)$
### Relax unique edges
- if we encounter the same weighted edges in Prim or Kruskal
- add some $\varepsilon$ to one of them, possibly $\varepsilon\approx 1/e$
## Minimum Spanning Tree (MST)
- given a connected, weighted graph $G=(V,E)$, and MST is the subset of edges that connects all nodes with the minimum sum of weights
### Cayley's Theorem
- there are $n^{n-2}$ spanning trees of such a graph $K_n$ of $n$ nodes
## Greedy MST Algos
- assume all edge weights/costs $c_e$ are unique
![[Pasted image 20231026081056.png]]
### Prim's Algo
![[Pasted image 20231026085240.png]]
- starting from a node $v_1$ include it in one cut/partition, then there is another partition in which $v_i$ is connected by some $e_{1,\min}$
- then on the next step, including both this $v_1$ and $v_i$ in one partition and repeat
![[Pasted image 20231027130157.png]]
#### Prim's Algorithm Proof
![[Pasted image 20231026083211.png]]
#### Prim's Algo Implementation & Time Complexity
$$O(e\log v)\space\lor\space O(n^2)$$
**Using a Binary Heap**

1. The time complexity required for one call to `EXTRACT-MIN(Q)` is `O(log V)` using a min priority queue. The while loop at line 6 is executing total V times.so `EXTRACT-MIN(Q)` is called `V` times. So the complexity of `EXTRACT-MIN(Q)` is `O(V logV)`.
    
2. The `for` loop at line 8 is executing total `2E` times as length of each adjacency lists is `2E` for an undirected graph. The time required to execute line 11 is `O(log v)` by using the `DECREASE_KEY` operation on the min heap. Line 11 also executes total `2E` times. So the total time required to execute line 11 is `O(2E logV) = O(E logV)`.
    
3. The `for` loop at line 1 will be executed `V` times. Using the procedure to perform lines 1 to 5 will require a complexity of `O(V)`.
    

Total time complexity of `MST-PRIM` is the sum of the time complexity required to execute steps 1 through 3 for a total of `O((VlogV) + (E logV) + (V)) = O(E logV)` since `|E| >= |V|`.

Page 149
- using an array we look at each node and look at each of its neighbors, finding the min is $O(n)$ for each node so naively $O(n^2)$
- however, we can look at the edges and make at most one update per edge, but finding the minimum edge (since there can be a lot of edges) by weight using a minheap and `heappop` is $O(\log e)$ per edge so overall is $$O(e\log e)\sim O(e\log n)$$
![[Pasted image 20231026083822.png]]
### Kruskal's Algo
![[Pasted image 20231026085257.png]]
- assume unique edge weights for now, relax later:
- sort edges from least to greatest $O(e\log e)$
- starting with the least edge cost, create a bipartition with one endpoint as et $S$ and the other et as all other vertices set $N\setminus S$
	- ![[Pasted image 20231031082934.png]]
- for the next one there is 2 cases, we want to select the one that allows $e_2$ to be in the MST (but may not be possible)
	- ![[Pasted image 20231031083343.png]]
	- ![[Pasted image 20231031083419.png]] see that in this one above, we want to draw the partition NOT around only $a$ so that we can include the next smallest edge
	- ![[Pasted image 20231031083522.png]] when we encounter a cycle either e1 or e2 wiill be cut, but in either way we dont select e3 so we dont add it to the MST -> Kruskal selects smallest edges if they don't create 
	- 
- Use [[10 - Union Find (4.6)#Union Find|Union Find]]
- ALGO - at each selection of an edge, we create the partitions of the eedges and treat them as sets, to check the edge we're on:
	- if the endpoints of the edge are in different sets -> add it to the MST -> combine the two sets that the endpoints of the edge belonged to and continue
	- if in the same set -> creates a cycle -> do not add
#### Kruskal's Proof
![[Pasted image 20231026085434.png]]
#### Kruskal's Implementation & Time Complexity
- sorting is $O(e\log e)$ to sort all edges
- for each edge, consider each endpoint as a set, do a find, if cycle -> disregard, if not -> add to the MST and add the single set endpoint and union it to the other: $O(e\log n)$
- And recall $O(E)=O(V^2)\implies O(\log E)=O(2\log V)$ in the worst case
- So, overall  it is $$O(e\log e)=O(e\log v)$$
- so for each edge, there will be one endpoint belonging to a large cumulative set, and the other endpoint either a separate set or causing a cycle
![[Pasted image 20231031083828.png]]
### Properties
![[Pasted image 20231026081233.png]]
#### Cut Property Proof - "MST Theorem" (In-class definition)
- In class proof
	- creating a cut (therefore 2 cuts, a bipartition) will cut some number of edges like in the image below where one of the edges connecting the cuts is $e_{\min}$ connecting nodes $v$ from one cut to $w$ the other
	- suppose you have some plausible MST, not including $e_{\min}$, then including this $e_{\min}$ in the MST creates a cycle in the MST across both partitions with another edge $f$ between partitions
	- then removing $f$ will still result in an MST, but this new MST must have a sum weight < previous MST (assuming unique weights, otherwise <=)
	- this contradicts the proposition that the first MST was a true MST
	- thus, the true MST must contain all edges similar to $e_{\min}$
![[Pasted image 20231026083010.png]]
#### Cycle Property Proof
![[Pasted image 20231026083125.png]]

### Cycle-Cut Intersection
![[Pasted image 20231026082126.png]]
#### Cutset
![[Pasted image 20231026082142.png]]
