---
area: ucla
quarter: Y3Q1
created: 2024-01-31 14:47
updated: Wednesday 31st January 2024 14:47:10
course: CS 161
📕 courses:
---
## Intuition
- path to goal sometimes does not matter, only the solution
	- n-queens, rubiks cube, TSP, etc.
- do in-place modifications to the current state, thus const memory
- objective is usually an optimizable function
### Complete state vs Incremental State Formulation
- e.g., for n-queens, incrementally placing a queen at a time and we're stuck sicne we can no longer change things
- instead start with all queens placed then continue changing things
## Hill Climb Search
- inverse gradient (either max neg grad or min pos grad i.e. travel to the top of the hill or bottom of the valley) - here we move to highest valued position
- start with complete state formulation with loss/hill values
	- ![[Pasted image 20240131150640.png]]
- make moves and update loss by optimizing to largest gradient (or smallest depending on formulation)
- i.e., move in direction of steepest ascent
### Stochastic hill climb
- choose uphill moves at random, probs vary based on gradient of the move direction
- converges slower but may lead to better maxima
#### First choice hill climb
- stochastic but generates successor states of one state randomly until one is better than current state and take that
- minimal memory usage
#### Random restart hill climb
- runs a series of hill climbs from random initializations until goal is found
- is complete bc eventually a goal state will be the initial state
- with each search of $p$ prob of success, expected number of restarts is $1/p$
### Restructuring TSP
- start with a tour - random
- objective function is the length of the tour
- either swap 2 cities OR rearrange 2 edges
## Simulated annealing
tries to do a random walk with heuristic towards the goal
- randomly pick a move
- always choose it if its prob is better than current

- else accept it with prob < 1 s.t. the prob decreases exponentially proportional to the worsening of the move (Evaluated by a function $E$)
	- for which the change in value of the state is $\Delta E$
- the prob also decreases as temperature $T$ goes down
	- bad moves allowed to be simulated (chosen with a prob) if T is high and less likely to be chosen as T decreases - akin to creativity of next choice action
	- the prob apporaches Boltzmann distribution if $T$ moves towards 0 slowly
- thus simulate it with probability $e^{\Delta E/T}$
## Beam Search
- track $k$ states, for each of the $k$ generate all children and track only top-$k$ children for each of the $k$ parents
- then only expand the $k$ lowest cost (max likelihood) children across all the tracked nodes ![[Pasted image 20240131151551.png]]
#### Stochastic beam search
- instead of top $k$, select successors with prob relative to successor value
- thus increase diversity of choice
## Genetic Algorithms
- take 2 (parent) states, and combine them to get the child state which may be better
- we define the combination algorithm/objective
- but this is a local choice, we initially start with the population then assign a score (higher the score the better) then apply the pairing function (prob of combination for the next child state)
- the pairing function is the weight of this parents score as a fraction of total population score
- then apply selection function to select features of each parents to combine (a random choice) then generate 2 children with opposite compositions
- the 2 children will have crossover "genes" and detect mutations that create a new fitness (our decided objective)
![[Pasted image 20240131153554.png]]
### Limitations
- very slow, no way to predict the generations required to get a good fit population
- now it is useful for deciding neural net architecture by deciding layers
- never really the solution but discovers features of the solution