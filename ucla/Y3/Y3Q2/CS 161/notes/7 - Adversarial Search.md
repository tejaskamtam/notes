---
area: ucla
quarter: Y3Q1
created: 2024-02-07 14:03
updated: Wednesday 7th February 2024 14:03:52
course: CS 161
📕 courses:
parent: CS 161

title: 7 - Adversarial Search

layout: note

---
## Minimax Search
- we assume perfect information
### Setup
![[Pasted image 20240214122557.png]]
![[Pasted image 20240214122604.png]]
![[Pasted image 20240214122614.png]]
- try to minimize opponent utility or maximize our utility or vv min our cost and max their cost
- thus, treat each player as the min or max player
- tic-tac-toe here is zero sum and min max refer to the children selection
- the min max labels define the utility of the current state, so e.g. if the last state the max player could get either 14,3,7 the min player moves first and will take the minimum utility, 3, then the max player must select the max from that layer
![[Pasted image 20240214122726.png]]
- utility is calculated at the last state and propagates sum upward after calculating last move
- the resulting utility is always the same regardless of sore assigned so long as the preference of utility remains the same, i.e., loss is worse than draw is worse than win
### Algo
- expand all nodes to find possible moves
- calculate utility at end
- then propagate upward depending on whether player is taking min or max of its children
- thus the value at the root is the minimax choice
- e.g., tic-tac-toe is zero sum bc min will always take -1 when possible or 0 and max will take 0 when possible
![[Pasted image 20240214123011.png]]
![[Pasted image 20240214123021.png]]
### DFS
- minimax uses DFS to search the tree to find the best possible utility
- $O(b^m)$ time complexity and $O(bm)$ space complexity
## Multi-Player Minimax
- model moves as vector of choices for each player
- each player takes max for its value depending on whos turn it is to (move greedily) ![[Pasted image 20240214123435.png]]
- however this prevents the overall best outcome (5,4,5) if everyone agreed to make a suboptimal choice at local selection to make the best global selection
- this game is entirely adversarial, but contractual agreement (alliance) would allow the game to be the best benefit for all
## Optimization
- number of states is exponential and must expand all to construct minimax tree
- but we can mitigate with pruning without expanding every child
### Alpha Beta Pruning
- evaluate min ($\beta$) and max ($\alpha$) by looking at only nodes that help, we arbitrarily choose direction of search (in this case left to right)
- choices are independent
![[Pasted image 20240214123820.png]]
![[Pasted image 20240214124129.png]]
- better time complexity at $b^{m/2}$ if the order of checking is optimal
- random is still good at average $b^{3m/4}$
#### IDS
- iterate depth by 1 until optimal choice is made at that depth level
- mostly used if game tree is much too large to search for alpha-beta pruning
#### Move selection
- killer move heuristic to find "brilliant" moves not captured by cost
- Type A strat - consider all for a shallow depth (wide but shallow)
- Type B strat - ignore moves that look bad (deep but narrow)
### Feature Selection
- make evaluation functions that estimate the true cost to eval faster
- use a subset of features that explain a state as a weighted linear function of the features
- e.g., if moves are chosen with a prob dist, we can find the expectation and choose that
### Cutoff
- sometimes we cant find a solution fast enough, so we set a cutoff depth
- this cutoff is true for terminal states but free to choose another value for intermediary state depths
- we can also determine this by considering quiescent moves - moves that would largely swing eval (e.g., capturing queen)
### Horizon effect
- effective utility may be thee same in 2 game states but the actual state may be in a much better pos than the other e.g., white can capture queen in one but still same score in both
	- ![[Pasted image 20240207152228.png]]
- or postponing game end may increase the chance of draw from loss baed on the utility which is hard to determine
	- can postpone loss by sac-ing pawns ![[Pasted image 20240207152302.png]]
### Lookup
- use pattern databases
### Monte Carlo Tree Search
- stochastic simulations add optimal moves to the tree ![[Pasted image 20240207152444.png]]

## Expectiminimax
- for chance games, include chance nodes for which their immediate children probs sum to 1
![[Pasted image 20240214125812.png]]
### Move selection
- we choose the max/min over the expected value of each chance node
![[Pasted image 20240214125935.png]]
