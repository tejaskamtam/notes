---
course: MATH 170E
area: ucla
created: 2023-02-07T21:28
updated: 2023-02-10T01:15
📕 courses:
  - "[[Math 170E- Probability Theory]]"
tags: math
---
# Big Ideas

---

## 1

The temperature of the drink requested is an r.v. s.t. $T\sim\text{Bernoulli($p$)}$﻿. The type of hot drink requested is an r.v. $D\sim\text{Bernoulli($q$)}$﻿. And $n$﻿ is the number of customers served that day.

### a) Expected number of iced drinks

The problem statement defines the iced-drink as having a Bernoulli probability $1-p$﻿. We can define an r.v. that describes the number of iced-drinks served by the shop as $I\sim\text{Binomial($n,1-p$)}$﻿. Using the same parameters defined in the problem statement, we know

$\mathbb E[I]=n(1-p)$

### b) PMF of the number of Hot Teas @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$X$﻿

We can say $X$﻿ follows a Binomial distribution with probability $b\in\{0,1\}$﻿ is the probability that a customer orders a hot drink AND it is a tea such that $b=p\cdot q$﻿. So, we can note $X\sim\text{Binomial($n,pq$)}$﻿ Now, we know the PMF of a Binomial r.v. to be

$p_X(x)=\binom{n}{x}(pq)^x(1-pq)^{n-x}$

### c) Expected number of Hot Coffees

As with part (a), the problem statement states hot drinks have probability $p$﻿ and coffees have probability $1-q$﻿, so the combined probability is $p(1-q)$﻿. So, we can define a r.v. for the number of hot coffees ordered as $H\sim\text{Binomial($n,p-pq$)}$﻿. We know the expected value of a Binomial r.v. to be

$\mathbb E[H]=n(p-pq)$

## 2

The probability of a bond forming is $0.2$﻿. Let $X$﻿ be the number of successful reactions out of 25 experiments. We can say $X\sim\text{Binom(25, 0.2)}$﻿

### a) @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\mathbb P(X\le 4)$﻿

We can use the CDF of a binomial r.v. to find this probability as

$\mathbb P(X\le 4)=F_X(4)=\sum_{k=0}^4\binom {25}k 0.2^k(1-0.2)^{25-k}$

### b) @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\mathbb P(X\ge 5)$﻿

We can define this probability in terms of its complement such that

$\mathbb P(X\ge 5)=1-\mathbb P(X\le 5)+\mathbb P(X=5)=1-\mathbb P(X\le 4)$

Thus,

$\mathbb P(X\ge 5)=1-\sum_{k=0}^4\binom {25}k 0.2^k(1-0.2)^{25-k}$

### c) Mean, Variance, and Std. Dev.

We know each of these values for a Binomial r.v. as the following

$\mathbb E[X]=np=5\\$

## 3

A hospital obtains 40% of its flu vaccine from Company A, 50% from Company B, and10% from Company C. From past experience, it is known that 3% of the vials from A are ineffective, 2% from B are ineffective, and 5% from C are ineffective. The hospital tests five vials from each shipment. If at least one of the five is ineffective, find the conditional probability that the whole shipment came from Company C.

### Solution

Let the following be true:

- $A, B, C$﻿ is the event(s) the vaccine came from company A, B, C
- $i$﻿ is the event the vaccine is ineffective

Then, from the problem statement, we are given the following

$\mathbb P(A)=0.4\quad \mathbb P(B)=0.5 \quad \mathbb P(C)=0.1\\$

We can note an r.v. as the number of ineffective vaccines from a selection of 5 as

$X\sim\text{Binom}(5,p)$

where $p$﻿ is the probability the vaccine is ineffective given it came from a specified company

We can use this to note the following using the PMF of a Binomial r.v.

$\mathbb P(X\ge1|A)=1-\mathbb P(X=0|A)=1-\binom 50 0.03^0(1-0.03)^{5-0}\approx0.14127$

$\mathbb P(X\ge 1|B)\approx0.09608\\$

Now, we can use Baye’s theorem and the Law of Total Probability to find

$\mathbb P(C|X\ge1)=\frac{\mathbb P(X\ge1|C)\cdot\mathbb P(C)}{\sum_{k\in\{A,B,C\}}\mathbb P(X\ge 1|k)\cdot\mathbb P(k)}\\\space\\\approx\frac{0.22622\cdot0.1}{0.14127\cdot0.4+0.09608\cdot0.5+0.22622\cdot0.1}\approx0.17789$

## 4

Find the expected value and the variance of the number of times one must throw a die until the outcome 1 has occurred 4 times.

### Solution

We can assume the die is fair such that the probability of rolling a 1 is $p=\frac 16$﻿. Then, the r.v. $X\sim\text{Negative Binomial($4,\frac16$)}$﻿ defines the number of die throws to get the 4th “1”. We know then the expected values and variances for such a distributed r.v.

$\mathbb E[X]=\frac{4}{\frac16}=24\\\space\\$

## 5

For each question on a multiple-choice test, there are five possible answers, of which exactly one is correct. If a student selects answers at random, give the probability that the first question answered correctly is question 4.

### Solution

Because we are trying to find the occurrence of the first success on an $r^{th}$﻿ trial given a probability of success of 1 out of 5, we can model the r.v. $X\sim\text{Geom($\frac15$)}$﻿ as the number of trials until the first success. For this we can find the probability of the success happening on the 4th question using the PMF:

$\mathbb P(X=4)=p_X(4)=\frac15\cdot\left(1-\frac15\right)^{4-1}=\frac{64}{625}=0.1024$

## 6

At all times, a pipe-smoking mathematician carries 2 matchboxes—1 in their left-hand pocket and 1 in their right-hand pocket. Each time they need a match, they are equally likely to take it from either pocket. Consider the moment when the mathematician first discovers that one of their matchboxes is empty. If it is assumed that both match-boxes initially contained N matches, what is the probability that there are exactly k matches, k = 0, 1, ..., N , in the other box?Hint: Let E = {RH matchbox is empty and LH matchbox has k matches}. What doesE occurring mean?

### Solution

Selecting a match from either pocket is equally likely, so the event $E$﻿ occurring is a result of the random variable that defines the choice of matchbox for a matchstick. If $E$﻿ occurs for some $k\le N$﻿ value, it simply means that although the likelihood of selecting matchstick from either pocket is equal, the mathematician just happened to have selected $k$﻿ more matchsticks from his right hand-side matchbox than the LH matchbox which resulted in the LH matchbox having $k$﻿ matches left.

## 7

Suppose that earthquakes occur in the western portion of the United States at a rate of 2 per week. Suppose further that the number of earthquakes that occur in a given week can be well-approximated by a Poisson random variable. Find the probability that at least 3 earthquakes occur during the next 2 weeks.

### Solution

The number of earthquakes that occur per week is a Poisson r.v. with $\lambda=2$﻿ by the given information. Then, the number of earthquakes in $h=2$﻿ time intervals is $h\lambda=4$﻿ such that we can define the Poisson r.v. for # of earthquakes per 2 weeks as $X\sim\text{Poisson(4)}$﻿. So, we can find the probability of at least 3 earthquakes in 2 weeks using the CDF:

$\mathbb P(X\ge3)=1-\mathbb P(X\le 2)=1-e^{-4}\sum_{k=0}^2\frac{4^k}{k!}\approx0.7619$

## 8

The Pegasus Insurance Company has introduced a policy that covers certain forms of personal injury with a standard payment of $100,000. The yearly premium for the policy is $25. On average, 100 claims per year lead to payment. There are more than one million policyholders. What is the probability that more than 15 million dollars will have to be paid out in the space of a year?

### Solution

We can consider that on average the expected number of claims necessary for a payment is 100 such that

$\lambda = \$100,000 - 100\cdot\$25=\$97,500$

Now, we can model the r.v. for the number of claims that result in a payment such that

$X\sim\text{Poisson}(100)$

We are trying to find the probability that more than 15 million in payments is made, which in our situation is analogous to more than 150 claims in the given year. So, we can express our probability in terms of the CDF of a Poisson r.v.

$\mathbb P(X\gt 150)=1-\mathbb P(X\le 150)=1-e^{-100}\sum_{k=0}^{150}\frac{100^k}{k!}\approx 1.2331\times 10^{-6}$