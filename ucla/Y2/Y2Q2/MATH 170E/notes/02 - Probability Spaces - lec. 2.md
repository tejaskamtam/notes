---
course: MATH 170E
area: ucla
created: 2023-01-11T12:04
updated: 2023-02-01T11:18
📕 courses:
  - "[[Math 170E- Probability Theory]]"
tags: math
---
# Definitions

---

- $\mathbb P \equiv P$﻿

# Big Ideas

---

## Probability Space

- a probability pace is a triple ($\Omega,F,\mathbb{P}$﻿)
- $\Omega$﻿ is a nonempty set called the state space
    - can be infinite or finite
- $F$﻿ is a collection of all subsets of $\Omega$﻿ $\implies \varnothing,\Omega\in F$﻿
- $A\in \mathscr F$﻿ is known as an event and is a set of the option space
    - each event $A$﻿ must be disjoint from any other event $A$﻿

### Probability Measure (@import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\mathbb P$﻿)

- $\mathbb P:F\longmapsto [0,1]$﻿ is the probability measure
    - $\mathbb P ≥ 0$﻿
    - $\mathbb P(A)=\frac{|A|}{|\Omega|}$﻿
    - $\mathbb P(\Omega)=1$﻿
    - $\mathbb P(\varnothing)=0$﻿
    - $P(B\setminus A)=P(B)-P(A) \iff A\sube B$﻿
        - $P(A)\le P(B)$﻿

### Countable Additivity

- the process of finding probability of events by considering the union of disjoint (mutually exclusive) events from the option space
- $A=A_1\cup…\cup A_n$﻿
    - $|A|=|A_1|+…+|A_n|$﻿
- $\mathbb P(A)=\mathbb P(A_1)+…+\mathbb P(A_n)$﻿

### Complement

- $A$﻿ is an event s.t. $A’$﻿ is another event
- s.t. $P(A’)=1-P(A)$﻿

### Inclusion-Exclusion Principle

- for events $A,B$﻿
- $P(A\cup B)=P(A)+P(B)-P(A\cap B)$﻿

# Resources

---

![[/Lecture_2_Post.pdf|Lecture_2_Post.pdf]]

📌

**SUMMARY  
**