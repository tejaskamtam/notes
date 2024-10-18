---
course: MATH 170E
area: ucla
created: 2023-02-15T22:38
updated: 2023-02-17T21:34
📕 courses:
  - "[[Math 170E- Probability Theory]]"
tags: math
---
# Big Ideas

---

## 1

$X\sim\text{Uniform}([0,10])$﻿

### a) PDF of X

Simply the PDF of a Uniform distribution s.t. $[a,b]:[0,10]$﻿

$f_X(x)=\begin{cases}$

### b) @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\mathbb P(X\ge 8)$﻿

Because X is uniformly distributed, we can use the principle of the CDF of a continuous uniform r.v. to derive

$\mathbb P(X\ge 8)=1-\mathbb P(X\ge 8)+\mathbb P(X=8)$

But because X is continuously distributed: $\mathbb P(X=8)=0$﻿

Now, we can use the definition of the CDF of a continuous Uniform r.v. to find:

$\mathbb P(X\ge 8)=1-F_X(8)=1-\frac{8-0}{10-0}=\frac{2}{10}$

  

### c) @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\mathbb P(2\lt X\le 8)$﻿

We can use the definition of the probability interval of a continuous r.v. to note

$\mathbb P(2\lt X\le 8)=\int_2^8f_X(x)\space dx$

As we’ve shown above, we can use the PDF of a uniform r.v. to find:

$\mathbb P(2\lt X\le 8)=\frac 1{10}\int_2^8dx=\frac{6}{10}$

### d) @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\mathbb E[X]$﻿

Simply the mean of a uniform r.v.

$\mathbb E[X]=\frac 12(a+b)=\frac 12(10+0)=5$

### e) @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\text{var}(X)$﻿

Simply the variance of a uniform r.v.

$\text{var}(X)=\frac 1{12}(10-a)^2=\frac{100}{12}= 8.\overline{33}$

  

## 2

Finite set of $X_j$﻿ with PDFs $f_{X_j}$﻿ each with sample space $\R$﻿ and let $a_j$﻿ be constants

### a) Give conditions for constants s.t. @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\sum_{j=1}^k a_jf_{X_j}(x)$﻿ is a PDF

Let us define a cont. r.v. and the PDF

$X=\sum_{j=1}^k X_j\implies \int_{-\infin}^\infin f_X(x)\space dx=1$

Because the cont. r.v. is defined over the finite set of variables $j=[1,k]$﻿, we can define the true PDF as

$f_X(x)=\sum_{j=1}^kf_{X_j}(x)$

Then, the condition for the constants can be that $a_j=1 \space \forall j\in[1,k]$﻿

### b) @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\mathbb E[X_j]=\mu_j,\space \text{var}(X_j)=\sigma_j^2\quad\forall j=1,…,k$﻿ find the mean and variance of X if X is a cont. r.v. w/ PDF = the sum above

We can transform the individual means and variances using a function such that

$\mathbb E[X]=\mathbb E[g(X_j)]\quad g(X_j)=\sum_{j=1}^k X_j$

Then we can take the mean of the implied function

$\mathbb E[X]=\frac{\sum_{j=1}^k \mu_j}k= \mu$

Similarly, for the variance, we can take the mean but first we should sum the error values NOT the variance itself

$\text{var}(X)=\left(\frac{\sum_{j=1}^k \sqrt{\sigma^2_j}}{k}\right)^2=\sigma_X^2$

## 3

let $X$﻿ be a cont. r.v., show the following

### a) @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\mathbb E[a]=a \iff a\in\R$﻿

The definition of the mean of a continuous random variable is given by

$\mathbb E[X]=\int_{-\infin}^\infin xf_X(x)\space dx$

Writing this in terms of the constant gives

$\mathbb E[X=a]=a\int_{-\infin}^\infin f_X(x)\space dx$

Now, because X is a cont. r.v., the integral of its PDF over negative infinity to infinity is simply 1 by definition, thus we get

$\mathbb E[a]=a(1)=a$

### b) @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$a,b\in\R\quad g,h:\R\to\R$﻿ then @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\mathbb E[ag(X)+bh(X)]=a\mathbb E[g(X)] + b\mathbb E[h(X)]$﻿

We can recall that a property of the mean allows us to apply the distributive property of addition over the sum to get

$\mathbb E[ag(X)+bh(X)]=\mathbb E[ag(X)]+\mathbb E[bh(X)]$

Now, we can use the one of the steps from the previous part to pull out the constant. Consider that the mean is truly an integral and a property of the integral allows us to pull out a constant from the integral if it does not depend on the incremental dimension it is being integrated over. So,

$\mathbb E[ag(X)+bh(X)]=a\mathbb E[g(X)]+b\mathbb E[h(X)]$

### c) @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$g(x)\le h(x)\space \forall x\in\R \implies \mathbb E[g(X)]\le\mathbb E[h(X)]$﻿

We could use the principles of the mean from the discrete distributions, but we can logically interpret that

$\mathbb E[g(X)]=\int_{-\infin}^\infin g(x)f_X(x)\space dx$

For a function with its complete range less than that of the range another function must follow that their respective integrals also follow the inequality, that is to say they are comparable s.t.

$\mathbb E[g(X)]\le\mathbb E[h(X)] \impliedby g(x)\le h(x)\quad \forall x\in\R$

## 4

We can use the definition of the expected value of a cont. r.v. to express

$\mathbb E[1_I(X)]=\begin{cases}$

Then, by definition of the PDF:

$\mathbb E[1_I(X)]=\begin{cases}$

We can also define the probability in an interval as

$\mathbb P(X\in I)=\int_I f_X(x)\space dx\\$

Now, we can observe that over the integral of domain of $X$﻿, the following is true:

$\int_If_X(x)=1$

Thus, we observe

$\mathbb E[1_I(X)]=\begin{cases}$

## 5

### a) Profit if @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$X\le n$﻿

If the number of customers is fewer than the number of watermelons, we can model the profit to be

$P_{X\le n}=X-0.5(n-X)$

### b) Profit if @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$X\gt n$﻿

As before, because there are more customers than watermelons, we can model our profit as

$P_{X\gt n}=n-5(X-n)$

### c) # of watermelons to maximize profit

We can find the expected profit by considering the situations possible

$\mathbb E[P] = \mathbb E[P;X\le n] + \mathbb E[P;X\gt n] $

Since the interval the variable X is defined over is [0,200] we can write the integral:

$\mathbb E[P]=\int_0^n (1.5x-0.5n)f_X(x)\space dx\space +\space \int_n^{200}(6n-5x)f_X(x)\space dx$

Using the PDF provided we get

$\mathbb E[P]=\frac1{200}\left(\frac{n^2}4-\frac{7n^2}{2}+1200n-100000\right)=-\frac{13n^2}{800}+6n-500$

Graphing this suggests a maximum of 185 watermelons

## 6

### a) How can @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$f_X$﻿ be a well-defined PDF

We can show that the integral from negative infinity to infinity of the function can be 1 which implies well defined

$C\int_{-\infin}^\infin e^{-|x|}\space dx = C\left(\int_{-\infin}^0e^x\space dx\space +\space \int_0^\infin e^{-x}\space dx\right)$

This is a known special integral for which the limit taken to their respective bounds evaluate to:

$C\int_{-\infin}^\infin e^{-|x|}\space dx = 2C$

Now, this integral is =1 when $C=\frac 12$﻿. Thus, this can be a well defined PDF.

### b) MGF of @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$X$﻿

We can use the definition of the MGF to define

$M_X(t)=\int_{-\infin}^{\infin}e^{tx}\cdot \frac12e^{-|x|}\space dx=\frac12\left(\int_{-\infin}^0e^{tx+x}\space dx\space +\space \int_0^\infin e^{tx-x}\space dx\right)$

This simplifies (taking the limits) to

$M_X(t)=\frac12\left(\frac{1}{t+1}+\frac{1}{t-1}\right)=\frac{t}{t^2-1}\quad -1\lt t\lt 1$

## c) Mean and Var

Using the same method as before

$\mathbb E[X]=C\int_{-\infin}^\infin xe^{-|x|}\space dx=C\left(\int_{-\infin}^0xe^x\space dx\space +\space \int_0^\infin xe^{-x}\space dx\right)$

This simplifies to

$\mathbb E[X]=\frac12(-1+1)=0$

The variance can be given by

$\text{var}(X)=\mathbb E[X^2]-\mathbb E[X]^2=\mathbb E[X^2]=\frac12\int_{-\infin}^\infin x^2e^{-|x|}\space dx$

Using the process above

$\text{var}(X)=\frac12\left(\int_{-\infin}^0x^2e^x\space dx\space +\space \int_0^\infin x^2e^{-x}\space dx\right)=\frac12(2+2)=2$

### d) Show 76-94-99 rule

This r.v. X has a mean of 0 and a variance of 2 thus

$\sigma_X=\sqrt2$

We can use a few PDF tests to see f it follows the rule.

$\frac12\int_{0-\sqrt2}^{0+\sqrt2}e^{-|x|}\space dx= 1-e^{-\sqrt2}\approx0.76$

$\frac12\int_{2\sqrt2}^{2\sqrt2}e^{-|x|}\space dx=1-e^{-2\sqrt{2}}\approx0.94$

$\frac12\int_{3\sqrt2}^{3\sqrt2}e^{-|x|}\space dx=1-e^{-3\sqrt{2}}\approx0.99$

Because these probabilities line up with the expected probabilities given by the rule, we know the random variable follows a distribution that follows the 76-94-99 rule.

## 7

### a) MGF of @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$X\sim\text{Gamma}(\alpha,\theta)$﻿

The MGF of the Gamma distribution is known thus no derivation is required and is described below

$M_X(t)=\frac{1}{(1-\theta t)^\alpha}\quad t\lt1/\theta$

### b) Mean of X

The mean is also known and is shown below

$\mathbb E[X]=\alpha\theta$

### c) Variance of X

The variance is also known to be

$\mathbb E[X]=\alpha\theta^2$

## 8

We can relate this distribution as $X\sim\text{Gamma}(\alpha=\frac r2,\theta=2)$﻿

Thus, we know the mean and variance to be

$\mathbb E[X]=\alpha\theta=r\\$

Similarly, the MGF is then

$M_X(t)=\frac 1{(1-2t)^{r/2}}\quad t\lt 1/2$

## 9

Given the information, we know

$\mathbb P(X\gt 50)=1-\mathbb P(X\lt 50)=1-0.25=0.75$

We can use Baye’s theorem to express

$\mathbb P(X\gt 100 | X\gt 50)=\frac{\mathbb P(X\gt 50|X\gt 100)\mathbb P(X\gt 100)}{\mathbb P(X\gt 50)}$

We can observe that $\mathbb P(X\gt 50|X\gt 100)=1$﻿ as it is True that X must be greater than 50 if it is greater than 100. Then, we can solve for the missing probability using the PDF of the exponential r.v. However, we must first find the parameter of the exponential distribution using the given information:

$0.75=\int_{a}^bf_X(x)\space dx = \int_{50}^\infin \frac 1\theta e^{-x/\theta}\space dx=e^{-50/\theta}\\\space\\$

Now, we can use the parameter to find the missing probability:

$\mathbb P(X\gt 100)=\int_{100}^\infin f_X(x)\space dx=e^{-100/\theta}=0.5625$

Thus, we can find the conditional probability

$\mathbb P(X\gt 100|X\gt 50)=\frac{\mathbb P(X\gt 100)}{\mathbb P(X\gt 50)}=\frac{0.5625}{0.75}=0.75$

## 10

We can use a Gamma r.v. to approximate the probability such that $\lambda = 5/10=1/2$﻿

$X\sim\text{Gamma}(\alpha=8,\theta=2)$

Then, we can use the PDF of a Gamma r.v. to find the probability

$\mathbb P(X\gt 26.30)=\int_a^b f_X(x)\space dx = \int_{26.30}^\infin \frac{x^{8-1}e^{-x/2}}{2^8(8-1)!}\space dx\\\space\\= \frac 1{1290240}\int_{26.30}^\infin x^7e^{-x/2}\space dx$

We can evaluate the complement to make the integral easier such that:

$\mathbb P(X\gt 26.30)=1-\frac 1{1290240}\int^{26.30}_0 x^7e^{-x/2}\space dx\approx 1-0.95=0.05$

# Resources

---

![[/HW5-1.pdf|HW5-1.pdf]]

📌

**SUMMARY  
**