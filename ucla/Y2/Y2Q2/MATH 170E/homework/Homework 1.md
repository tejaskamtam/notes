---
course: MATH 170E
area: ucla
created: 2023-01-19
updated: 2023-02-02T21:54
📕 courses:
  - "[[Math 170E- Probability Theory]]"
tags: math
---
# Math 170E: Homework 1

---

## Problem 1

Let $A$﻿ be the event that $3$﻿ is observed on the first roll of a six-sided die. Let $B$﻿ be the vent that $≥ 2$﻿ rolls are required to observe a $3$﻿. Assume each side of the die has a probability of $1/6$﻿

### Solutions

1. $\mathbb P(A)$﻿
    
    We are considering only 1 trial, so we can define $\Omega=\{1,2,3,4,5,6\}$﻿ as the possible sides of a six-sided die. Because the probability of an event can be defined as $\mathbb P(A)=\frac{|A|}{|\Omega|}$﻿, where $|\Omega|=6$﻿ and $|A|=1$﻿ as the die roll only produced one “output”. Thus,
    
    $\mathbb P(A)=\frac{1}{6}$
    
    This follows the given assumption that the probability of each side appearing is $1/6$﻿
    
      
    
2. $\mathbb P(B)$﻿
    
    Because $B$﻿ is defined as the probability that **at least two rolls** are required to observe a $3.$﻿We can analyze that the first roll, then, must not be a $3$﻿. Because we found that previously that the probability of rolling a $3$﻿ is $1/6$﻿, we can use the definition of the complement to find that $\mathbb P(A’)=1-\mathbb P(A)=5/6$﻿ i.e. that the probability of not rolling a $3$﻿ on the first (or any) roll is $5/6$﻿. Thus,
    
    $\mathbb P(B)=\mathbb P(A') = \frac 5 6$
    
3. $\mathbb P(A\cup B)$﻿
    
    We can use the **inclusion-exclusion principle** to define $\mathbb P(A\cup B)=\mathbb P(A)+\mathbb P(B) - \mathbb P(A\cap B)$﻿. We have the values for the probabilities of events $A$﻿ and $B$﻿ from the previous steps. Because the events $A$﻿ and $B$﻿ are dependent ($B$﻿ cannot be true if $A$﻿ is true i.e. wether or not it takes $\ge 2$﻿ rolls to observe a $3$﻿ **depends** on whether or not $A$﻿ is true and a $3$﻿ is indeed observed on the first roll), we observe $A\cap B=\empty$﻿ for which we know by the unitary property $\mathbb P(\empty)=0$﻿. Thus,
    
    $\mathbb P(A\cup B)=\mathbb P(A)+\mathbb P(B) - \mathbb P(A\cap B)=\frac 1 6+\frac 5 6 - 0=1$
    
      
    

  

## Problem

(a) 100% of customers insure $\ge 1$﻿ car

(b) 85% of customers insure $\gt 1$﻿ car

(c) 23% of customers insure a sports car

(d) 17% of customers insure $\gt 1$﻿ car, including a sports car

What is the probability that a customer selected at random insures exactly one car and is not a sports car?

### Solution

Firstly, we can observe that (b) tells us that 85% of customers insure more than 1 car and (a) tells us that all customers insure at least 1 car. Therefor, we can deduce that

$(a)-(b)=15\%\tag1$

insure only 1 car. However, we don’t know if whether or not the car in question is a sports car.  
Similarly, (c) identifies to us how many customers insure a sports car and (d) reveals how many insure more than 1 car where one of those is a sports car. So, like before, we can deduce that

$(c)-(d)=6\%\tag2$

of customers insure only 1 car which is indeed a sports car.  
Thus, we can deduce that

$(1)-(2)=15\%-6\%=9\%$

of customers insure only car which is not a sports car. Or equivalently:  

$\mathbb P(\text{random customer insures only one car and is not a sports car})=0.09$

## Problem 3

$A$﻿ and $B$﻿ are independent events with $\mathbb P(A)=0.7$﻿ and $\mathbb P(B)=0.2$﻿

### Solutions

1. $\mathbb P(A\cap B)$﻿  
    Because events $A,B$﻿ are independent to each other, the definition of independence allows us to compute the intersection using the multiplication principle such that
    
    $\mathbb P(A\cap B)=\mathbb P(A)\cdot\mathbb P(B)=0.7\cdot0.2\\\mathbb P(A\cap B)=0.14$
    
      
    
2. $\mathbb P(A\cup B)$﻿  
    The inclusion-exclusion principle as used in problem 1 can be used here to compute the union such that
    
    $\mathbb P(A\cup B)=\mathbb P(A)+\mathbb P(B)-\mathbb P(A\cap B)=0.7+0.2-0.14\\\mathbb P(A\cup B)=0.76$
    
      
    
3. $\mathbb P(A’\cup B’)$﻿
    
    As before, we can use the inclusion-exclusion principle to define the probability as
    
    $\mathbb P(A'\cup B')=\mathbb P(A')+\mathbb P(B')-\mathbb P(A'\cap B')\tag1$
    
    Because the events are independent, the definition of independence states that the probability of the intersection of the complements of independent events is equal to the product of the probabilities of the complement of each event, i.e.
    
    $\mathbb P(A'\cap B')=\mathbb P(A')\cdot\mathbb P(B')\tag2$
    
    Now, we know from the definition of the complement that their probabilities can be determined as so:
    
    $\mathbb P(A')=1-\mathbb P(A)=1-0.7=0.3\\$
    
    Next, we can use $(2)$﻿ and $(3)$﻿ to compute the intersection:
    
    $\mathbb P(A'\cap B')=0.3\cdot0.8=0.24\tag4$
    
    Finally, we can use $(1)$﻿, $(3)$﻿, and $(4)$﻿ to compute the union of the complements as so:
    
    $\mathbb P(A'\cup B')=0.3+0.8-0.24=0.86$
    

## Problem 4

Given $\mathbb P(A)=0.8,\space\mathbb P(B)=0.5,\space\mathbb P(A\cup B)=0.9$﻿. Are $A,B$﻿ independent events? Why?

### Solution

The definition of independent events suggests that 2 events are independent if the probability of their union is the product of their individual probabilities. We can check this by calculating the union of events $A,B$﻿ using the inclusion-exclusion principle:

$\mathbb P(A\cup B)=0.8+0.5-\mathbb P(A\cap B)=0.9$

Rearranging this expression tells us that the events are independent if and only if:

$\mathbb P(A\cap B)=0.4$

We can check if this is true by considering the situation that the events are indeed independent, for which wee can use the definition of independence to derive:

$\mathbb P(A\cap B)=\mathbb P(A)\cdot\mathbb P(B)=0.8\cdot 0.5=0.4$

Because this calculation does confirm our previous supposition, we have proved that the events $A,B$﻿ are in fact independent by example.

## Problem 5

$A,B,C$﻿ are mutually independent, show the following events (in the toggle list) are also independent.

### Solutions

We can first observe that for the given statement to be true, that is, for $A,B,C$﻿ to be mutually independent, the following expressions must also be true by the definition of independence:

$\mathbb P(A\cap B)=\mathbb P(A)\cdot\mathbb P(B)\tag1$

$\mathbb P(B\cap C)=\mathbb P(B)\cdot\mathbb P(C)\tag2$

$\mathbb P(A\cap C)=\mathbb P(A)\cdot\mathbb P(C)\tag3$

$\mathbb P(A\cap B\cap C)=\mathbb P(A)\cdot\mathbb P(B)\cdot\mathbb P(C)\tag4$

- $A,(B\cap C)$﻿
    
    To show these two events re independent, we must show that the following is true:
    
    $\mathbb P(A\cap(B\cap C))=\mathbb P(A)\cdot\mathbb P(B\cap C)\tag{i}$
    
    The associative property of the intersection states that:
    
    $A\cap(B\cap C)=(A\cap B)\cap C)=A\cap B\cap C\tag{ii}$
    
    We can use (ii) and (2) to express (i) as so:
    
    $\mathbb P(A\cap(B\cap C))=\mathbb P(A\cap B\cap C)\\$
    
    $\implies \mathbb P(A\cap(B\cap C))=\mathbb P(A)\cdot\mathbb P(B)\cdot\mathbb P(C)\tag{iii}$
    
    This statement, (iii) shows that we can express (i) using (4) which has been shown to denote their events are independent. Therefore, by transitivity, $A$﻿ and $(B\cap C)$﻿ are independent events.
    
- $A,(B\cup C)$﻿
    
    To show these events are independent, we must show the following is true:
    
    $\mathbb P(A\cap(B\cup C))=\mathbb P(A)\cdot\mathbb P(B\cup C)\tag{iv}$
    
    We can begin by using the distributive property of the intersection over the union to express the intersection as:
    
    $A\cap(B\cup C)=(A\cap B)\cup(A\cap C)\tag{v}$
    
    We can now use the inclusion-exclusion principle on (v) to rewrite the problem expression (iv) as
    
    $\mathbb P(A\cap(B\cup C))=\mathbb P(A\cap B)+\mathbb P(A\cap C)-\mathbb P((A\cap B)\cap(A\cap C))$
    
    We can simplify this expression using (1), (3), the distributive property of the intersection, and the idempotent property of the intersection (i.e. $A\cap A=A$﻿) and later (4) to show:
    
    $\mathbb P(A\cap(B\cup C))=\mathbb P(A)\mathbb P(B)+\mathbb P(A)\mathbb P(C)-\mathbb P(A\cap B\cap C)\\$
    
    We can use a little algebra to factor out the probability of $A$﻿ to rewrite the equation as
    
    $\mathbb P(A\cap(B\cup C))=\mathbb P(A)\cdot(\mathbb P(B)+\mathbb P(C)-\mathbb P(B)\mathbb P(C))$
    
    Now, we can use the inverted inclusion-exclusion principle to work backwards to express the previous equation as
    
    $\mathbb P(A\cap(B\cup C))=\mathbb P(A)\cdot\mathbb P(B\cup C)$
    
    This derived equation is precisely the equation we wanted to show. Thus, the events $A$﻿ and $B\cup C$﻿ are independent as proven above.
    
- $A',(B\cap C’)$﻿
    
    As before, to show these events are independent, we must show the following is true
    
    $\mathbb P(A'\cap (B\cap C'))=\mathbb P(A')\cdot \mathbb P(B\cap C')\tag{vi}$
    
    We can use the distributive property of the union to express the independence probability as
    
    $A'\cap(B\cap C')=(A'\cap B)\cap(A'\cap C')\tag{vii}$
    
    From this we can observe certain characteristics of the intersection (visualizing them as a venn diagram) to substitute into the equation:
    
    $A'\cap(B\cap C')=(B\setminus A\cap B)\cap(1\setminus A\cup B)$
    
- $A',B',C'$﻿

## Problem 6

(a) If events $A,B$﻿ are mutually exclusive (disjoint), are they always independent?

(b) Can events $A,B$﻿ ever be independent if $A\sube B$﻿?

### Solutions

1. No. The definition of independent events simply states that two events are independent if the probability of their intersection is equal to the product of their individual probabilities, i.e.
    
    $\mathbb P(A\cap B)=\mathbb P(A)\cdot\mathbb P(B)$
    
    Mutually exclusive events can be characterized by the property of their intersection being the empty set and thus the probability of their intersection being 0, i.e.
    
    $A\cap B=\empty\implies\mathbb P(A\cap B)=0$
    
    This allows use to observe certain mathematical principles. Based on these definitions, we can deduce that two mutually exclusive events can be independent if and only if the probability of at least one of the events is 0, that is
    
    $\mathbb P(A)=0\space\lor\space\mathbb P(B)=0\space\lor\space\mathbb P(A)=\mathbb P(B)=0$
    
2. Yes. Consider the situation in which the event space of event $A$﻿ is entirely contained contained within the event space of event $B$﻿ i.e. $A\sub B$﻿. From this we can observe that the intersection of the two event spaces must be $A$﻿ and thus the probability of the intersection is the probability of $A$﻿, that is to say
    
    $A\cap B=A\implies\mathbb P(A\cap B)=\mathbb P(A)$
    
    Then, the definition of independent events suggests that events $A,B$﻿ in this situation would be independent if and only if the probability of $B$﻿ is 1 OR the probability of $A$﻿ is 0 i.e. only when:
    
    $\mathbb P(B)=1\iff B=\Omega\quad\lor\quad\mathbb P(A)=0\iff A=\empty$
    

## Problem7

Let $A_j$﻿ be the event that player $j\in\{1,2,3\}$﻿ makes the field goal. Assume that each event is mutually independent to each other event. Let

$\mathbb P(A_1)=0.5\tag1$

$\mathbb P(A_2)=0.7\tag2$

$\mathbb P(A_3)=0.6\tag3$

Find the following:

### Solutions

1. Probability that exactly one player makes the field goal (denoted as event $a$﻿)
    
    We can approach this problem intuitively by considering a decision tree. We can interpret this problem with 3 independent situations
    
    > player $j=1$﻿ makes it (AND other 2 miss) OR player $j=2$﻿ makes it (AND other 2 miss) OR player $j=3$﻿ makes it (AND the other 2 miss).
    
    We can define the probability that a player misses using the definition of the complement such that the event the player misses is the complement of the event the player makes the field goal i.e.
    
    $A'=1-A\implies\mathbb P(A')=1-\mathbb P(A)$
    
    $\tag{i}\mathbb P(A_1')=1-0.5=0.5\\$
    
    We can use (i) to create a probability expression using the addition and multiplication principles (an OR event suggests an addition of events, an AND event suggests a multiplication of vents) as so:
    
    $\mathbb P(a)=\mathbb P(A_1)\mathbb P(A_2')\mathbb P(A_3')+\mathbb P(A_1')\mathbb P(A_2)\mathbb P(A_3')+\mathbb P(A_1')\mathbb P(A_2')\mathbb P(A_3)\\$
    
    Therefore we can calculate this probability using (ii) as
    
    $\mathbb P(a)=0.06+0.14+0.09=0.29$
    
2. Probability that exactly two players make the field goal (denoted as event $b$﻿)
    
    We can again approach this problem intuitively as the probability that exactly 1 person misses. For this we can agin make make a Sum of Products using the addition and multiplication principles and the definition of the complement (i) to create a probability expression as
    
    > player $j=1$﻿ misses (AND the other 2 make) OR player $j=2$﻿ misses (AND the other 2 make) OR player $j=3$﻿ misses (AND the other 2 make)
    
    $\mathbb P(b)=\mathbb P(A_1')\mathbb P(A_2)\mathbb P(A_3)+\mathbb P(A_1)\mathbb P(A_2')\mathbb P(A_3)+\mathbb P(A_1)\mathbb P(A_2)\mathbb P(A_3')\\$
    
    This gives us the the probability in question as
    
    $\mathbb P(b)=0.21+0.09+0.14=0.44$
    

## Problem 8

Let $A,B,C\sube\Omega$﻿ be vents. Show:

$\mathbb P(A\cup B\cup C)=\mathbb P(A)+\mathbb P(B)+\mathbb P(C)-\mathbb P(A\cap B)-\mathbb P(A\cap C)-\mathbb P(B\cap C)+\mathbb P(A\cap B\cap C)$

### Solution

We can begin by taking this problem in parts by utilizing the associative property of the union to express:

$\mathbb P(A\cup B\cup C)=\mathbb P((A\cup B)\cup C)$

Taking it from here, we can apply the inclusion-exclusion principle and distributive and commutative principles of the intersection on the union to show

$\mathbb P(A\cup B\cup C)=\mathbb P(A\cup B)+\mathbb P(C)-\mathbb P((A\cup B)\cap C)\\$

We can now apply the inclusion-exclusion principle again to rewrite the expression as

$\mathbb P(A\cup B\cup C)=\mathbb P(A)+\mathbb P(B)+\mathbb P(C)-\mathbb P(A\cap B)-\mathbb P((A\cap C)\cup(B\cap C))$

Applying the inclusion-exclusion principle again gives us

$\mathbb P(A\cup B\cup C)=\mathbb P(A)+\mathbb P(B)+\mathbb P(C)-\mathbb P(A\cap B)-[\mathbb P(A\cap C)+\mathbb P(B\cap C)-\mathbb P((A\cap C)\cap (B\cap C))]$

Applying the idempotent principle of the intersection and distributing the negative gives us

$\mathbb P(A\cup B\cup C)=\mathbb P(A)+\mathbb P(B)+\mathbb P(C)-\mathbb P(A\cap B)-\mathbb P(A\cap C)-\mathbb P(B\cap C)+\mathbb P(A\cap B\cap C)$

This is precisely the statement we have sought to prove $\text{QED}$﻿.

## Problem 9

Let $A,B$﻿ be independent events. Prove $A’,B’$﻿ are also independent events.

### Solution

We can first consider the definition of the complement to note the following expressions

$A'=1\setminus A\implies\mathbb P(A')=1-\mathbb P(A)\\$

The definition of independent events also tells us that the following must be true

$\mathbb P(A\cap B)=\mathbb P(A)\cdot\mathbb P(B)\tag{ii}$

Now, to show that the events’ complements are also independent, we must show

$\mathbb P(A'\cap B')=\mathbb P(A')\cdot\mathbb P(B')\tag{iii}$

Here, we can use De Morgan’s law and the definition of the complement to express the intersection of the complements as

$\mathbb P(A'\cap B')=\mathbb P((A\cup B)')=1-\mathbb P(A\cup B)$

Now, we can use the inclusion-exclusion principle and distribute the negative to express

$\mathbb P(A'\cap B')=1-\mathbb P(A)-\mathbb P(B)+\mathbb P(A\cap B)$

Next, we can use (ii) to substitute into the expression to result in

$\mathbb P(A'\cap B')=1-\mathbb P(A)-\mathbb P(B)+\mathbb P(A)\cdot\mathbb P(B)$

Now, we can factor the terms to express:

$\mathbb P(A'\cap B')=(1-\mathbb P(A))\cdot(1-\mathbb P(B))$

Finally, we can use (i) to arrive at

$\mathbb P(A'\cap B')=\mathbb P(A')\cdot\mathbb P(B')$

This is precisely the equation we wanted to show, therefore $A’,B’$﻿ are indeed independent $\text{QED}$﻿.

## Problem 10

From the word problem, we can extrapolate certain specifics for which we can express as so:

Let $|\Omega|=100$﻿ be the population of students in the school

Let $|S|=28$﻿ be the students in the Spanish class

Let $|F|=26$﻿ be the students in the French class

Let $|G|=16$﻿ be the students in the German class

Let $|S\cap F|=12$﻿ be the students in both Spanish and French

Let $|S\cap G|=4$﻿ be the students in both Spanish and German

Let $|F\cap G|=6$﻿ be the students in both French and German

Let $|S\cap F\cap G|=2$﻿ be the students taking all 3 classes

Let us note (tag) the previous given values as $(i)$﻿

Find the following:

### Solutions

- (a) The probability that a randomly chosen student is in none of the classes (denoted event $a$﻿)
    
    We can approach this problem intuitively and observe that the number of students in any language class can be expressed by the sum of the cardinality of each of the language class “events” as so:
    
    $|S|+|F|+|G|=28+26+16=70$
    
    Then, we can express the probability that a student chosen at random is in NOT in any of the 3 classes as the complement of the event that they are (for which we can use the definition of the complement as defined many times before):
    
    $\mathbb P(a)=1-\frac{|S|+|F|+|G|}{|\Omega|}=1-\frac{70}{100}=0.3\tag{i}$
    
- (b) The probability that a randomly chosen student is in exactly one of the classes (denoted event $b$﻿)
    
    We can approach this problem intuitively as well by considering the probability that the student is
    
    > In Spanish (AND not in any other) OR in French (AND not in any other) OR in German (AND not in any other)
    
    We can use the addition and multiplication principles to write a probability expression such that OR suggests a sum of probabilities and AND suggests a product of probabilities like so:
    
    $\mathbb P(b)=\mathbb P(S)\mathbb P(F')\mathbb P(G')+\mathbb P(S')\mathbb P(F)\mathbb P(G')+\mathbb P(S)\mathbb P(F')\mathbb P(G)$
    
    Now, we can use the definition of the complement to find the values for this expression
    
    $\mathbb P(b)=(.28)(1-.26)(1-.16)+(1-.28)(.26)(1-.16)+(1-.28)(1-.26)(.16)$
    
    Evaluating this expression gives
    
    $\mathbb P(b)=0.416544\approx0.42$
    
- (c) The probability that of 2 randomly chosen students $\ge 1$﻿ is taking a language class (denoted event $c$﻿)
    
    We can again approach this intuitively and consider a decision tree with 2 possibilities:
    
    > 1 student is in a class AND the other student is not OR both students are in a class
    
    We can use the addition and multiplication principles as before and (i) to express:
    
    $\mathbb P(c)=(0.7)(0.3)+(0.7)(0.7)$
    
    Evaluating this expression give us
    
    $\mathbb P(c)=0.7$