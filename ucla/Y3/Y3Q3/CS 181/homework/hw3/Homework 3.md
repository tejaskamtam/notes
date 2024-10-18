### Tejas Kamtam, 305749402
---

## Question 1
Swapping accept and reject states in an NFA $M$ that recognizes language $L$ does not necessarily recognize the complement of the language, $\overline L$. Here is a counterexample: 
Let the NFA $M_1$ that recognizes $L=\{11\}$ over $\Sigma=\{0,1\}$ is given as: ![[Pasted image 20240419193817.png]]
However, swapping accept and reject states gives the following state machine $M_2$: ![[Pasted image 20240419193911.png]]
However, the language of this model is $L(M_2)=\{\varepsilon,1\}$ whereas the complement of the language is $\overline L=\Sigma^*\setminus {11}$ which includes the string $0$ which is rejected by $M_2$.

## Question 1.32
A language $L$ is regular if a DFA (or, equivalently, an NFA) recognizes it. Regular languages are closed under reversal (a regular operation). Consider the following DFA that recognizes the reverse of the given language i.e. $B^R$:
![[Pasted image 20240423145524.png]]

Thus, $B^R$ is a regular language. By the property of closure under reversal, we know the language $(B^R)^R$ must also be regular as we've shown $B^R$ is regular. Since $(B^R)^R=B$ we also know that the language $B$ is regular. QED

## Question 1.40
Show that regular languages are closed under the following operations.
### Part a
$$NOPREFIX(A)=\{w\in A\space:\space \text{no proper prefix of $w$ is a member of A}\}$$
Consider a string $w=xy$ s.t. $w\notin NOPREFIX(A)$ if it is accepted by the following NFA:
![[Pasted image 20240423183156.png]]
where the dashed transition indicates a path between the states at each of its endpoints, and the label for that path corresponds to the appropriate substring of $w$
We also know that regular languages are closed under the complement. Thus, since we've shown an NFA that recognizes $\overline{NOPREFIX(A)}$, taking the complement of this language also results in a regular language, i.e. $NOPREFIX(A)$ is regular by the closure property of complement.

### Part b
$$NOEXTEND(A)=\{w\in A\space:\space w\text{ is not the proper prefix of any string in } A\}$$
Similar to the previous part, consider strings $w,z\in \Sigma^+$ . Then $w\notin NOEXTEND(A)$ if the following NFA accepts it:
![[Pasted image 20240423190306.png]]
I.e., this NFA recognizes the language $\overline{NOEXTEND(A)}$, thus, this language is regular. Thus, by closure under complement $\overline{\overline{NOEXTEND(A)}}=NOEXTEND(A)$ is regular. 

## Question 1.41
Although not explicitly stated in the question, the question entails that language $A,B$ are regular. Thus, there is some automaton that recognizes $A$ and $B$ (could be the same or different automata) Suppose those automata are identified as the boxes below; then the following automata recognize the perfect shuffle of $A,B$:
![[Pasted image 20240423192119.png]]


## Question 1.69 
Let $\Sigma = \{0,1\}$. Let $$WW_k = \{ww| w \in\Sigma^* \text{ and $w$ is of length }k\}$$
### Part a
Show that for each $k$, no DFA can recognize $WW_k$ with fewer than $2^k$ states
### Part b
Describe a much smaller NFA for $\overline{WW_k}$ , the complement of $WW_k$