---
course: CS M146
area: ucla
created: 2023-04-17T15:31
updated: 2023-05-08T08:48
📕 courses:
  - "[[CS M146- Machine Learning]]"
---
# Supplemental

- any event $E\in\mathcal E$﻿ s.t. $0\le P(E)\le 1$﻿
- sum of probs $1=\sum_{E\in\mathcal E}P(E)$﻿
- logistic regression is a classification model
- $\log$﻿ is always base $e$﻿ i.e. $\log\implies\ln$﻿
- loss functionin classification is binary or softmax cross-entropy loss

# Lecture

### Classification using Probability

- instead of predicting the class, predict the probability that inctance belongs to that class i.e. $P(y|\bm x)$﻿
- binary calssification: $y\in\{0,1\}$﻿ as events for an input $\bm x$﻿

## Logistic Regression

### Logistic (Sigmoid) Regression Model/Func

- hypothesis function is the probability in [0,1] i.e. $P_{\bm\theta}(y=1|\bm x)$﻿

$h_{\bm\theta}(\bm x)=g\big(\bm\theta^T\bm x\big)\quad \text{s.t.}\quad g(z)=\frac{1}{1+e^{-z}}$

![[/Untitled 31.png|Untitled 31.png]]

$h_{\bm\theta}(\bm x)={1}\bigg /\bigg[{1+e^{-\bm\theta^T\bm x}}\bigg]$

![[/Untitled 1 21.png|Untitled 1 21.png]]

### Interpreting Hypothesis function

- hypo func gives probability label=1 given some input, e.g.

![[/Untitled 2 20.png|Untitled 2 20.png]]

- logistic regression assumes the log odds is a linear function of $\bm x$﻿
    
    $\log\frac{P(y=1|\bm x;\bm\theta)}{P(y=0|\bm x;\bm\theta)}=\bm\theta^T\bm x$
    

![[/Untitled 3 16.png|Untitled 3 16.png]]

### Non-Linear Decision Boundary

- we can applya basis function expansion to features just like we did for linear regression

![[/Untitled 4 15.png|Untitled 4 15.png]]

- NOTE: Loss functions don’t need to be averaged bc minimization via gradient descent will work the same regardless

### Loss Function

- loss of a single instance

$\ell(y^{(i)},\bm x^{(i)},\bm\theta)=\begin{cases}-\log \big(h_{\bm\theta}(\bm x^{(i)})\big) & y^{(i)}=1\\$

- logistic regression loss

$J(\bm\theta)=\sum_i^n\ell(y^{(i)},\bm x^{(i)},\bm\theta)$

$J(\bm\theta)=-\sum_i^n\bigg[y^{(i)}\log h_{\bm\theta}(\bm x^{(i)})+\big(1-y^{(i)}\big)\log\big(1-h_{\bm\theta}(\bm x^{(i)})\big)\bigg]$

### Intuition behind loss

- non-linear loss implies largely wrong guesses result in much higher loss than less wrong guesses

![[/Untitled 5 13.png|Untitled 5 13.png]]

### Regularized Loss Function

- Given the loss function

$J_{\text{reg}}(\bm\theta)=J(\bm\theta)+\frac\lambda2\|\bm\theta_{1:d}\|_2^2$

- note the L2 norm is from index 1 to $d$﻿
- we don’t regularize basis

### Gradient Desceent

- weight updates (simultaneous) - similar as lin. reg. and perceptrons

$\theta_j\leftarrow\theta_j-\alpha\frac{\partial}{\partial\theta_j}J(\bm\theta)$

![[/Untitled 6 13.png|Untitled 6 13.png]]

## Multi-Class Classsification

![[/Untitled 7 13.png|Untitled 7 13.png]]

# Discussion

# Resources

---

![[/4_-_Logistic_Regression.pdf|4_-_Logistic_Regression.pdf]]

📌

**SUMMARY  
**