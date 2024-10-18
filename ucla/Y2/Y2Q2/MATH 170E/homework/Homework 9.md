---
course: MATH 170E
area: ucla
created: 2023-03-20T16:14
updated: 2023-03-22T00:55
📕 courses:
  - "[[Math 170E- Probability Theory]]"
tags: math
---
## 1

Done

## 2

### a

We can first find the joint PDF by finding the individual PDFs for the exponential r.v.s. knowing they are independent

$f_{X_j}=\frac1{1000}e^{-x/1000}\therefore f_{X_1,X_2}=f_{X_1}f_{X_2}=\frac{e^{-x_1/1000}e^{-x_2/1000}}{1,000,000}$

We can note that this probability can be expressed as:

$P(Y_1\le y_1, Y_2\le y_2)= P(X_1\le y_1, X_1\le X_2\le y_2)$

Now we can find the probability as

$G(y_1,y_2)=\frac{1}{1000^2}\int_0^{y_1}\int_{x_1}^{y_2}e^{-x_1/1000}e^{-x_2/1000} dx_2dx_1 \\$

$G(y_1,y_2)=\frac12\mathrm{e}^{-\frac{y_2+3y_1}{1000}}\cdot\left(\mathrm{e}^\frac{y_2+3y_1}{1000}-\mathrm{e}^\frac{y_2+y_1}{1000}-2\mathrm{e}^\frac{3y_1}{1000}+2\mathrm{e}^\frac{y_1}{500}\right)$

### b

We can see that the probability is

$P(Y_2\gt 1200)=1-P(Y_2\le 1200)=1-P(X_1,X_2\le 1200)$

Because these variables are independent, we can calculate:

$= 1-\int_0^{1200}\frac1{1000}e^{-x_1/1000}dx_1\int_0^{1200}\frac1{1000}e^{-x_2/1000}dx_2$

So

$P(Y_2\gt 1200)\approx1-0.6988^2\approx 0.5117$

## 3

We can first find the joint PDF since the variables re independent as

$f_{X,Y}(x,y)=\frac x{125}e^{-x/5}e^{-y/5}$

Now, we can find the CDF of $Z$﻿ as $P(Z\le z)=P(X/Yle z)=P(X\le zY)$﻿

$\frac{1}{125}\int_0^\infin\int_0^{yz}$

Now, we can find the PDF by taking the derivative with respect to $z$﻿

$f_Z(z)=\frac{2z}{(z+1)^3}$

## 4

### a

Since each variable is independent, we can use their PMFs to find the probability

$P(X_1=2,X_2=2,X_3=5)=\binom{4}{2}0.5^20.5^2\cdot\binom{6}{2}\bigg(\frac13\bigg)^2\bigg(\frac23\bigg)^4\cdot\binom{12}{5}\bigg(\frac16\bigg)^5\bigg(\frac56\bigg)^7$

$P(X_1=2,X_2=2,X_3=5)\approx0.007896$

  

### b

The independence theorem for expectation allow us to show the following

$E[X_1X_2X_3]=E[X_1]E[X_2]E[X_3]=\frac42*\frac63*\frac{12}6=8$

### c

The r.v. $Y$﻿ is a liner combination, so we can use the linear property of expectation to find the mean:

$E[Y]=E[X_1]+E[X_2]+E[X_3]=6$

The variance can be found as

$\text{var}(Y)=E[Y^2]-E[Y]^2=E[(X_1+X_2+X_3)^2]-36$

For which

$E[Y^2]=E[X_1^2]+E[X_2^2]+E[X_3^2]+2E[X_1]E[X_2]+2E[X_2]E[X_3]+2E[X_1]E[X_3]$

The 2nd moment for the binomial is known to be $n(n-1)p^2$﻿

$E[Y^2]=3+\frac{10}3+\frac{11}3+8\cdot3=34$

So:

$\text{var}(Y)=34-36=-2$

## 5

We can express:

$E[Z]=E[2Y_1+Y_2]$

Since the function $Y_1,Y_2$﻿ depend on independent variable $X_1,X_2$﻿ and we know that one i the minimum and one i the maximum of the X variable, the following must be true

$Y_1+Y_2=\min(X_1,X_2)+\max(X_1,X_2)=X_1+X_2\implies Y_2=X_1+X_2-Y_1$

So $E[Z]=E[Y_1+X_1+X_2]$﻿ and using the linearity from problem (2):

$E[Z]=E[\min(X_1,X_2)]+2+2$

We also know for an exponentially distributed minimum function the following is true:

$Y_1\sim\text{Exp}\bigg(\frac{1}{\frac{1}{X_1}+\frac{1}{X_2}}\bigg)$

For which, $E[Y_1]=1$﻿ so

$E[Z]=1+2+2=5$

## 6

### a

We can first rewrite the probability to match Chebyshev’s format

$P(23<X<43)=P(-10<X-\mu<10)\\=P(|X-\mu|\lt 10)=1-P(|X-\mu|\ge 10)$

This is now in Chebyshev’s format:

$P(|X-\mu|\ge 10)\le \frac{\sigma^2}{\lambda^2}=\frac{16}{100}$

So, the lower bound is

$1-\frac{16}{100}=0.84$

### b

This is already in the proper format so the upper bound can be found as

$P(|X-33|\ge 14)\le \frac{16}{14^2}=\frac4{49}$

## 7

We must first convert this to the proper format as

$P(|Y/n-0.25|<0.05)=1-P(|Y-0.25n|\ge 0.05n)\le 1-\frac{\sigma^2}{.0025n^2}$

Because the distribution is binomial, $\sigma^2 = n(0.25)(0.75)=\frac{3}{16}n$﻿

So for $n=100$﻿

$P(|Y/100-0.25|<0.05)\le 1-\frac{18.75}{25}=0.25$

For $n=1000$﻿

$P(|Y/1000-0.25|<0.05)\le 1-\frac{187.5}{2500}=0.925$

For $n=10,000$﻿

$P(|Y/10,000-0.25|<0.05)\le 1-\frac{1875}{250000}=0.9925$

![[/HW9.pdf|HW9.pdf]]