### Tejas Kamtam, 305749402
---

## Question 1
Draw NFAs with the specified number of states over $\Sigma=\{0,1\}$
### Part a
$L=\{0\}$ using 2 states
![[Pasted image 20240411171122.png]]
### Part b
Language of all binary strings ending in 00, using 3 states
![[Pasted image 20240411171201.png]]
## Question 2
Draw NFAs for the following
### Part a
binary strings that begin with a 1 and end with a 0, or contain at least three 1s
![[Pasted image 20240411173609.png]]
### Part b
binary strings that contain the substring 1010 or do not contain the substring 110
![[Pasted image 20240412160459.png]]
## Question 3
Let L = {w : w contains an even number of 0s and an odd number of 1s and does not contain the substring 01}. Draw a DFA with five states that recognizes L.
![[Pasted image 20240412194219.png]]
## Question 4
Let L be the language of all strings over {0, 1} that do not contain a pair of 1s that are separated by an odd number of symbols. Draw a DFA with five states that recognizes L.
![[Pasted image 20240413004855.png]]
## Question 5
Let $L_n$ be the language of all binary strings of the form $1_11_2...1_k$ for some $k$ that is a multiple of $n$. For each $n\ge 1$, construct a DFA or NFA that recognizes $L_n$.

I'm not sure this is the solution, but to generalize $L_n$ overall $n$, I think the set of strings of the form $1^*$ Always has a length that is a multiple of some positive integer $n$ thus there exists some language $L_n$ for which this model recognizes, thus it recognizes all forms of $L_n$
![[Pasted image 20240413012236.png]]
## Question 6
Let $D$ be the language of binary strings that contain an equal number of occurrences of the substrings $01$ and $10$. Thus $101 \in D$ because $101$ contains a single $01$ and a single $10$, but $1010$ $\notin D$ because $1010$ contains two $10$s and one $01$. Construct a DFA or NFA for $D$

![[Pasted image 20240413153453.png]]
## Question 7
Convert the following NFA to DFA![[Pasted image 20240413004958.png]]
### Part a
![[Pasted image 20240413005710.png]]
### Part b
![[Pasted image 20240413010733.png]]
