---
area: ucla
quarter: Y3Q1
created: 2024-01-10 14:14
updated: Wednesday 10th January 2024 14:14:00
course: CS 161
📕 courses:
---
## General Search Problems
### Types of Problems
- 8-puzzle (sliding numbered pieces in a grid to be ordered)
- rubiks cube
- missionaries and cannibals (moving across the river)
### General Structure
- Initial state
- final state
- actions
- transition/successors
- cost for actions
### Task
- find set of actions to move from initial state to goal state
- usually with lowest cost overall cost of actions
### Process
- consider all possible moves at every state
- consider consequential moves
## 8-Puzzle Formulation
### Problem
- grid 3x3 with blocks numbered 1 through 8
- initial state: randomized order
	- ![[Pasted image 20240110143016.png]]
- goal state: some ordering of the blocks
- actions: slide blocks up/down left/right
### Simplifying actions
- instead of consider all possible number blocks AND directions
- we can just look at which number to move bc only 1 open blank square
- BUT, instead we can just look at where to swap the blank to to adjacent blocks
## Uninformed search observations
- states are atomic - no internal structure, we just observe states as some random internal state identified by a pointer/code/hash
- states are discrete - each state is unique and distinguishable by value from other states
- no percepts - we cannot observe state transitions as we perform actions (i.e. we solve the rubiks cube blindfolded just knowing the initial and final states)
- deterministic transitions - no unintended consequences or possibilities of errors e.g., UB from valid moves
- choice of action states is important
	- move tile x, UDLR
	- move tile
	- move blank UDLR
	- move blank
- actions may not be applicable to all states - transition to OOB state e.g., game over, destroyed, corrupt, etc.

## Search Trees
- representation of all states resulting from all possible actions
- each node is the state and each edge is the action e.g. D for blank down
- redundant states can be identified and ignored in drawing search trees - note identifying when this happens can be difficult in other problems
- the solution is the set of actions that lead from initial state to end state, i.e. tree search
- we might have infinite repeating states or infinite unique states - not in the solution
- NOTE: __search space__ is the set of all possible unique states within 1 action of another state in the set
### Observations
- avoid repeated states
- cost here is measured as length of the path
- difficulty of problem measured via problems
	- number of unique states
	- branching factor, e.g. 3x3 puzzle has at most factor of 4
	- solution depth
- some problems may become unsolvable as difficulty increases so algo's should look at average cost to solve
- e.g. 8-puzzle is NP-complete, thus a hugely large grid can be solved in the same time iff P=NP (which so far is not true)
## Missionaries and Cannibals
## 8-queens
### Machine
- you have chess board an want to place 8 queens such that no queen is attacking another
- initial state: empty board
- state space: all possible placements of 0<=n<=8 queens
- action/transition space: placing a queen
- goal state: 8 queens on board not attacking
### Optimization
- this setup has 64! nodes in the decision tree
- we can constrict the action space by limiting actions to only those that are valid moves but this is still large
- now we can also avoid redundancy in permutations by working row by row to limit the branching factor
- this bring it down to 2057 possibilities

## Crypt-arithmetic
### Problem
- we are given a sum of words, we must asssign a digit to each character to make the sum correct
- ![[Pasted image 20240110153349.png]]
### Iterative solution
- assgn each digit to a letter iteratively and branch so each level has 10 branches
### Swap solution
- randomly assign, then swap while meeting constraints

## Knut's Problem
### Problem
- initial: some number: 4
- final: some number: 5
- actions: factorial, sqrt, floor
### Conjecture
- there exists a solution for all numbers to all numbers
- state space is infinite


# State Formulations
## Incremental State Formulation
- incrementally adding elements to a state at each branch
- e.g. adding 1 queen each time
## Complete State Formulation
- starting with the state full and making actions that permute the arrangement
- e.g. starting with a chess board of 8 queens (valid) and permuting 1 queen at a time (validly)
