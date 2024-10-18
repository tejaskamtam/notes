---
course: MATH 170E
area: ucla
created: 2023-02-23T22:54
updated: 2023-02-25T23:34
📕 courses:
  - "[[Math 170E- Probability Theory]]"
tags: math
---
# Big Ideas

---

## 1

$X\sim\mathcal N(6,25)$﻿

### a) @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\mathbb P(6\le X\le 12)$﻿

We can find this probability using the PDF of the Normal distribution as

$\mathbb P(6\le X\le 12)=\int_6^{12}\frac{e^{-\frac{(x-6)^2}{2(25)}}}{\sqrt{2\pi(25)}}\space dx \approx 0.3849$

### b) @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\mathbb P(0\le X\le 8)$﻿

We can use the same method using the PDF as part (a)

$\mathbb P(0\le X\le 8)=\int_0^8\frac{e^{-\frac{(x-6)^2}{2(25)}}}{\sqrt{2\pi(25)}}\space dx \approx 0.5404$

### c) @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\mathbb P(|X-6|\le 10)$﻿

We can first simplify the inequality to

$\mathbb P(|X-6|\le 10) = \mathbb P(-4\le X\le 16)$

Now, we can use the method as before using the PDF

$\mathbb P(-4\le X\le 16)=\int_{-4}^{16}\frac{e^{-\frac{(x-6)^2}{2(25)}}}{\sqrt{2\pi(25)}}\space dx \approx 0.9545$

## 2

$X\sim\mathcal N(\mu,\sigma^2)$﻿

NOTE: Used a online calculator here because the integral was unsolvable on my calculator

### a) show @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\mathbb P(|X-\mu|\gt k\sigma)=2-2\Phi(k)\quad \forall k\gt 0$﻿

First, let us simplify the probability statement to

$\mathbb P(|X-\mu|\gt k\sigma)=\mathbb P(X-\mu>k\sigma)+\mathbb P(X-\mu <-k\sigma)$

Now, we can normalize the values to $Z$﻿ to create a standard normal distribution and find the probability in terms of $Z$﻿

$Z=\frac{X-\mu}{\sigma}\implies X=Z\sigma+\mu\\\space\\$

Now, we can use the definition of the Phi function to describe the probability as the following (which w can do since the probability is now for a standard normal distribution)

$\mathbb P(Z\lt -k)+1-\mathbb P(Z\lt k)=\Phi(-k)+1-\Phi(k)=1-\Phi(k)+1-\Phi(k)\\$

This is exactly what we wanted to show QED.

### b) Verify the 68-95-99.7 rule

Because we have proved the given equality is true, we can use it to first validate the 1 standard deviation probability. But before we calculate, we can first comprehend that thee following probability can be explained as

> The probability that some r.v. (Data) is greater than $k$﻿ standard deviations away from the mean

$\mathbb P(|X-\mu|\gt k\sigma)=2-2\Phi(k)$

Knowing this, we can test the rule for part (b) by finding the following (derived from the definition of the Phi function) for each number of $\sigma$﻿

$1-(2-2\Phi(1))=1-\left(2-2\int_{-\infin}^1 \frac{e^{-t^2/2}}{\sqrt{2\pi}}\right)\approx 0.6827\to68\%$

$1-(2-2\Phi(2))=1-\left(2-2\int_{-\infin}^2 \frac{e^{-t^2/2}}{\sqrt{2\pi}}\right)\approx 0.9545\to95\%$

$1-(2-2\Phi(3))=1-\left(2-2\int_{-\infin}^3 \frac{e^{-t^2/2}}{\sqrt{2\pi}}\right)\approx 0.9973\to99.7\%$

Thus, the distribution follows the rule

## 3

Given:

$Z\sim\mathcal N(0,1)\quad Y=Z^2$﻿

### a) Find the CDF of @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$Y$﻿

We can use the proposition for functions of continuous random variables to state:

$F_Y(y)=\mathbb P(Z^2\le y)\\\therefore\\$

We are generally only concerned with when $y\ge 0$﻿, so we will continue with this is as the condition. Knowing this, we can further simplify the CDF so we can find it in terms of $Z$﻿ s.t.

$F_Y(y)=F_Z(\sqrt y)-F_Z(-\sqrt y)\quad y\ge 0$

Because $Z$﻿ is a standard normal distribution, we can give its CDF in term of the Phi function which will set up the CDF of Y s.t. it will be easier to find the PDF in the next part:

$F_Y(y)=\Phi_Z(\sqrt y)-(1-\Phi_Z(\sqrt y))=2\Phi_Z(\sqrt y)-1\quad y\ge 0$

  

### b) Find PDF of @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$Y$﻿

We can use the CDF from part (a) to find the PDF as we know the PDF is the derivative of the CDF, st.

$f_Y(y)=\frac d{dt}F_Y(y)=\frac d{dt}(2\Phi_Z(\sqrt y)-1)=2\frac{d}{dt}\int_{-\infin}^{\sqrt y}\frac{e^{-t^2/2}}{\sqrt{2\pi}}\space dt$

$f_Y(y)=2\left[\frac{e^{-t^2/2}}{\sqrt{2\pi}}\right]_{-\infin}^{\sqrt y}=\frac {e^{-y/2}\sqrt{2\pi}}{\pi}$

### c) Find @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\Gamma(1/2)$﻿ by comparing (a) with the PDF of @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\chi^2(1)$﻿

We can first find the PDF of the Chi-squared distribution at 1 as the following

$f_{Y_{k=1}}(y)=\frac{y^{1/2-1}e^{-y/2}}{2^{1/2}\Gamma(1/2)}$

Now, we can use a proposition of the Chi-squared distribution which states that when there is a variable $Q=Z^2$﻿ s.t. $Z\sim\mathcal N(0,1)$﻿ then $Q\sim\chi^2_{k=1}$﻿, so we can use this equivalence to set the LHS and RHS as th two different PDFs we now have to solve for Gamma.

$\frac {e^{-y/2}\sqrt{2\pi}}{\pi}=\frac{y^{1/2-1}e^{-y/2}}{2^{1/2}\Gamma(1/2)}\\\therefore\\$

## 4

$X\sim\mathcal N(21.37,0.16)$﻿

### a) @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\mathbb P(X\gt 22.07)$﻿

We can use the PDF of a normal distribution to solve for the probability as:

$\mathbb P(X\gt 22.07)=\int_{22.07}^\infin \frac{e^{-\frac{(x-21.37)^2}{2(0.16)}}}{\sqrt{2\pi(0.16)}}\space dx \approx 0.04006$

  

### b) Sps. 15 selected, find @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\mathbb P(Y\le 2)$﻿ s.t. @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$Y$﻿ is number that are <20.857

We can first find the probability that any one mint $X$﻿ is less than 20.857 grams using the PDF

$\mathbb P(X\lt20.857)=\int_{-\infin}^{20.857} \frac{e^{-\frac{(x-21.37)^2}{2(0.16)}}}{\sqrt{2\pi(0.16)}}\space dx \approx 0.0998$

Now that we have this probability, we can consider that the $Y$﻿ mints of the 15 selected are binomially distributed as the mint $Y_i$﻿ in $0\le i\le 15$﻿ is either $\le 20.857$﻿ or $>20.857$﻿ grams:

$Y\sim\text{Binom}(n=15,p=0.0998)$

So, we can use the CDF of $Y$﻿ to find the probability that $Y\le 2$﻿ as:

$\mathbb P(Y\le 2)=\sum_{k=0}^2 \binom nk (0.0998)^k(1-0.0998)^{15-k}\approx 0.8167$

## 5

### a) Joint PMF

The joint PMF can be expressed as the probability of the two events occurring

$p_{X,Y}(x,y)=\mathbb P(X=x, Y=y)$

Because each die is fair, each has a probability of rolling any $(x,y)\in X,Y$﻿, thus the probability for any $x,y$﻿ is $\frac 14\cdot\frac 14=\frac 1{16}$﻿ i.e.

$p_{X,Y}(x,y)=\mathbb P(X=x, Y=y)=\frac{1}{16}$

### b) Marginal PMFs

We can use the definition of the marginal PDF using the Law of Total Probability s.t.

$p_X(x)=P(X=x)=\sum_{y\in S_y}p_{X,Y}(x,y_j)\\\space\\$

We can see that for any one selection of one die, the roll on the other sums to $4\cdot \frac{1}{16}$﻿ so:

$p_X(x)=P(X=x)=\sum_{y\in S_y}p_{X,Y}(x,y_j)=4/16=\frac14\\\space\\$

### c) Independence?

Because the PMF is equivalent to the product of the marginal PMFs we can deduce that the events are in fact independent (this makes sense since rolling the black die has no effect on the outcome of the red die and vice versa):

$p_{X,Y}(x,y)=\frac 1{16}=p_X(x)p_Y(y)=\frac14\cdot\frac14=\frac1{16}$

Thus, the variables are independent.

## 6

### a) Marginal PMF of @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$X$﻿

We can use the definition of the marginal PMF:

$p_X(x)=P(X=x)=\sum_{y\in S_Y}p_{X,Y}(x,y_j)\\\therefore\\$

### b) Marginal PMF of @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$Y$﻿

We can use the same approach as (a):

$p_Y(y)=P(Y=y)=\sum_{x\in S_X}p_{X,Y}(x_j,y)\\\therefore\\$

  

### c) @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\mathbb P(X\gt Y)$﻿

We can re-write this prob. statement using the joint PMF proposition:

$\mathbb P(X\gt Y)=\mathbb P(X-Y\gt 0)=\sum_{(x,y)\in A\cap S}p_{X,Y}(x,y)$

We can define $A$﻿ s.t.

$A=\{(x,y)\in\R^2:x-y\gt 0\}\\\implies\\$

So, we can use the PMF proposition to find the probability as

$\mathbb P(X\gt Y)=\sum_{(x,y)\in A\cap S}p_{X,Y}(x,y)=p_{X,Y}(2,1)=\frac{2+1}{32}=\frac{3}{32}$

### d) @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\mathbb P(Y=2X)$﻿

Using the same method as (c):

$\mathbb P(Y=2X)=\mathbb P\left(\frac YX=2\right)=\sum_{(x,y)\in A\cap S}p_{X,Y}(x,y)$

For which we can define $A$﻿ such that

$A\cap S=\{(x,y):(1,2),(2,4)\}$

Then,

$\mathbb P(Y=2X)=\sum_{(x,y)\in A\cap S}\frac{x+y}{32}=\frac{1+2}{32}+\frac{2+4}{32}=\frac{9}{32}$

### e) @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\mathbb P(X\le3-Y)$﻿

Using the same method as (c):

$\mathbb P(X\le3-Y)=\mathbb P\left(X+Y\le 3\right)=\sum_{(x,y)\in A\cap S}p_{X,Y}(x,y)$

For which we can define $A$﻿ such that

$A\cap S=\{(x,y):(1,1),(1,2),(2,1)\}$

Then,

$\mathbb P(X\le3-Y)=\sum_{(x,y)\in A\cap S}\frac{x+y}{32}=\frac{1+1}{32}+\frac{1+2}{32}+\frac{2+1}{32}=\frac8{32}$

### f) Independence?

We can check this as the variables are independent if:

$p_{X,Y}(x,y)=p_X(x)p_Y(y)\\\therefore\\$

This can also be seen as the joint PMF physically depends on both $X,Y$﻿

  

## 7

### a) Domain of @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$X,Y$﻿

Because $X$﻿ is the outcome of a fair 4-sided (red) die, it takes values from the domain defined by the set

$S_X=\{1,2,3,4\}$

$Y$﻿, however, is the sum of the values on both die, so it takes values from the domain defined by the set of all possible sums of values:

$S_Y=\{2,3,4,5,6,7,8\}$

  

### b) Joint PMF

We can use the definition of the PMF as

$p_{X,Y}(x,y)=\mathbb P(X=x,Y=y)$

To find the probability, we can make a matrix of the joint probabilities:

|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|$p_{X,Y}(x,y)$|P=1/16|P=2/16|P=3/16|P=4/16|P=3/16|P=2/16|P=1/16|$p_X(x)$|
|4|0|0|0|1/16|1/16|1/16|1/16|P=1/4|
|3|0|0|1/16|1/16|1/16|1/16|0|P=1/4|
|2|0|1/16|1/16|1/16|1/16|0|0|P=1/4|
|1|1/16|1/16|1/16|1/16|0|0|0|P=1/4|
|$p_Y(y)$|2|3|4|5|6|7|8|TOTAL = 1|

From this, we can see that the joint PMF is

$p_{X,Y}(x,y)=\begin{cases}$

### c) Marginal PMFs

Using the table from (b), we can deduce:

$p_X(x)=\frac14\quad\quad p_Y(y)=\begin{cases}$

### d) Independence?

Although we could check using the proposition, it is clear that $Y$﻿ depends on $X$﻿ as $Y$﻿ represents the sum of $X$﻿ and the value on the other die. So, the variables are not independent

## 8

### a) Joint PMF

We can first note that each variable is Geometrically distributed such that

$X,Y\sim\text{Geom}(p=1/10)$

Now, we can use the definition of the joint PMF to define

$p_{X,Y}(x,y)=\mathbb P(X=x,Y=y)$

We can also deduce that $X,Y$﻿ are not independent as if $X=1\implies Y\neq 1$﻿. So, we can define the joint PMF in terms of the joint probability using the PMFs of the geometric distribution:

$p_{X,Y}(x,y)=\mathbb P(X=x,Y=y)$

These variables are not independent. This can be observed by the example for which $\mathbb P(X=y,Y=x)=0$﻿ but the marginal PMFs are $>0$﻿, thus if the variables were independent, their product (by definition) would not be $0$﻿ when in reality the probability must be $0$﻿. So, we can find the probability as

$p_{X,Y}(x,y)=(0.1)(0.9)^{x-1}(0.9)^{y-x-1}\quad 0\lt x\lt y\\\implies\\$

### b) Verify PMF with Geom. series

We can verify the function we proposed in part (a) is. genuine PMF if it follows the Normalization condition:

$\sum_{(x,y)\in S\sube \R^2}p_{X,Y}(x,y)=1$

We can verify this using the Geometric series formula provided to us where the smallest possible $y=2$﻿ because $0\lt x\lt y$﻿ thus at the minimum $x=1,y=2$﻿. So, the sum taken to infinity by the geometric series can be given by

$\sum_{y=2}^\infin (0.1)(0.9)^{y-2}=(0.1)\sum_{y=2}^\infin(0.9)^{y-2}=(0.1)\left[\frac{0.9^{2-2}}{1-(0.9)}\right]=1$

This follows the normalization condition so the PMF is indeed genuine.

# Resources

---

![[/HW6_Soln_170E-3.pdf|HW6_Soln_170E-3.pdf]]