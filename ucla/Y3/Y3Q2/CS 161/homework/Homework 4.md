# Homework 4

### Tejas Kamtam

### 305749402

---

  

## Question 1

Determine whether the following are valid, UNSAT, or neither.

### Part (a)

$$(Smoke\implies Fire)\implies (\lnot Smoke\implies \lnot Fire)$$

The truth table for the statement is:

  

| Smoke | Fire | $\lnot Smoke$ | $\lnot Fire$ | $(Smoke\implies Fire)$ | $(\lnot Smoke\implies \lnot Fire)$ | $(Smoke\implies Fire)\implies (\lnot Smoke\implies \lnot Fire)$ |

| --- | --- | --- | --- | --- | --- | --- |

| T | T | F | F | T | T | T |

| T | F | F | T | F | T | T |

| F | T | T | F | T | F | **F** |

| F | F | T | T | T | T | T |

  

Thus, the statement is **neither**, it is SAT but not valid.

  

### Part (b)

$$(Smoke\implies Fire)\implies ((Smoke\lor Heat) \implies Fire)$$

The truth table for the statement is:

  

| Smoke | Fire | Heat | $(Smoke\implies Fire)$ | $(Smoke\lor Heat)$ | $((Smoke\lor Heat)\implies Fire)$ | $(Smoke\implies Fire)\implies ((Smoke\lor Heat) \implies Fire)$ |

| --- | --- | --- | --- | --- | --- | --- |

| T | T | T | T | T | T | T |

| T | T | F | T | T | T | T |

| T | F | T | F | T | F | T |

| T | F | F | F | T | F | T |

| F | T | T | T | T | T | T |

| F | T | F | T | F | T | T |

| F | F | T | T | T | F | **F** |

| F | F | F | T | F | T | T |

  

Thus, the statement is **neither**, it is SAT but not valid.

  

### Part (c)

$$((Smoke \land Heat)\implies Fire) \iff ((Smoke\implies Fire)\lor (Heat\implies Fire))$$

The truth table for the statement is:

  

| Smoke | Fire | Heat | $(Smoke\land Heat)$ | $(Smoke\implies Fire)$ | $(Heat\implies Fire)$ | $((Smoke \land Heat)\implies Fire)$ | $((Smoke\implies Fire)\lor (Heat\implies Fire))$ | $((Smoke \land Heat)\implies Fire) \iff ((Smoke\implies Fire)\lor (Heat\implies Fire))$ |

| --- | --- | --- | --- | --- | --- | --- | --- | --- |

| T | T | T | T | T | T | T | T | T |

| T | T | F | F | T | T | T | T | T |

| T | F | T | T | F | F | F | F | T |

| T | F | F | F | F | T | T | T | T |

| F | T | T | F | T | T | T | T | T |

| F | T | F | F | T | T | T | T | T |

| F | F | T | F | T | F | T | T | T |

| F | F | F | F | T | T | T | T | T |

  
  

Thus, the statement is **valid**.

  

## Question 2

Given the sentence:

> If the unicorn is mythical, then it is immortal, but if it is not mythical, then it is mortal and it is a mammal. If the unicorn is either immortal or a mammal, then it is horned. The unicorn is magical if it is horned.

  

### Part (a)

Translate the sentence into propositional logic. Give a knowledge base of propositional statements that represent the sentence.

  

- Let $Mythical$ be the symbol for the statment "The unicorn is mythical".

- Let $Immortal$ be the symbol for the statment "The unicorn is immortal".

- Let $Mortal$ be the symbol for the statment "The unicorn is mortal".

- Let $Mammal$ be the symbol for the statment "The unicorn is a mammal".

- Let $Horned$ be the symbol for the statment "The unicorn is horned".

- Let $Magical$ be the symbol for the statment "The unicorn is magical".

  

The knowledge base of propositional statements that represent the sentence is:

$$KB=\begin{cases}Mythical\implies Immortal & (1)\\ \lnot Mythical\implies (Mortal\land Mammal) & (2) \\ (Immortal\lor Mammal)\implies Horned & (3) \\ Horned\implies Magical & (4)\end{cases}$$

  
  

### Part (b)

Convert the knowledge base to CNF.

  

The CNF of the knowledge base is:

$$KB=\begin{cases}\lnot Mythical\lor Immortal & (1)\\ Mythical\lor Mortal & (2) \\ Mythical\lor Mammal & (3) \\ \lnot Immortal\lor Horned & (4) \\ \lnot Mammal\lor Horned & (5) \\ \lnot Horned\lor Magical & (6)\end{cases}$$

  

### Part (c)

Use resolution to show the following:

#### Subpart (i)

$$KB\models Mythical$$

  

We can use resolution to show that the unicorn is mythical by resolving the CNF of the knowledge base with the negation of the statement. So, we need to show the refutation: $KB\land \lnot Mythical\models \empty$.

  

We begin with:

$$KB\land\lnot Mythical=\begin{cases}\lnot Mythical\lor Immortal & (1)\\ Mythical\lor Mortal & (2) \\ Mythical\lor Mammal & (3) \\ \lnot Immortal\lor Horned & (4) \\ \lnot Mammal\lor Horned & (5) \\ \lnot Horned\lor Magical & (6) \\ \lnot Mythical & (7)\end{cases}$$

  

We can resolve clauses $(7),(2),(3)$ to get:

$$Mortal\tag{8}$$

$$Mammal\tag{9}$$

  

We can resolve clauses $(9),(5)$ to get:

$$Horned\tag{10}$$

  

We can resolve clauses $(1),(2)$ to get:

$$Immortal\lor Mortal\tag{11}$$

  

We can resolve clauses $(10),(6)$ to get:

$$Magical\tag{12}$$

  

We can resolve clauses $(1),(3)$ to get:

$$Immortal\lor Mammal\tag{13}$$

  

We can resolve clauses $(13),(4)$ to get:

$$Mammal\lor Horned\tag{14}$$

  

We've exhausted all further unique resolutions. Thus, we cannot determine the refutation from the knowledge base. So, we can't derive Mychical from the knowledge base.

  

#### Subpart (ii)

$$KB\models Magical \iff KB\land \lnot Magical\models \empty$$

  

We begin with the KB (with some of the previous resolutions):

$$KB=\begin{cases}\lnot Mythical\lor Immortal & (1)\\ Mythical\lor Mortal & (2) \\ Mythical\lor Mammal & (3) \\ \lnot Immortal\lor Horned & (4) \\ \lnot Mammal\lor Horned & (5) \\ \lnot Horned\lor Magical & (6) \\ Immortal\lor Mortal & (7)\\ Immortal\lor Mammal & (8)\\\lnot Magical & (9)\end{cases}$$

  

We can resolve clauses $(9),(6)$ to get:

$$\lnot Horned\tag{10}$$

  

We can resolve clauses $(10),(5)$ to get:

$$\lnot Mammal\tag{11}$$

  

We can resolve clauses $(11),(3)$ to get:

$$\lnot Mythical\tag{12}$$

  

We can resolve clauses $(12),(1)$ to get:

$$Immortal\tag{13}$$

  

We can resolve clauses $(13),(4),(10)$ to get:

$$\empty$$

  

Thus, $KB\models Magical$. So, we an derive Magical from the knowledge base.

  

### Subpart (iii)

$$KB\models Horned$$

  

We begin with the KB (with some of the previous resolutions):

$$KB=\begin{cases}\lnot Mythical\lor Immortal & (1)\\ Mythical\lor Mortal & (2) \\ Mythical\lor Mammal & (3) \\ \lnot Immortal\lor Horned & (4) \\ \lnot Mammal\lor Horned & (5) \\ \lnot Horned\lor Magical & (6) \\ Immortal\lor Mortal & (7)\\ Immortal\lor Mammal & (8)\\\lnot Horned & (9)\end{cases}$$

  

We can resolve clauses $(9),(4),(5)$ to get:

$$\lnot Immortal\tag{10}$$

$$\lnot Mammal\tag{11}$$

  

We can resolve clauses $(10),(11),(7)$ to get:

$$\empty$$

  

Thus, $KB\models Horned$. So, we can derive Horned from the knowledge base.

  
  

## Question 3

> An oil well may be drilled on Mr. Y’s farm in Texas. Based on what has happened to similar farms, we judge the probability of only oil being present to be .5, the probability of only natural gas being present to be .2, and the probability of neither being present to be .3. Oil and gas never occur together. If oil is present, a geological test will give a positive result with probability .9; if natural gas is present, it will give a positive result with probability .3; and if neither are present, the test will be positive with probability .1.

  

Given the test result is positive, what is the probability that oil is present?

  

- Let $O$ be the event that oil is present

- Let $N$ be the event that natural gas is present

- Let $Pos$ be the event that the test result is positive

  

We are given:

- $P(O)=0.5$

- $P(N)=0.2$

- $P(\lnot O\land \lnot N)=0.3$

- $P(O \land N)=0$

- $P(Pos|O)=0.9$

- $P(Pos|N)=0.3$

- $P(Pos|\lnot O\land \lnot N)=0.1$

- Given the test result is positive, we need to find $P(O|Pos)$

  

We can use Bayes' Theorem to find $P(O|Pos)$:

$$P(O|Pos)=\frac{P(Pos|O)P(O)}{P(Pos)}$$

  

We can find $P(Pos)$ using the law of total probability (marginalizing over $O$ and $N$):

$$P(Pos)=P(Pos|O)P(O)+P(Pos|N)P(N)+P(Pos|\lnot O\land \lnot N)P(\lnot O\land \lnot N)$$

  

We can substitute the given values to find:

$$P(Pos)=0.9*0.5+0.3*0.2+0.1*0.3=0.45+0.06+0.03=0.54$$

  

Thus, we can find:

$$P(O|Pos)=\frac{0.9*0.5}{0.54}=\frac{0.45}{0.54}=\frac{5}{6}\approx 0.8333$$

  
  

## Question 4

Given the following Bayesian network:

  

<img src="image.png" alt="drawing" width="500"/>

  
  

### Part (a)

List the Markovian assumptions (topological semantics) for the Bayesian network.

  

- $P(A|B,C,D,E,F,G,H)=P(A)$

- $P(B|...)=P(B)$

- $P(C|...)=P(C|A)$

- $P(D|...)=P(D|A,B)$

- $P(E|...)=P(E|B)$

- $P(F|...)=P(F|C,D)$

- $P(G|...)=P(G|F)$

- $P(H|...)=P(H|E,F)$

  

### Part (b)

Find the Markov blanket for $D$.

  

The Markov blanket for $D$ is the set of nodes that are parents, children, and co-parents of $D$. Thus, the Markov blanket for $D$ is:

$$\{A,B,C,F\}$$

  

### Part (c)

Find the probability distribution $P(A,B,C,D,E,F,G,H)$.

  

We can use the chain rule to find the probability distribution:

$$P(A,B,C,D,E,F,G,H)=P(A)P(B)P(C|A)P(D|A,B)P(E|B)P(F|C,D)P(G|F)P(H|E,F)$$

  

### Part (d)

Derive $P(E,F,G,H)$ from $P(A,B,C,D,E,F,G,H)$.

  

We can marginalize over $A,B,C,D$ to find $P(E,F,G,H)$ using a normalization constant $\alpha$:

$$P(E,F,G,H)=\alpha\sum_{A,B,C,D}P(A,B,C,D,E,F,G,H)$$

Expressing it in terms of CPTs, we get:

$$P(E,F,G,H)=\alpha P(G|F)P(H|E,F)\sum_A P(A) \sum_B P(B)P(E|B)\sum_C P(C|A) \sum_D P(D|A,B)P(F|C,D)$$

Now, expressing it in terms of factors, we get:

$$P(E,F,G,H)=\alpha f_1(G,F)f_2(H,E,F)\sum_A f_3(A) \sum_B f_4(B)f_5(E,B)\sum_C f_6(C,A) \sum_D f_7(D,A,B)f_8(F,C,D)$$

  

### Part (e)

\*Worked with Tony Chen on this subpart

Multiply the factors of $P(D|A,B)$ and $P(E|B)$.

  

$$f_9(D,E,A,B)=f_7(D,A,B)f_5(E,B)$$

Which gives us the truth table:

| A | B | D | E | $f_9(D,E,A,B)$ |

| --- | --- | --- | --- | --- |

| T | T | T | T | 0.05 |

| T | T | T | F | 0.45 |

| T | T | F | T | 0.05 |

| T | T | F | F | 0.45 |

| T | F | T | T | 0.54 |

| T | F | T | F | 0.06 |

| T | F | F | T | 0.36 |

| T | F | F | F | 0.04 |

| F | T | T | T | 0.01 |

| F | T | T | F | 0.09 |

| F | T | F | T | 0.09 |

| F | T | F | F | 0.81 |

| F | F | T | T | 0.72 |

| F | F | T | F | 0.08 |

| F | F | F | T | 0.18 |

| F | F | F | F | 0.02 |

  
  

### Part (f)

Sum out $D$ from $f_9(D,E,A,B)$.

  

$$f_{10}(E,A,B)=\sum_D f_9(D,E,A,B)$$

Which gives us the truth table:

| A | B | E | $f_{10}(E,A,B)$ |

| --- | --- | --- | --- |

| T | T | T | 0.1 |

| T | T | F | 0.9 |

| T | F | T | 0.9 |

| T | F | F | 0.1 |

| F | T | T | 0.1 |

| F | T | F | 0.9 |

| F | F | T | 0.9 |

| F | F | F | 0.1 |

  
  

### Part (g)

Express $P(a,\lnot b, c,d,\lnot e,f,\lnot g,h)$ in terms of the CPTs.

  

We can express $P(a,\lnot b, c,d,\lnot e,f,\lnot g,h)$ in terms of the CPTs as:

$$P(a,\lnot b, c,d,\lnot e,f,\lnot g,h)=P(a)P(\lnot b)P(c|a)P(d,a,\lnot b)P(\lnot e,\lnot b)P(f,c,d)$$

  

This gives us:

$$P(a,\lnot b, c,d,\lnot e,f,\lnot g,h)=0.0036\cdot P(c|a)P(f|c,d)P(\lnot g|f)P(h|\lnot e,f)$$

  

### Part (h)

Compute $P(\lnot a,b)$.

  

We can compute $P(\lnot a,b)$ using the law of total probability:

$$P(\lnot a,b)=P(\lnot a,b,c,d,e,f,g,h)=\sum_{c,d,e,f,g,h}P(\lnot a,b,c,d,e,f,g,h)$$

  

### Part (i)