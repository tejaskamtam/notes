### Tejas Kamtam, 305749402
---

## Question 1.1
Given DFAs $M_1$ and $M_2$: ![[Pasted image 20240404174507.png]]
### Part a
What are the start states?
- $q_1$ for $M_1$
- $q_1$ for $M_2$
### Part b
What are the set of accept states?
- $\{q_2\}$ for $M_1$
- $\{q_1,q_4\}$ for $M_2$
### Part c
What are the state sequences for the input `aabb`?
- $q_1\to q_2\to q_3\to q_1\to q_1$ for $M_1$
- $q_1\to q_1\to q_1\to q_2\to q_4$ for $M_2$
### Part d
Do the DFA accept the string `aabb`?
- $M_1$ does NOT accept
- $M_2$ accepts
### Part e
Do the DFA accept the string $\varepsilon$?
- $M_1$ does NOT accept
- $M_2$ accepts

## Question 1.6
Give the state diagrams of **DFAs** that recognize the following languages over the alphabet $\{0,1\}$
### Part b
$L(M)=\{w\space:\space w\text{ contains at least three 1s}\}$
![[Pasted image 20240404184413.png]]
### Part d
$L(M)=\{w=w_1w_2...w_n\space:\space|w|\ge 3\space\land\space w_3=0\}$
![[Pasted image 20240404185107.png]]
### Part e
$L(M)=\{w=w_1w_2...w_n\space:\space\big(w_1=0\land |w|\text{ is odd}\big)\lor\big(w_1=1\land|w|\text{ is even}\big)\}$
![[Pasted image 20240404185659.png]]
### Part f
$L(M)=\{w\space:\space w\text{ doesn't contain 110}\}$
![[Pasted image 20240404190327.png]]
### Part h
$L(M)=\{w\space:\space w\text{ is any string except 11 and 111}\}$
![[Pasted image 20240404190901.png]]
### Part j
$L(M)=\{w\space:\space w\text{ contains at least two 0s and at most one 1}\}$
![[Pasted image 20240404201013.png]]
### Part k
$L(M)=\{\varepsilon, 0\}$
![[Pasted image 20240404191807.png]]
### Part n
$L(M)=\{0,1\}^+$ (Kleene plus)
![[Pasted image 20240404192017.png]]