---
area: ucla
quarter: Y3Q1
created: 2024-02-28 15:14
updated: Wednesday 28th February 2024 15:14:47
course: CS 161
📕 courses:
---
## Background
- Monotonicity of logic prevents adaptation of the knowledge base
- so instead of assigning the Model of the world (decision/state) to be binary, we assign some probability
- we still ensure the ontology of the world is the same - each state collapses to some binary value, but we make an epistemological change and assign a probability of the state being true (a superposition of sorts)
- Decision making using probs also uses utility to make maximum expected utility decisions
- we also allow categorical or continuous assignments instead of boolean (similar to just making more booleans that are rainy or not rainy, sunny or not sunny, or windy or not windy all with just 3 categorical representations)
### Kolmogorov's Probability Axioms
1. Probaabilities are non negative
2. Probability of true is 1
3. If two events (statements) are mutually exclusive, then the probability of their disjunction is the sum of their probs $$P(\alpha\lor\beta)=P(\alpha)+P(\beta)$$
- a sentence is equivalent to the disjunction of all its possible worlds in which it holds (its models) $$\alpha\equiv \omega_1\lor...\lor \omega_n$$
- each state represents only 1 world: $$\omega_1=X_1\land\lnot X_2\land...\land\lnot X_n$$
- For mutually exclusive $\omega_i$ $$P(\alpha)=\sum_{\omega\models\alpha}P(\omega)=\sum_{\omega\in M(\alpha)} P(\omega)$$
### Properties
- Complement: $$1=P(\alpha)+P(\lnot\alpha)$$
- Inclusion-Exclusion: $$P(\alpha\lor\beta)=P(\alpha)+P(\beta)-P(\alpha\land\beta)$$
### Conditional probability
if $\alpha$ and $\beta$ are mutually exclusive $$P(\alpha|\beta)=\frac{P(\alpha\land\beta)}{P(\beta)}$$
### Chain Rule of Probability
$$P(x_1,...,x_n)=\prod_i^n P(x_i|x_{1...i-1})$$
e.g. $$P(x_1,x_2,x_3)=P(x_1)P(x_2|x_1)P(x_3|x_1x_2)$$
### Parametrized Forms
- finds both probs at the same time, using a scaling parameter $\alpha$
$$P(cav|tooth) = \alpha P(cav\land tooth)=\alpha\begin{bmatrix}P(tooth,cav)\\ P(tooth,\lnot cav\end{bmatrix}$$
