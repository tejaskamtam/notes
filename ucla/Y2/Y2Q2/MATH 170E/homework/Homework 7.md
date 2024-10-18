---
course: MATH 170E
area: ucla
created: 2023-03-07T12:03
updated: 2023-03-08T23:56
📕 courses:
  - "[[Math 170E- Probability Theory]]"
tags: math
---
## 1

### a) @import url('https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.13.2/katex.min.css')$\mathbb E[Y|X]=\mathbb E[Y]$﻿

The statement implies that the variables are independent as knowing anything about $X$﻿ tells us nothin about $Y$﻿. This means

$p_{Y|X}(y|x)=\mathbb P(Y=y|X=x)=\frac{\mathbb P(Y\cap X)}{\mathbb P(X)}=\mathbb P(Y)=p_Y(Y)$

Then we can find that for any $X=x$﻿

$\mathbb E[Y|X=x]=\sum_{y\in S_Y}y\cdot p_{Y|X}(y|x)=\sum_{y\in S_Y}y\cdot p_Y(y)$

The RHS is specifically the definition of the expected value for $Y$﻿so:

$\mathbb E[Y|X]=\sum_{y\in S_Y}y\cdot p_Y(y)=\mathbb E[Y] \iff \mathbb P(Y\cap X)=\mathbb P(Y)\mathbb P(X)$

### b)

We can observe that the rolling of the 6-sided die (1 time) is

$Y\sim\text{Uniform}([1,6])\implies \mathbb E[Y]=\frac{6+1}{2}=3.5$

Thus, using the proof in (a) since rolling a die and flipping a coin are independent events:

$\mathbb E[Y|X]=\mathbb E[Y]=3.5$

### c)

We can use the definition of the conditional variance as:

$\text{var}(Y|X)=\mathbb E\big[(Y-\mathbb E[Y|X])^2|X\big]$

Now, we can use the proof from part (a) since $X,Y$﻿ are independent

$\mathbb E\big[(Y-\mathbb E[Y|X])^2|X\big]= \mathbb E\big[(Y-\mathbb E[Y|X])^2\big]=\mathbb E\big[(Y-\mathbb E[Y])^2\big]$

This is precisely the definition of the variance of $Y$﻿ so:

$\text{var}(Y|X)=\mathbb E\big[(Y-\mathbb E[Y])^2\big]=\text{var}(Y)$

## 2

### a)

We can first define the random number $N$﻿ which describes the outcome of a die (assuming it is fair and is 6-sided) as

$N\sim\text{Uniform}([1,6])$

Then, we can describe the coin flips (assuming it is fair) $X$﻿ as a binomial distribution using $N$﻿

$X|n\sim\text{Binom}(N=n,1/2)$

We can use the Law of Iterated Expectation:

$\mathbb E[X]=\mathbb E\big[\mathbb E[X|N]\big]=\sum_{n\in S_N}\mathbb E[X|n]\cdot p_N(n) =\frac 16\sum_{n=1}^6\mathbb E[X|n]$

Now, we can find the mean using the expected value of the binomial distribution defined above:

$\mathbb E[X]=\frac 16\sum_{n=1}^6\mathbb E[X|n]=\frac 16\sum_{n=1}^6\frac n2=\frac1{12}\cdot21=\frac{21}{12}$

### b)

We can use the definition of the variance to describe in terms of the expected value using the law of iterated expectation

$\text{var}(X)=\mathbb E[X^2]-\mathbb E[X]^2=\mathbb E\big[\mathbb E[X^2|N]\big]-\bigg(\frac{21}{12}\bigg)^2$

We can use the expansion method using the proof for the law of iterated expectation and the definition of the expected value of a conditional distribution and the probability defined in (a):

$=\frac16\sum_{n=1}^6\mathbb E[X^2|n]\space -\frac{49}{16}=\frac16\sum_{n=1}^6\bigg(\sum_{x\in S_X} x^2\cdot p_{X|N}(x|n)\bigg)\space -\frac{49}{16}\\\space\\=\frac16\sum_{n=1}^6\frac12\bigg(\sum_{x\in S_X} x^2\bigg)\space -\frac{49}{16}=\frac{1}{2}\bigg(\sum_{x\in S_X} x^2\bigg)\space -\frac{49}{16}$

Now, we know $X$﻿ is defined as the number of heads given $N\in[1,6]$﻿ flips, so $X\in[0,6]$﻿:

$\text{var}(X)=\frac12\sum_{x=0}^6 x^2\space -\frac{49}{16}=\frac{91}{2}-\frac{49}{16}=\frac{679}{16}$

## 3

### a)

We can first simplify the expression

$K(m)=\mathbb E\bigg[(Y-\mu_Y)^2-2m(X-\mu_X)(Y-\mu_Y)+m^2X^2\bigg]$

Now, we can use the linear addition of expectance to show:

$K(m)=\mathbb E\big[(Y-\mu_Y)^2\big]-2m\cdot\mathbb E\big[(X-\mu_X)(Y-\mu_Y)\big]+m^2\cdot\mathbb E\big[(X-\mu_X)^2\big]$

These include some known expectancies, which we can replace s.t.

$K(m)=\sigma^2_Y-2m\cdot\text{cov}(X,Y)+m^2\sigma^2_X$

We can now derive the function with respect to $m$﻿:

$K'(m)=-2\text{cov}(X,Y)+2m\sigma_X^2$

Now, we can express the covariance in terms of the correlation coefficient:

$\text{cov}(X,Y)=\rho\sqrt{\sigma^2_X\sigma^2_Y}=\rho\sigma_X\sigma_Y$

Thus

$K'(m)=-2\rho\sigma_X\sigma_Y+2m\sigma_X$

### b)

We can see from taking a simple derivative test, to minimize $K(m)$﻿

$m=\rho\sigma_Y$

The second derivative (trivial to calculate) identifies that $K(m)$﻿ is concave up so $m=\rho\sigma_Y$﻿ is indeed the minimum.

## 4

We can first observe that the MGFs can be expressed using the expected value:

$M_{X+Y}(t)=\mathbb E[e^{t(X+Y)}]=\mathbb E[e^{tX}e^{tY}]\\\&\\$

From here, we can observe that the inequality is then precisely the Cauchy-Schwarz Inequality:

$\mathbb E[AB]\le \sqrt{\mathbb E[A^2]\mathbb E[B^2]}\quad \text{s.t.}\quad A=e^{tX},\space B=e^{tY}$

Therefore,

$E[e^{tX}e^{tY}]\le\sqrt{\mathbb E\big[(e^{tX})^2\big]\mathbb E\big[(e^{tY})^2\big]}\quad\equiv\quad M_{X+Y}(t)\le M_X^{1/2}(2t)M_Y^{1/2}(2t)$

(by the Cauchy-Schwarz Inequality)

## 5

### a)

We can first find the marginal PMFs as

$p_X(x)=\sum_{y\in S_Y}p_{X,Y}(x,y)=\frac{4x+10}{32}\quad\quad p_Y(y)=\sum_{x\in S_X}p_{X,Y}(x,y)=\frac{2y+3}{32}$

Now, we can find the expectations as

$E[X]=\sum_{x\in S_X}xp_X(x)=\frac{25}{16}\quad\quad E[Y]=\sum_{y\in S_Y}yp_Y(y)=\frac{47}{16}\\\&\\$

We can also find the individual variances:

$\text{var}(X)=\sum_{x\in S_X}x^2p_X(x) - \bigg(\frac{25}{16}\bigg)^2=\frac{63}{256}\\\&\\$

Now, we can find the covariance as

$\text{cov}(X,Y)=E[XY]-E[X]E[Y]=\frac{35}{8}-\frac{25\cdot47}{16\cdot 16}=-\frac{55}{256}$

Finally the correlation coefficient:

$\rho=\frac{-\frac{55}{256}}{\sqrt{\frac{63}{256}\cdot\frac{111}{256}}}=-\frac{55\sqrt{777}}{2331}$

### b)

We can use the definition of conditional expectation to find

$E[Y|X]=\sum_{y\in S_Y}y\cdot p_{Y|X}(y|x)=\sum_yy\cdot\frac{p_{X,Y}(x,y)}{p_X(x)}=\frac{5x+15}{16}=g(X)$

### c)

We can use conditional probability and the joint and marginal PMFs we defined in (a):

$P(1\le Y\le 3|X=1)=\frac{P(Y\cap X)}{P(X=1)}=\frac{\sum_{y=1}^3p_{X,Y}(x=1,y)}{p_X(x=1)}$

Now, we can calculate the probability

$P(1\le Y\le 3|X=1)=\frac{\sum_{y=1}^3 \frac{1+y}{32}}{\frac{4(1)+10}{32}}=\frac{32}{14}\cdot\frac{1+1+1+2+1+3}{32}=\frac{9}{14}$

### d)

We can us the alternate definition of conditional variance:

$\text{var}(Y|X)=E[Y^2|X]-E[Y|X]^2 = E[Y^2|X]-\bigg(\frac{5x+15}{16}\bigg)^2$

Now we can solve for the remaining conditional expectation

$E[Y^2|X]=\sum_yy^2\cdot\frac{p_{X,Y}(x,y)}{p_X(X)}=\sum_y\frac{y^2(x+y)}{4x+10}=\frac{15x+50}{2x+5}$

So, the conditional variance is

$\text{var}(Y|X)=\frac{15x+50}{2x+5}-\bigg(\frac{5x+15}{16}\bigg)^2=-\frac{5\big(10x^3+85x^2-528x-2335\big)}{256(2x+5)}$

## 6

We can first define the distributions of the random variables

$X\sim\text{Uniform}([1,4])\quad\quad Y\sim\text{Uniform}([2,8])$

We can construct the joint PMF using the table:

|   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|
|X|1/16|2/16|3/16|4/16|3/16|2/16|1/16|1|
|4|0|0|0|1/16|1/16|1/16|1/16|1/4|
|3|0|0|1/16|1/16|1/16|1/16|0|1/4|
|2|0|1/16|1/16|1/16|1/16|0|0|1/4|
|1|1/16|1/16|1/16|1/16|0|0|0|1/4|
|$p_{X,Y}$|2|3|4|5|6|7|8|Y|

Now we can find expectations:

$E[X]=\frac{4+1}{2}=\frac52\quad\quad E[Y]=\frac{8+2}{2}=5\\\&\\$

We can also find the variances as

$\text{var}(X)=E[X^2]-E[X]^2=\sum_x x^2p_X(x)\space -\frac{25}4=\frac{30}{4}-\frac{25}{4}=\frac54\\\&\\$

Now we can find the covariance

$\text{cov}(X,Y)=E[XY]-E[X]E[Y]=\frac{55}4-\frac{25}2=\frac54$

So, the correlation coefficient is

$\rho=\frac{\frac54}{\sqrt{\frac54\cdot\frac52}}=\frac{\sqrt2}{2}$

## 7

We will assume the variables are uniformly distributed (chosen fairly) such that

$X\sim\text{Uniform}([1,10]\implies E[X]=\frac{11}{2}, \text{var}(X)=\frac{33}{4}\\\&\\$

Then, using what we learned in problem (2) and the given identity:

$E[Y]=\frac{1}{10}\sum_{x=1}^{10}E[Y|x]=\frac1{20}\sum_{x=1}^{10}x+1=\frac1{20}\bigg(\frac{10(10+1)}{2}+10\bigg)=\frac{13}{4}$

The variances are found using the given identities:

$\text{var}(X)=\frac{10}{12}\\\quad\quad\\ \text{var}(Y)=\frac1{10}\sum_{x=1}^{10}\bigg(\frac{x+1}2\bigg)^2-\frac{169}{16}=\frac1{40}\bigg(\sum_1^{10}x^2+2\sum_1^{10}x+10\bigg)\\=\frac1{40}\bigg(\frac{10(10+1)(20+1)}{6}+10(10+1)+10\bigg)=\frac{101}8$

To find the joint expectation, we must first find the joint PMF which we can do so using the conditional probability theorem:

$p_{X,Y}(x,y)=P(X\cap Y)=P(X)P(Y|X)\\=p_X(x)p_{Y|X}(y|x)=\frac1{10}\cdot\frac{1}{x}=\frac1{10x}\quad 1\le y\le x$

Then, using this probability we can find the joint expctation:

$E[XY]=\sum_{x,y}xy\cdot p_{X,Y}(x,y)=\sum_x\sum_y \frac{xy}{10x}=\frac1{10}\sum_{x=1}^{10}\sum_{y=1}^x y\\=\frac{1}{10}\sum_{x=1}^{10}\frac{x(x+1)}{2}=\frac{1}{20}\bigg(\sum_{x=1}^{10}x^2+\sum_{x=1}^{10}x\bigg)\\=\frac1{20}\bigg(\frac{10(10+1)(2(10)+1)}{6}+\frac{10(10+1)}{2}\bigg)=22$

Now, we can find the covariance

$\text{cov}(X,Y)=E[XY]-E[X]E[Y]=22-\frac{11}{2}\cdot\frac{13}{4}=\frac{33}{8}$

So, finally, the correlation coefficient is

$\rho=\frac{\frac{33}{8}}{\sqrt{\frac{33}{4}\cdot\frac{101}{8}}}=\frac{\sqrt{6666}}{202}$

## 8

### a)

The correlation coefficient for these random variables is defined as

$\rho=\frac{\text{cov}(X,Y=aX+b)}{\sqrt{\text{var}(X)\text{var}(Y=aX+b)}}$

We can first simplify these terms using their respective transformation rules

$\text{cov}(X,Y=aX+b)=a\cdot\text{cov}(X,X)=a\cdot\text{var}(X)\\$

So, we can simplify the correlation coefficient to

$\rho=\frac{a\cdot\text{var}(X)}{\sqrt{a^2\cdot\text{var}^2(X)}}=\frac{a}{|a|}=±1$

Thus, the correlation coefficient is maximized (by definition) when the random variable are linear combinations of each other.

### b)

We can start by expanding the numerator of the LHS and simplifying:

$uv+\frac{(u-v)^2}{2}=uv+\frac{u^2-2uv+v^2}{2}=\frac{u^2+v^2}{2}$

Now, the LHS = RHS, QED.

### c)

We can first suppose $U=V$﻿, then plugging in the variables we get:

$\frac{XY}{\sqrt{E[X^2]E[Y^2]}}+0=\frac{\frac{X^2}{E[X^2]}+\frac{Y^2}{E[Y^2]}}{2}$

We also know $U=V\implies X=Y$﻿, so

$\frac{X^2}{E[X^2]}=\frac{2\frac{X^2}{E[X^2]}}{2}\implies 1=1$

Since this is true, we can apply the property $U=V\implies X=Y$﻿ to the inequality:

$E[X^2]\le\sqrt{E[X^2]^2}\implies E[X^2]=E[X^2]$

I.e. this is the only “equality” case in the inequality when $U=V$﻿

### d)

We can begin with the inequality and dividing over the root so that:

$\frac{E[XY]}{\sqrt{E[X^2]E[Y^2]}}\le 1\quad:\quad \rho\le 1$

We can observe this is precisely correlation coefficient we found in (a) IF and ONLY IF $X,Y$﻿ are linear combinations of each other

### e)

We use the definition of the coefficient and transformation properties of the covariance

$\rho(X,X+Y)=\frac{\text{cov}(X,X+Y)}{\sigma_X\sigma_{X+Y}}=\frac{\text{var}(X)+\text{cov}(X,Y)}{\sigma_X\sigma_{X+Y}}$

📌

**SUMMARY  
**