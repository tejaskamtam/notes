---
course: MATH 170E
area: ucla
created: 2023-03-15T21:34
updated: 2023-03-17T00:22
📕 courses:
  - "[[Math 170E- Probability Theory]]"
tags: math
---
## 1

### a

We can check that the PDF is well defined over the relevant interval by taking the double integral over the interval space to check the normalization condition:

$\int_0^1\int_0^1x+y\space dxdy=\int_0^1\frac12+y\space dy=1$

As we can see, the PDF is well defined over the relevant interval.

### b

We can integrate over the interval of the other variables to find the marginal PDF of each variable:

$f_X(x)=\int_0^1 x+y\space dy = \frac 12+x\\\space\\$

### c

The variables are independent if they follow that:

$f_{X,Y}(x,y)=f_X(x)f_Y(y) \quad\text{but}\\$

So, the variables are not independent.

### d

We can use a function $g$﻿ of the variables to find the means and variances

$g(X,Y)=X\implies E[X]=\int_0^1\int_0^1x(x+y)\space dxdy=\frac7{12}\\\space\\$

We can also use the formulas for variance in terms of the expectation:

$\text{var}(X)=E[X^2]-E[X]^2=\int_0^1\int_0^1x^2(x+y)\space dxdy - \bigg(\frac7{12}\bigg)^2\\=\frac5{12}-\bigg(\frac7{12}\bigg)^2=\frac{11}{144}$

$\text{var}(Y)=\int_0^1\int_0^1y^2(x+y)\space dxdy -\bigg(\frac7{12}\bigg)^2=\frac5{12}-\bigg(\frac7{12}\bigg)^2=\frac{11}{144}$

### e

The correlation coefficient is given as

$\rho(X,Y)=\frac{\text{cov}(X,Y)}{\sqrt{\text{var($X$)var($Y$)}}}$

Then, we can find the covariance using (d):

$\text{cov}(X,Y)=E[XY]-E[X]E[Y]=\int_0^1\int_0^1 xy(x+y)\space dxdy - \bigg(\frac7{12}\bigg)^2\\= \frac13-\bigg(\frac7{12}\bigg)^2=-\frac1{144}$

So using (d) we can find the covariance:

$\rho=\frac{-\frac1{144}}{\sqrt{\bigg(\frac{11}{144}\bigg)^2}}=-\frac1{11}$

## 2

We can first find the marginal PDFs using the integral of the joint PDF over the intervals described: $0\le x\le y$﻿ and $x\le y\lt \infin$﻿, so:

$f_X(x)=\int_0^y 2e^{-x-y}dy = 2e^{-2y}\quad f_Y(y)=\int_x^\infin 2e^{-x-y} dx=-2e^{-x-y}$

By the independence theorem, the joint PDF is independent if $f_{X,Y}=f_Xf_Y$﻿:

$f_X(x)f_Y(y)=-4e^{-x-3y}\neq f_{X,Y}(x,y)$

So, $X,Y$﻿ are not independent.

## 3

We can check the normalization condition for each function over its defined interval space to check that it is a true joint PDF

### a

$\int_0^1\int_{x^2}^x cxy\space dydx = \frac c{24}=1 \implies c = 24$

### b

$\int_0^1\int_0^{y^2}cye^x\space dxdy=\frac{(e-2)c}{2}=1\implies c=\frac{2}{e-2}$

### c

$\int_0^{\pi/2}\int_0^{\pi/2} c\sin(x+y)\space dxdy =2c =1\implies c=\frac 12$

## 4

We can model this probability using the expression:

$P(-0.1\le X-Y\le 0.1)=P((X,Y)\in A)\implies A=\{x,y:y-0.1\le x\le y+0.1,2\lt x\lt 2.5,2\lt y\lt2.3\}$

Wee can also visualize the sample space for which the PDF is defined as the rectangle formed by the bounds given because each variable is uniformly distributed. This gives us a total area of the rectangle of $(2.5-2)(2.3-2)=0.15$﻿. This means we can find the probability as fraction of the overall sample space. The area the probability covers is defined in the expression above which we can find as:

$A=\int_2^{2.3}\int_{y-0.1}^{y+0.1} dxdy+\int_{1.9}^{2}\int^{x+0.1}_{2} dydx=0.055$

So, the probability is:

$P(|X-Y|\le 0.1)=\frac{0.055}{0.15}=\frac{11}{30}$

## 5

We can use. similar method as question (4) by first defining the sample space as

$\Omega = \int_1^{10}\int_2^{(14-t_1)/2} dt_2dt_1-\int_1^2\int_6^{(14-t_1)/2}dt_2dt_1=20$

Then, we can also express the space the probability is defined over as an area integral of the bounds:

$A=\int_6^{10}\int_{2}^{(14-t_1)/2} dt_2dt_1 -\int_{6}^{8}\int_{2}^{10-t_1}dt_2dt_1=2$

So, the probability is found as:

$P(T_1+T_2>10)=\frac{2}{20}$

## 6

We know the conditional variable is uniformly distributed over the bounds, so:

$E[Y|x]=\frac{x+0.1+x-0.1}{2}=x$

Now, we can use iterated expectation:

$E[Y]=E[E[Y|X]] = E[X] = \int_{0.2}^\infin x(2e^{-2(x-0.2)})\space dx = 0.7$

## 7

### a

By conditional probability (given that the conditional variable is uniformly distributed:

$f_{X,Y}(x,y)=f_{Y|X}(y|x)f_X(x)=\frac{1}{2}\cdot\frac{1}{x^2}=\frac{1}{2x^2}\quad (0<y<x^2)$

### b

The marginal PDF of Y can be found using the bounds $x>\sqrt y$﻿ and $x<2$﻿

$f_Y(y)=\int_{\sqrt{y}}^2\frac{{1}}{2x^2}\space dx=-\frac14+\frac 1{2\sqrt y}$

### c

First we can find the conditional PDF for $X|Y$﻿ using the conditional probability using (a),(b)

$f_{X|Y}(x|y)=\frac{f_{X,Y}(x,y)}{f_Y(y)}=\frac{\frac1{2x^2}}{-\frac14+\frac 1{2\sqrt y}}$

Then, we can find the conditional expectation as:

$E[X|y]=\int_{\sqrt y}^2 xf_{X|Y}(x|y)\space dx=\dfrac{\ln\left(2\right)-\ln(\sqrt{y})}{2\left(\frac{1}{2\sqrt{y}}-\frac{1}{4}\right)}$

## 8

We first know the PDF of $X$﻿ to be:

$f_X(x)=1$

We can use the proposition of functions of random variables s.t.

$u(X)=e^X \implies u'(X) > 0\quad \forall x\in[0,1]\\$

And, since we know the function $u(X)=e^X$﻿ is smooth and increasing for all values of $x$﻿ in the domain defined by the uniform distribution, we can use the proposition that:

$f_Y(y)=\bigg|\frac{d}{dy}u^{-1}(y)\bigg|\cdot f_X(u^{-1}(y))=\bigg|\frac1y\bigg|\cdot 1 = \frac 1{|y|}$

  

## 9

We know the PDF of the exponential distribution to be

$f_X(x)=e^{-x}$

Now, we can find a function of $X$﻿ over the domain of the distribution given $a>0$﻿ s.t.

$u(X)=e^{-X/a}\implies u'(X)=-\frac15 e^{-X/5} < 0 \quad \forall X\\$

We can use the proposition for functions of random variables to determine the PDF of $Y$﻿:

$f_Y(y)=\bigg|\frac{d}{dy}u^{-1}(y)\bigg|\cdot f_X(u^{-1}(y))=\bigg|-\frac ay\bigg|\cdot e^{a\ln(y)}=\bigg|\frac ay\bigg|\cdot y^a$

Finally, since we know the domains s.t. $y>0$﻿ and $a>0$﻿ we can simplify to:

$f_Y(y)=ay^{a-1}$

![[/HW8-3.pdf|HW8-3.pdf]]

📌

**SUMMARY  
**