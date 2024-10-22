---
area: ucla
quarter: Y3Q1
created: 2024-02-12 14:25
updated: Monday 12th February 2024 14:25:13
course: CS 161
📕 courses:
parent: CS 161

title: 8 - Monte Carlo Tree Search

layout: note

---
## Algo
- random simulation
- start with root node of value $N$
- each child node has two characteristics $n_i$ and a value $v_i$
![[Pasted image 20240214125421.png]]
### Steps
![[Pasted image 20240214125445.png]]

### Upper Confidence Bound (UCB)
- select node with highest UCB
$$UCB=v_i+c\sqrt{\frac{\ln N}{n_i}}\quad\text{s.t.}\quad v_i=\frac{w_i}{n_i}$$
![[Pasted image 20240212143024.png]]
### Generalization
- taking to the limit of max children nodes tells us MCTS will approach the full minimax tree
### Probabilistic Nodes
- introduction of chance nodes between max and min players
- each nodes $n_i$ is a probability between its sister nodes
- total probability law applies between a subtree such that probs of all sister nodes under the same parent add up to 1
- the value we assign is the expectation (weighted sum)
- probs can be assigned using some model, independence assumption is not required, probs can be conditional