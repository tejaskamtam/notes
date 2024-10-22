---
area: ucla
quarter: Y3Q1
created: 2024-01-29 14:00
updated: Monday 29th January 2024 14:00:57
course: CS 161
📕 courses:
parent: CS 161

title: 5 - Constraint Satisfaction Problems

layout: note

---
## Structure
- factored into parts, w/ percepts - solution can see the current state and make nondeterministic choices
### Representation
- Variable: $X$
- Domain: $D$
- Constraints - also goal when all are met
### Constraint Types
- Unary: $X\neq G$
- Binary: $X_1\neq X_2$
- Higher Order
	- Linear Constraints
	- Non-linear constraints
- Global constraints - domain restrictions
- Soft constraints - allowable by some variable, $\varepsilon$
- an be represented as graphs ![[Pasted image 20240129144006.png]]
## Solutions
### Naive Solution - DFS
- Formulation ![[Pasted image 20240129144254.png]]
- In this search tree, the depth is limited/finite, so just use DFS instead of IDS ![[Pasted image 20240129144441.png]]
## Backtracking search
- abuse commutative variable/actions to create a backtrakable tree ![[Pasted image 20240130180744.png]]
	- ![[Pasted image 20240130180754.png]]
- limitation: baktraking can get bad, we can make it more efficient by checking whether the next action is legal and decide whether or not to take the current branch
- also we can look ahead to decide the order of seletion, e.g. color in order of touhing/constrained nodes isntead of randomly across the state space
## Variable Selection Heuristics
- ![[Pasted image 20240130181113.png]]
- ![[Pasted image 20240130181344.png]]
### Heuristics
- 1 ![[Pasted image 20240130181009.png]]
- 2 ![[Pasted image 20240130181019.png]]
- 3 ![[Pasted image 20240130181048.png]]
### Forward Checking Algorithm
- look ahead to check the previous heuristics
![[Pasted image 20240214130904.png]]
### Arc Consistency Algorithm
- look ahead even further to check if the new heuristic constrains constrain other variables - i.e. higher-order search of searched values
- for an edge in the constraint graph, we look at $d$ domain values on each endpoint: $d^2$, then we can look at each edge only $d$ time because we determine one value of a variable each time we look at an edge (this is extra work that depends on the structure of the constraint graph): $d$; then we do this for at most $n^2$ edges![[Pasted image 20240130181423.png]]
## Exploiting Structure
- splitting a graph of $2^{80}$ action space to $4\cdot 2^{20}$ 
	- one is centuries faster
### Tree Shaped Constraint Graphs
- constraint tree - faster Arc Consistency on only TREEs
	- select some for the starting node, then communicate between nodes to decide available values
	- once decided, run backwards based on the last selection (which is a forced selection)
	- e.g., A selects some value, propagate constraint to B and force C; then D decides based on D and forces E which backtracks and forces D and forces F
	- then run backwards, F decides what value to take based on its forward pass; the improvement is that we do $d^2$ but only between 2 nodes at a time and not the graph entirely with a naive algo
	- thus $O(n\cdot d^2)=2nd^2$
	- detects failure if the root (F) has no options ![[Pasted image 20240131141915.png]]
### Cutset Conditioning: Graph -> Tree
- collapse a node that causes teh graph to not be a tree by giving it a value
	- ![[Pasted image 20240131143545.png]]
- then create the tree by replacing the binary constraint with a unary constraint and run the above reduced arc consistency for each value that the collapsed node could take
	- ![[Pasted image 20240131143647.png]]
- BUT, many nodes could be causing not-a-tree which mean at worst. we must remove almost all nodes (the cutset) - # $c$ nodes required to be removed -> $d^c\cdot (n-c)$ times to run the tree algo thus total $$O\big(d^c(n-c)\cdot nd^2\big)$$
- NOTE: in this example, the problem is symmetric across all values, so no solution when we collapse SA to red means no solution at all
### Tree Decomposition
- decompose into subtrees with shared constraints in each subtree
- then tie each of these subtrees as constraints of the other subtrees
- then intersect the solution space of each subtree
- then we must look at $v$ values for $n$ variables: $v^n$ times such that each subtree is a variable $V_1=v^n$ solution space
- solved in $O(nd^2)$ but hard to make decompositions![[Pasted image 20240131144255.png]]
