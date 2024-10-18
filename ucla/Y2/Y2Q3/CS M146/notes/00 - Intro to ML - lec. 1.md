---
course: CS M146
area: ucla
created: 2023-04-03T14:42
updated: 2023-05-08T00:22
📕 courses:
  - "[[CS M146- Machine Learning]]"
---
# Definitions

---

# Big Ideas

---

## Types of Learning

### Supervised

- used for prediction
- given a labeled training set → learn a pattern/mapping for test set
- Regression → labels are continuous
- Classification → labels are discrete
- uses features/attributes to train on: tumor size, age, etc.

### Unsupervised

- for detecting patterns
- given unlabeled data → find patterns (intrinsic structure)

### Reinforcement

- used to interact in an environment
- not input data, just the environment → trial-and-error
- usually given a utility function (goal) → rewards the model for correct interactions

## Machine Learning Goal

Given:

- a training dataset consists of $n$﻿ labelled training instances for each has
- input features/attributes: $\vec X = [\vec x^{(1)},…,\vec x^{(n)}]$﻿ where $x^{(i)}\in \R^d$﻿ for $d$﻿ features
- labels $\vec y=[y^{(1)},…,y^{(n)}]$﻿ where $y^{(i)}\in\R$﻿ or f we know limits (e.g. price >0) $\R^+$﻿

Output:

- hypothesis function: $h:\R^d\to\R$﻿ from a hypothesis class (a family of functions e.g. for linear regression all linear functions) $h\in \mathcal H$﻿ s.t. $h(\vec x)\approx y$﻿

  

Steps for learning $h$﻿:

1. Represent (find) hypothesis class $\mathcal H$﻿
2. Define a loss (function)
3. Optimize for the best $h\in \mathcal H$﻿ s.t. $h(\vec x)\approx y$﻿

# Resources

---

[](https://www.notion.soundefined)

📌

**SUMMARY  
**