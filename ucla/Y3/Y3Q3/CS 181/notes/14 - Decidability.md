---
area: ucla
quarter: Y3Q1
created: 2024-06-05 14:13
updated: Wednesday 5th June 2024 14:13:45
course: CS 181
parent: CS 181

title: 14 - Decidability

layout: note

---
## Is a Language Decidable?
- lang $L$ is decidable $\iff$ $L,\overline L$ are both recognizable
- $\implies$ is trivial
- $\impliedby$ can be proved by running $M(L)$ and $M(\overline L)$ in parallel, and one of them will halt
- Note, $L(M)$ is the language $M$ **recognizes**, but if M happens to decide it as well, it is always equivalent to $L$
## Undecidable
- $L=\{w:w\notin L(M_w)\}$ is not recognizable, and thus not decidable
- $HALT$ lang is recognizable but not decidable
- $\overline{HALT}$ is not recognizable 
### Rice's Theorem
> If some subset of Turing Recognizable languages, $\mathcal C\neq \emptyset$ and $\overline{\mathcal C}\neq\emptyset$ then $L=\{<M>:L(M)\in \mathcal C\}$ is undecidable

![[IMG_5547.jpeg]]


