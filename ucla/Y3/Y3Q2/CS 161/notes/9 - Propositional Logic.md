---
area: ucla
quarter: Y3Q1
created: 2024-02-26 14:22
updated: Monday 26th February 2024 14:22:00
course: CS 161
📕 courses:
parent: CS 161

title: 9 - Propositional Logic

layout: note

---
## Basic Concepts
### Syntax
![[Pasted image 20240228140352.png]]
![[Pasted image 20240317222612.png]]
### Validity
- a statement $\alpha$ is valid if $$\forall\omega:\omega\models\alpha$$
- otherwise it is invalid: $$\exists\omega,\omega \not\models\alpha$$
### Models
- a model of a logical statement is the set of worlds for which $\alpha$ holds: $$M(\alpha)=\{\omega:\omega\models\alpha\}$$
### Satisfiability/Consistency
- a statement is UNSAT (inconsistent) if the statement never holds: $$\forall\omega,\omega\not\models\alpha$$
- a statement is SAT if it is not inconsistent $$\exists\omega,\omega\models\alpha$$

## Relationships between Sentences
### Entailment
- a statement entails another statement if: $$\alpha\models\beta\iff M(\alpha)\subseteq M(\beta)$$
### Equivalence
- two statements are equivalent if $$\alpha=\beta\iff M(\alpha)=M(\beta)$$$$M(\alpha)=M(\beta)\iff M(\alpha)\subseteq M(\beta)\space AND\space M(\beta)\subseteq M(\alpha)$$
### Mutual Exclusivity
- two statements are mutually exclusive if $$\nexists\omega,\space\omega\models\alpha\space\land\space \omega\models\beta$$
$$M(\alpha)\not\subseteq M(\beta)\land M(\beta)\not\subseteq M(\alpha)$$
## Reductions
### Validity to SAT
- given $\alpha$ is valid, $\lnot\alpha$ is unsatisfiable
### Entailment to SAT
- 

## Monotonicity of logic
- trying to "add" a statement to aa set of statements in not possible, i.e., the model cannot adapt
- e.g., sps $$KB\models \alpha$$ and we propose some new knowledge base $$KB':=KB\land\beta\implies KB'\models\alpha $$ i.e. $$KB\models\alpha\implies KB\land\beta\models\alpha$$
- adding $\beta$ to the knowledge base did not change our knowledge base, it is still at most the original KB or is smaller
## Normal Forms
### Conjunctive Normal Form (CNF)
- conjunction of disjunction of literals
- disjunction: $\lor$
- conjunction: $\land$
- a clause - a disjunction of literals
- the empty clause is unsatisfiable or False
- e.g., 3-SAT is a CNF
#### Complexity
- CNF SAT is NP-complete
- NF Validity is Linear
	- check if there is an invalid in each clause
### Disjunctive Normal Form (DNF)
- disjunction of conjunction of literals
- a term (conjunctive clause) - a conjunction of literals
- the empty term = True
#### Complexity
- DNF SAT is Linear
	- bc we could jut check if any of the disjunctions (terms) are true
- DNF Validity is co-NP-complete (NP-hard)
	- if we try to convert to CNF using conversion rules, worst case distributing $\lor$ over $\land$ could exponentially blow up the statement
### Horn Clause and Definite Clause
- conjunction of Horn clauses
- a Horn clause - a clause with $\le1$ positive literal
- a definite clause - has only 1 positive literal
### Converting non CNF to CNF
1. Eliminatee all bidirectional implication
	1. e.g. given $B\iff P_1\lor P_2$
	2. $(B\implies P_1\lor P_2)\land(B\impliedby P_1\lor P_2)$
2. Eliminate implication: $\alpha\implies \beta\to \lnot\alpha\lor\beta$
	1. $(\lnot B\lor P_1\lor P_2)\land(B\lor \lnot(P_1\lor P_2))$
3. Apply DeMorgan's
	1. $(\lnot B\lor P_1\lor P_2)\land(B\lor (\lnot P_1\land \lnot P_2))$
4. Distribute $\lor$ over $\land$
	1. $(\lnot B\lor P_1\lor P_2)\land(B\lor \lnot P_1)\land(B\lor P_2)$


## Logical Inference
Determine $$KB\stackrel{?}{\models}\alpha$$
### Enumerate Models
- truth table to infer entailment or satisfiability
- check if the worlds are modeled: $$M(KB)\subseteq M(\alpha)$$
### Deduction
- We can make logical inferences over some ruleset $R$ $$KB\vdash_R \alpha$$
- Modus Ponens - if the above are true, then the bottom is true $$\frac{\alpha,\alpha\implies\beta}{\beta}$$
- E.g., Introduction $$\frac{\alpha,\beta}{\alpha\lor\beta}$$
- Add-Reduction $$\frac{\alpha\land\beta}{\alpha},\frac{\alpha\land\beta}{\beta}$$
- Require knowing the ruleset database
### Refutation 
- if we can prove refutation then we can prove the clause$$KB\models\alpha\iff KB\land\lnot\alpha\models false$$
#### Resolution
- we do so using resolution: if we have $\lnot A\lor A=\emptyset$
- e.g., 
$$KB=\cases{A\lor B\implies C\\A\\C\implies D}$$
$$\alpha=C$$
- we want to observe $$KB\stackrel{?}{\models}\alpha$$
- we can use refutation to get the clauses:
$$KB\land\lnot\alpha=\cases{\lnot A\lor\lnot B\lor C & (1)\\A&(2)\\\lnot C\lor D&(3)\\\lnot C&(4)}$$
- Then we can make some new clause using resolution:
$$KB\land\lnot\alpha=\cases{\lnot A\lor\lnot B\lor C & (1)\\A&(2)\\\lnot C\lor D&(3)\\\lnot C&(4)\\
\lnot B\lor C&(1+2)(5)\\...}$$
- None of the new rule from resolution get to $false$ thus $KB\land\lnot\alpha$ is SAT, thus $$KB\not\models\alpha$$
#### SAT Solver (by CSP) - DPLL
- see if we can find an assignment that makes $KB\land\lnot\alpha$ is SAT, if so then $KB\not\models\alpha$
- else, $KB\land\lnot\alpha$ is UNSAT, thus $KB\models\alpha$
- we can find this by drawing a search tree, s.t.: $$A=f,B=t,C=t\models KB\land\lnot\alpha$$
	- ![[Pasted image 20240228145138.png]]
- we can also check arc consistency at each step by propagating the assigned values without taking the full branch to check for SAT
