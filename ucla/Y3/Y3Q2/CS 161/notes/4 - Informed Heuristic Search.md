---
area: ucla
quarter: Y3Q1
created: 2024-01-22 14:37
updated: Monday 22nd January 2024 14:38:10
course: CS 161
📕 courses:
parent: CS 161

title: 4 - Informed Heuristic Search

layout: note

---
## Heuristic Search 
- generally we want to move in a specific direction to get to a city from a city
- heuristic function $h(n)$ gives us the information about how far east or how close to the goal state we are
### Greedy Best-First Search
- pick node based on evaluation function $f(n)=h(n)$ s.t. $h(goal)=0$
- in this algo, the heuristic is static for all nodes, specific to the given initial and goal state; however
- is not optimal, but made efficient moves and only expanded aa path to the goal state
- not complete, can get stuck in sink because decisions are made on the heuristic -> can be mitigated if infinite paths are prevented
- Time and space $O(b^m=|V|)$ heavily dependent on the heuristic -> could get to $O(bm)$
### Limitations
- UCS from [[3 - Uninformed Search#Uniform Cost Search (UCS)]] is too conservative and greedy is suboptimal
- so we must use some other solution e.g. $$f(n)=g(n)+h(n)$$
- where $g(n)$ is the true path cost introduced in UCS
- we assume the heursitic is a good estimate and is optimistic in less than the actual cost but positive - admissible heuristic
## A*
- we use the evaluation function described above: $$f(n)=g(n)+h(n)\quad s.t.\quad 0 \le h(n) \le h^*(n)\quad\forall n$$
- we begin with $h(n)=\max$ and $g(n)=0$ and end when $h(n)=0$ and $g(n)=C^*$ (optimal path cost)
	- ![[Pasted image 20240214104246.png]]
- A* is optimal iff the heuristic is admissible for all nodes
	- A* will **surely expand** all nodes on the minimum path $f(n)<C^*$
	- A* will then expand some nodes **on** the "goal contour" $f(n)=C^*$
	- and never expands nodes beyond the minimum path $f(n)>C^*$
	- thus it is optimally efficient but may be unlucky and not select the optimal one first
- admissibility proof (contradiction)
	- ![[Pasted image 20240214103319.png]]
### Consistency vs Admissibility (beyond scope)
- a heuristic is admissible if it never overestimates the true cost i.e. $h(n) \le h^*(n)$
- but a stronger property is consistency s.t. every consistent heuristic is admissible: $$h(n)\le c(n,a,n')+h(n')$$
- proof by triangle inequality 
	- ![[Pasted image 20240214103610.png]]
### Inadmissible heuristic - Satisficing search
- some solutions require expanding too many nodes for optimality, so we can use a suboptimal heuristic and decrease time to goal
- we multiply a linear weight to the heuristic to make the algo more heavily weight the heuristic
- e.g., detour index to describe curvature of a road on the straight line path between 2 cities $$f(n)=g(n)+W\cdot h(n)\quad|\quad W>1$$
### Solving 8-sliding tile puzzle
- Create an admissible heuristic that allows $h \le h^*$
	- $h_1$ is the number of students wrong tile positions in the puzzle
	- $h_2$ is the sum of manhattan distances of tiles to their correct positions
	- clearly $h_2$ is better bc it gives us more. information on unique states
	- $h_2$ dominates $h_1$ s.t. $\forall n\quad h_1(n)\le h_2(n)$
### Effective Branching Factor
- $b^*$ s.t. the number of nodes is given by $$N=\sum_{i=0}^d {b^*}^i$$
- used to measure the performance of a heuristic
- for 8-sliding tile, h1 is misplaced tile count, h2 is manhattan distance![[Pasted image 20240214115006.png]]
## Choosing a Heuristic
- simplify the problem by removing constraints, and optimize on the relaxed game
- this will ensure admissibility since the relaxed game can be solved in fewer state transitions than the actual game
- e.g. sliding tile ![[Pasted image 20240214115230.png]]
- absolver - find rules of the game and relax constraints
- e.g. remove tiles in a sliding puzzle, remove branches in the traveling salesman, etc. and use A* to find the best heuristic to the solution of this relaxed problem ![[Pasted image 20240214115248.png]]
- use this as the heuristic of the next complicated problem
### Pattern databaes
- store a database of each pattern of relaxed games and the heuristics
- choose the heuristic that dominates by taking max over the pattern databases
#### Disjoint Pattern Database
- use 2 disjoint relaxed problems and find their heuristics
- sum these 2 heuristics to get $h'$ e.g. in the sliding puzzle, $h_{1234}$ is the heuristic found by A* on the sliding puzzle with 5,6,7,8 made anonymous and vice versa for $h_{5678}$
- summing these 2 without changes is inadmissible bc they share moves (i.e. moving 1234 also implicitly moves 5678)
- so we then adjust the subproblem to make the cost of moving the unmasked tiles positive but moving masked tiles/actions to 0 cost
- then sum both s.t. $h' = h_{1234}+h_{5678}$ s.t. $$h'\le h^*$$
### Landmarks
- use landmark points, e.g., major cities on a path
- then work on optimality between 2 landmarks and landmark to goal ![[Pasted image 20240214115615.png]]
#### Shortcuts
- adding shortcuts for known states can make landmark heuristics more efficient using a **differential heuristic** ![[Pasted image 20240214115705.png]]

## Variations - Memory Bounded search
### Reference counting
- keep a reference counts table for each node
- remove a node from the table when all ways to reach it have been explored
### Beam search
- reduce frontier by keeping only $k$-top nodes with best $f$ scores
- this makes it suboptimal and incomplete but choose good k to make memory efficient
- "a single beam/chord of the goal contour"
### IDA* - Iterative deepening A*
- same benefits as IDS - but re-visits prev nodes many times
- cutoff here is not 1 but instead $f$-cost $g(n)+h(n)$
- there can be no more than $C*$ iterations bc we find the goal in path cost $C*$
### Bidirectional A*
- no guarantee of optimality bc heuristics are different for forward and backward search depending on goal (final or initial state)
- path cost is ![[Pasted image 20240214110649.png]]
- using 2 frontier priority queues, we can make an evaluation function: ![[Pasted image 20240214110838.png]]
	- ![[Pasted image 20240214110900.png]]
- **front-to-end** uses heuristics to estimate forward and backward travel costs to start/end
- **front-to-front** tries to estimate distance to other frontier
- usually not better than standard A*

## Informed Search Comparison
![[Pasted image 20240214104852.png]]