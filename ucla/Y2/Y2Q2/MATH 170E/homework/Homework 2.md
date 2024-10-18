---
course: MATH 170E
area: ucla
created: 2023-01-25T22:57
updated: 2023-01-27T23:42
📕 courses:
  - "[[Math 170E- Probability Theory]]"
tags: math
---
# Math 170E: Homework 2

---

## Problem 1

Let $A$﻿ be a set of $n$﻿ elements

### (a) How many non-empty subsets of @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$A$﻿

For this situation we can observe that selecting the number of subsets of $A$﻿ of some arbitrary number $r$﻿ elements can be represented as a combination: $\binom n r$﻿. However, we would like ALL non-empty subsets → this means we want all subsets $1 \le r \le n$﻿ which can be modeled by the sum:

$\sum_{r=1}^n\binom n r$

From here, we can make our life easier by representing this sum using the Binomial Theorem where $x,y=1$﻿ and subtracting 1 for the subset that represents the empty set, such that

$\sum_{r=1}^n\binom n r=\sum_{r=0}^n\binom n r(1)^r(1)^{n-r}-1=(1+1)^n-1$

Therefore, by the Binomial Theorem, we get a number of non-empty subsets of

$\sum_{r=1}^n\binom n r=2^n-1$

### (b) How many non-empty subsets of size @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$1\le k\le n$﻿

For this problem, we can use the same approach as before, but noting that for this example we have a defined number of elements per subset equal to $k$﻿ which we can simply represent as the combination of $k$﻿ elements from $n$﻿ elements

$\binom n k = \frac{n!}{(n-k)!\cdot k!}$

## Problem 2

Use the binomial theorem to show:

### (a) @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\sum_{r=0}^n \binom n r = 2^n$﻿

The straightforward approach is to represent the given equation using the binomial theorem. We can do so in this situation by utilizing the identity property of multiplication and the exponent like so:

$\sum_{r=0}^n\binom n r=\sum_{r=0}^n\binom n r \cdot(1)^r\cdot(1)^{n-r}=(1+1)^n=2^n$

We can do the above by the definition of the identity principle which states that any term multiplied by 1 is the term itself and 1 raised to any power is 1.

Because this matches both thee LHS and RHS to the given equation, we have proved its existence $\text{QED}$﻿.

### (b) @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\sum_{r=0}^n \binom n r (-1)^r=0$﻿

We can approach this the same way as we approached part (a) however this time using the identity principle of $-1$﻿. That is, we can express the given equation using the binomial theorem as so

$\sum_{r=0}^n \binom n r (-1)^r=\sum_{r=0}^n\binom n r\cdot (-1)^r\cdot (1)^{n-r}=(-1+1)^n=0$

We can do the above as 1 raised to any power is 1 and any term multiplied by 1 is the term itself. Because we have matched the LHS and RHS of the given equation, we have proved its existence $\text{QED}$﻿.

## Problem 3

Prove the multinomial theorem by mans of the binomial theorem given by

$(x_1+...+x_r)^n=\sum\binom n {n_1,...,n_r}x_1^{n_1}\cdots x_r^{n_r}\\\space\\$

### Solution

We can approach this problem by considering the characteristics of the binomial coefficient in the binomial theorem, and everything fall in line. The properties of the binomial coefficient allow us to make the following logical equivalence

$\binom{n}{n_1,n_2}=\frac{n!}{n_1!\cdot n_2!}=\frac{n!}{n_1!\cdot(n-n_1)!}=\binom n {n_1}\\$

As this happens to be true by the properties of the binomial coefficient, we can express the binomial theorem as

$\sum\binom n {n_1}x_1^{n_1} x_2^{n-n_1}=\sum\binom n {n_1,n_2}x_1^{n_1}x_2^{n_2}=(x_1+x_2)^n$

We can now logically extend this expression using sums and prods:

$\sum\binom{n}{n_1,...,n_r}x_1^{n_1}\cdots x_r^{n_r}=(x_1+...+x_r)^n$

This is precisely the multinomial theorem $\text{QED}$﻿.

## Problem 4

In a state lottery, you win if any permutation of 4 integers 0-9 are drawn (that match the lottery integers). Give the probability of winning for each situation:

### (a) @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$6,7,8,9$﻿

We can first calculate the sample space of this event as all possible ordered selections of 4 digits as

$|\Omega| = n^r={10}^4\tag1$

Next we can assign the event $a$﻿ as the event that any permutation of $6,7,8,9$﻿ is a winning lottery ticket. We can calculate the cardinality of this event using a permutation (rearrangement of the 4 digits)

$|a|=\binom n {n_6,..., n_9}=\frac{n!}{n_6!\cdots n_9!}=4!=24$

Therefore we can calculate the probability as

$\mathbb P(a)=\frac{|a|}{|\Omega|}=\frac{24}{10^4}=0.0024$

### (b) @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$6,7,8,8$﻿

As before, we can calculate the event $b$﻿ as the number of ways to rearrange the drawn digits and we can assign this the event that we have drawn the winning numbers

$|b|=\binom n {n_6,...,n_8}=\frac{n!}{n_6!\cdots n_8!}=\frac{4!}{2!}=12$

Therefore we can calculate this event’s probability using (1) as

$\mathbb P(b)=\frac{12}{10^4}=0.0012$

### (c) @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$7,7,8,8$﻿

Exactly as before, we can define the event $c$﻿ as the event that we have drawn the winning numbers and compute its cardinality as the number of ways to rearrange the drawn digits

$|c|=\frac{n!}{n_7!\cdot n_8!}=\frac{4!}{2!\cdot 2!}=6$

Therefore the probability using (1) is

$\mathbb P(c)=\frac{6}{10^4}=0.0006$

### (d) @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$7,8,8,8$﻿

Exactly as before, we can define the event $d$﻿ as the event that we have drawn the winning numbers and compute its cardinality as the number of ways to rearrange the drawn digits

$|d|=\frac{n!}{n_7!\cdot n_8!}=\frac{4!}{3!}=4$

Therefore the probability using (1) is

$\mathbb P(d)=\frac{4}{10^4}=0.0004$

## Problem 5

How many ways to rearrange the letters in “ABRACADABRA”

### Solution

The approach here is direct by means of using combinatorics in the situation of “sequences of $t$﻿ types” i.e. Anagrams. We can express the proposition as so

$\binom n {n_1,...,n_t}=\frac{n!}{n_1!\cdots n_t!}$

This proposition suggests that the combination of orderings of $n$﻿ elements with $n_t$﻿ elements of type $t$﻿ is given by the factorial expression. We can substitute this with our data:

$\frac{n!}{n_A!\cdot n_B!\cdot n_C!\cdot n_D!\cdot n_R!}=\frac{11!}{5!\cdot2!\cdot2!}=83,160$

This gives us precisely $83,160$﻿ possible rearrangements of the string “ABRACADABRA”

## Problem 6

How many ways can you give 10 cookies to 4 friends if each friend gets at least 1 cookie?

### Solution

We can consider that because this event is an unordered selection oof cookies without replacement of cookies, we can use a combination. However, because each friend must get at least 1 cookie, we can simply remove these first 4 cookies from thee pool of possible cookies left too choose from, therefore our combination can be written as so

$\binom{10-4}{4}=\binom 6 4=\frac{6!}{4!\cdot(6-4)!}=\frac{720}{48}=15$

Thus, there are $15$﻿ ways to give 10 cookies to 4 friends where each friend gets at least 1 cookie.

## Problem 7

Find the probability of the following poker hands

### (a) Four of a kind

Firstly we can define our sample space as all combinations of 5 card hands from a deck of 52 cards with a combination such that

$|\Omega|=\binom {52} 5=2,598,960\tag1$

We can define the event $a$﻿ as the event that a four of a kind is dealt. We can find the cardinality of this event by selecting specific cards that make up all possible combinations of a four of a kind. To do so we must choose one rank from 13 for our four of a kind AND 1 rank from the remaining 12 for our fifth card AND one suit of 4 for the fifth card. This can be expressed as the product of combinations:

$|a|=\binom {13} 1\cdot\binom {12} 1\cdot\binom 4 1=624$

We can now express the probability f the event $a$﻿ as

$\mathbb P(a)=\frac{|a|}{|\Omega|}=\frac{624}{2,598,960}\approx 0.00024$

### (b) Full house

As before, we can define the event $b$﻿ as the event of being dealt a full house. We can find the cardinality of this event as all possible combinations of possible full house hands. For this, we must choose the 2 ranks for the hand AND the rank for the three-of-a-kind (thsi implies the rank for the two pair as well) AND the suits for the three of a kind AND the suit for the two pair which we can express as

$|b|=\binom{13}2\cdot\binom21\cdot\binom43\cdot\binom42=3,744$

Now we can find the probability of the event $b$﻿ using (1) as

$\mathbb P(b)=\frac{3,744}{2,598,960}\approx 0.00144$

### (c) Three of a kind

As before, we can define the event $c$﻿ as the event of being dealt a three of a kind. We can find the cardinality of this event as all possible combinations of possible three of a kind hands. To do so, we must choose 1 rank for the three of a kind AND the 2 ranks from 12 remaining for the other 2 cards in the hand AND the suit for the three of a kind AND the suits for the other cards in the hand independently such that

$|c|=\binom{13}1\cdot\binom{12}2\cdot\binom43\cdot2\binom41=54,912$

We can now find the probability using (1) as

$\mathbb P(c)=\frac{54,912}{2,598,960}\approx0.02113$

### (d) Two pair

As before, we can define the event $d$﻿ as the event of being dealt a two pair. We can find the cardinality of this event as all possible combinations of possible two pair hands. To do so, we must choose the rank for the two sets of pairs AND the rank of the remaining card from 11 remaining ranks AND the two independent suits of each pair AND the suit of the remaining card which can be expressed as

$|d|=\binom{13}2\cdot\binom{11}1\cdot2\binom42\cdot\binom41=123,552$

Now we can find the probability using (1) as

$\mathbb P(d)=\frac{123,552}{2,598,960}\approx0.04754$

### (e) One pair

As before, we can define the event $e$﻿ as the event of being dealt a pair. We can find the cardinality of this event as all possible combinations of possible one pair hands. To do so, we must choose the rank of the pair AND the rank for each of the remaining cards AND the suit for the pair AND the suits for the remaining cards in the hand (independently) such that

$|e|=\binom{13}1\cdot\binom{12}3\cdot\binom42\cdot3\binom41=1,098,240$

This gives us the probability, using (1), as

$\mathbb P(e)=\frac{1,098,240}{2,598,960}\approx0.42257$

## Problem 8

Suppose that fruit flies have eye color alleles $R$﻿=red, $W$﻿=white and red eyes are recessive. What is the probability a white eyed fruit fly has 2 $W$﻿ alleles.

### Solution

We can use conditional probability to solve for the probability of the event that a fruit fly has 2 $W$﻿ alleles GIVEN that it has white eyes. First, we can define thee sample space as all possible combinations of alleles such that

$|\Omega|=4\quad\text{and}\quad \omega:\text{2 W alleles present}$

We know from the fact that red eyes are recessive that the probability of white eyes, denoted as the event $W$﻿ can be found as

$\mathbb P(W)=\frac{3}{|\Omega|}=\frac 3 4=0.75$

and the probability of 2 $W$﻿ alleles present, i.e. $\omega$﻿, can be derived from the sample space

$\mathbb P(\omega)=\frac 1 4=0.25$

Now we can define the probability of the event by the conditional probability theorem:

$\mathbb P(\omega\space|\space W)=\frac{\mathbb P(\omega\cap W)}{\mathbb P(W)}$

We can now infer that having 2 alleles for white eyes is a subset of the event of having white eyes so we can expand the intersection

$\omega\sub W\implies \mathbb P(\omega\cap W)=\mathbb P(\omega)$

Now we can substitute the above equation to find our conditional probability

$\mathbb P(\omega\space|\space W)=\frac{\mathbb P(\omega)}{\mathbb P(W)}=\frac{0.25}{0.75}=\frac 1 3 =0.\overline{33}$

## Problem 9

An urn contains four colored balls: two orange and two blue. Two balls are selected at random without replacement, and you are told that at least one of them is orange.What is the probability that the other ball is also orange?

### Solution

Although we can approach this problem using conditional probabilities, we can use intuition to observe that the initial probability of selecting an orange ball is $\frac24=\frac12=0.5$﻿, but given that one of the balls is indeed orange → we know that now there are 3 possible balls left (as there is no replacement) to choose from and only one of those is orange. So, we can find the probability of the event as

$\mathbb P=\frac13=0.\overline{33}$

## Problem 10

An urn contains four balls numbered 1 through 4. The balls are selected one at a time without replacement. $A$﻿ match occurs if the ball numbered m is the $m$﻿th ball selected.Let the event $A_i$﻿ denote a match on the $i$﻿th draw, i = 1, 2, 3, 4. Show the following

### (a) @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\mathbb P(A_i)=\frac{3!}{4!}\quad\forall i\in\{1,...,4\}$﻿

We can approach this problem using combinatorics n place of conditional probability. If we consider that the event $A_i$﻿ is the event that from all permutations of the possible drawings of the 4 balls, we leave those balls for which $m=i$﻿ in place. So, we can define our sample space as all permutations of the 4 balls such that

$|\Omega|=P(4,4)=4!\tag1$

Then, suppose that we do select the correct ball in the correct position, then all possible permutations of the remaining balls can be defined as our event $A_i$﻿ because this is equivalent to the event that we do get our one ball in the correct position. Therefore,

$|A_i|=P(3,3)=3!$

The probability of the event $A_i$﻿ is then proved as

$\mathbb P(A_i)=\frac{|A_i|}{|\Omega|}=\frac{3!}{4!}$

### (b) @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\mathbb P(A_i\cap A_j)=\frac{2!}{4!}\impliedby i\neq j$﻿

Using the same approach as before, we can observe that the event described by the intersection can also be described as the inverse: the event that 2 balls are correctly selected in their respective positions implies the same event in which the other 2 balls are selected (the order f which can does not matter but is necessary). Observing this, we can find the cardinality of the intersection as all possible permutations of the remaining 2 balls which can be described as

$|A_i\cap A_j|=P(2,2)=\frac{2!}{0!}=2!$

Now, using (1) we can find the probability as

$\mathbb P(A_i\cap A_j)=\frac{|A_i\cap A_j|}{|\Omega|}=\frac{2!}{4!}$

This is precisely the probability we wanted to show $\text{QED}$﻿.

### (c) @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\mathbb P(A_1\cup…\cup A_4)=1-\frac{1}{2!}+\frac1{3!}-\frac{1}{4!}$﻿

We can see that the probability of getting at last 1 ball in the correct spot can be modeled by the complement of the vent that 3 balls are correctly chosen. Using the probability shown in part (b), we can extend this to 3 balls such that

$\mathbb P(A_i\cap A_j\cap A_k)=\frac{1!}{4!}=\frac1{4!}\impliedby i\neq j\neq k\tag2$

We can also note for the previous probability, if we select the first 3 balls correctly, then we must undoubtedly select the last ball correctly as well as it is the only remaining, therefore

$\mathbb P(A_i\cap A_j\cap A_k)=\mathbb P(A_1\cap A_2\cap A_2\cap A_4)$

Now, we can use the inclusion-exclusion principle to expand the given equation

$\mathbb P(A_1\cup A_2\cup A_3\cup A_4)=\mathbb P(A_1)+\mathbb P(A_2)+\mathbb P(A_3)+\mathbb P(A_4)-\mathbb P(A_1\cap A_2)-\mathbb P(A_1\cap A_3)-\mathbb P(A_1\cap A_4)-\mathbb P(A_2\cap A_3)-\mathbb P(A_2\cap A_4)-\mathbb P(A_3\cap A_4)+\mathbb P(A_1\cap A_2\cap A_3)+\mathbb P(A_1\cap A_2\cap A_4)+\mathbb P(A_2\cap A_3\cap A_4)+\mathbb P(A_1\cap A_3\cap A_4)-\mathbb P(A_1\cap A_2\cap A_3\cap A_4)$

Because many of these terms in the sum are equivalent to others i.e. $A_i=A_j$﻿ and so on, we can simplify to

$\mathbb P(A_1\cup A_2\cup A_3\cup A_4)=4\cdot\mathbb P(A_i)-6\cdot\mathbb P(A_i\cap A_j)-4\cdot\mathbb P(A_i\cap A_j\cap A_k)-\mathbb P(A_1\cap A_2\cap A_3\cap A_4)$

Using our previously stated propositions, we can find our given (problem) equation

$\mathbb P(A_1\cup A_2\cup A_3\cup A_4)=4\cdot\frac{3!}{4!}-6\cdot\frac{2!}{4!}+4\cdot\frac{1}{4!}-\frac{1}{4!}\\$

### (d) @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\mathbb P(A_1\cup…\cup A_n)=\sum_{n=1}\frac{(-1)^{n+1}}{n!}$﻿

We could use induction to prove this; however, based on the previous part (c), we can extend the equation to the given by logical inference of applying the inclusion-exclusion principle for multiple terms. Now, to find the limit of the probability as $n\to\infin$﻿

The limit to infinity causes the later terms’ numerator to oscillate between -1 and 1 while the denominator approaches infinity. This results in the sum approaching the following

$\mathbb P(A_1\cup...\cup A_n)=\lim_{n\to\infin}\sum_{n=1}\frac{(-1)^{n+1}}{n!}=1-\frac1e$

## Problem 11

An urn contains eight red and seven blue balls. A second urn contains an unknown number of red balls and nine blue balls. A ball is drawn from each urn at random, and the probability of getting two balls of the same color is 151/300. How many red balls are in the second urn?

### Solution

To find the number of red balls in the second urn $x$﻿, we need to find the terms used to calculate the probability that two of the same balls are selected. To do so, we can use. decision tree:

> select a red ball from urns 1 AND 2 OR select a blue ball from urns 1 AND 2

We can calculate this probability as

$\mathbb P=\frac{8}{15}\cdot\frac{x}{x+9}+\frac{7}{15}\cdot\frac{9}{x+9}=\frac{151}{300}$

Now, we can find $x$﻿ as

$x=11\implies\text{11 red balls in urn 2}$

## Problem 12

Suppose that an urn contains 8 red balls ($R$﻿) and 4 white balls ($W$﻿). We draw 2 balls from the urn without replacement. We can denote the event of drawing the first ball as $a$﻿ and the second ball as $b$﻿. Find the following

### (a) Equal likelihood: @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\mathbb P(a=R\cap b=R)$﻿

We can find this probability using conceptual conditional probability. The probability that $a$﻿ is red is the number of red balls out of the total number of balls, such that

$\mathbb P(a=R)=\frac8{12}$

Now we can consider that not replacing the balls results in a smaller sample space for $b$﻿ such that

$\mathbb P(b=R)=\frac7{11}$

Now, we can observe that these two events are independent relative to the sample spaces they are defined over, so we can find the intersection as

$\mathbb P(a=R\cap b=R)=\mathbb P(a=R)\cdot\mathbb P(b=R)$

So, we can find the probability of the event that both balls are red as

$\mathbb P(a=R\cap b=R)==\frac{8}{12}\cdot\frac7{11}=\frac{14}{33}=0.\overline{42}$

### (b) Unequal Likelihood:

Now suppose that the balls have different weights, with each red ball having weight $r$﻿ and each white ball having weight $w$﻿. Suppose that the probability that a given ball in the urn is the next one selected is its weight divided by the sum of the weights of all balls currently in the urn. Now what is the probability that both balls are red?

  

Although this scenario is quite different, we can apply the same principle of changing variables of probabilities as part (a). But first, we can express the given information about the new probabilities as

$\mathbb P(a=R)=\frac{8r}{8r+4w}$

Now using the changing variables principle as before:

$\mathbb P(b=R)=\frac{7r}{7r+4w}$

Since these events are still independent respective to the sample spaces they are defined over, we can express the probability now as

$\mathbb P(a=R\cap b=R)=\frac{8r}{8r+4w}\cdot\frac{7r}{7r+4w}$

## Problem 13

At a certain stage of a criminal investigation, the inspector in charge is 60% convinced of the guilt of a certain suspect. Suppose, however, that a new piece of evidence which shows that the criminal has a certain characteristic (such as left-handedness, baldness, or brown hair) is uncovered. If 20% of the population possesses this characteristic, how certain of the guilt of the suspect should the inspector now be if it turns out that the suspect has the characteristic? You may suppose that the probability of the suspect having the characteristic if they are, in fact, innocent is equal to 0.2, the proportion of the population possessing the characteristic.

### Solution

We can first define the event that the suspect is guilty as $G$﻿ and innocent as $I$﻿ and the event that the suspect possesses the characteristic as $C$﻿, then we are trying to find the probability that the suspect is guilty GIVEN that the suspect possesses the characteristic. Now we can define these initial parameters using given information

$\mathbb P(G)=0.6\\$

To make our following steps easier, we can use the principle of the complement (since $G$﻿ and $I$﻿ are complements of each other) of conditional probabilities to express

$\mathbb P(I|C)=1-\mathbb P(G|C)$

We can use Baye’s theorem to set up our problem as

$\mathbb P(G|C)=1-\mathbb P(I|C)=1-\frac{\mathbb P(C|I)\cdot\mathbb P(I)}{\mathbb P(C)}$

We can now use our given probabilities from (1):

$\mathbb P(G|C)=1-\frac{0.2\cdot0.4}{0.2}=1-0.4=0.6$

## Problem 14

There are two bags. Bag A contains 1 red ball and 9 blue balls. Bag B contains 10 blue balls. You choose a ball at random from bag A and place it into bag B. You then choose a ball at random from bag B and place it into bag A. If after this process the red ball is in bag A, what is the probability that it was moved?

### Solution

We can consider that for this problem the only possible way we could have moved the red ball is if we selected the red ball out of the 10 total balls in bag A AND, then, picked the red ball again out of the (now) 11 total balls in bag B. We can express this as

$\mathbb P=\frac{1}{10}\cdot\frac1{11}=\frac{1}{110}=0.0\overline{09}$