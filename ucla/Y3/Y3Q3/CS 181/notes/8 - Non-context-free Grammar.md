---
area: ucla
quarter: Y3Q1
created: 2024-05-13 14:09
updated: Monday 13th May 2024 14:09:46
course: CS 181
parent: CS 181

title: 8 - Non-context-free Grammar

layout: note

---
## Pumping Lemma for CFL
- similar to one for reg languages but:
$$w=uvxyz$$
- where
$$|vxy|\le p$$
$$|v|+|y|\neq 0$$
$$uv^ixy^iz\in L \space\forall i\in\mathbb N$$
### Proof with CFG
- given a CFG, we define the branching factor $b$ as the max length of the RHS in $R$ (considering vars + terminals)
- sps. $p=b^{|V|+1}$
- $s$ is a string in $L$ s.t. $|s|\ge p$
- so we an create a parse tree for the minimal parse tree of the longest path, here we can now visually represent pumping up and down ![[Pasted image 20240513143348.png]]
## Examples
- ![[Pasted image 20240513151851.png]]