---
course: MATH 170E
area: ucla
created: 2023-03-15T20:05
updated: 2023-03-16T23:47
📕 courses:
  - "[[Math 170E- Probability Theory]]"
tags: math
---
# Definitions

---

# Big Ideas

---

## Continuous Conditional Distribution

### Joint PDF

$f_{Y|X}(y|x)=\frac{f_{X,Y}(x,y)}{f_X(x)}$

- Normalization

$\int_\R f_{Y|X}(y|x)\space dy=1$

### Law of Iterated Expectation and Variance

$\mathbb E\big[\mathbb E[Y|X]\big]=\mathbb E[Y]=\mathbb E[Y]=\sum_{x\in S_X}\mathbb E[Y|x]\cdot p_X(x)\\=\sum_{x\in S_X}\bigg(\sum_{y\in S_Y}y\cdot p_{Y|X}(y|x)\bigg)\cdot p_X(x)$

$\text{var}(Y)=\mathbb E\big[\text{var}(Y|X)\big]+\text{var}\big(\mathbb E[Y|X]\big)$

  

# Resources

---

![[/Lecture_22_filled.pdf|Lecture_22_filled.pdf]]

📌

**SUMMARY  
**