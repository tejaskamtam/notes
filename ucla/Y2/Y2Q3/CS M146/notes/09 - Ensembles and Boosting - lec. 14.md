---
course: CS M146
area: ucla
created: 2023-05-15T14:02
updated: 2023-06-13T22:49
📕 courses:
  - "[[CS M146- Machine Learning]]"
parent: CS M146

title: 09 - Ensembles and Boosting - lec. 14

layout: note

---
# Supplemental

- Classifiers:
    - Logistic regresion
    - perceptrons
    - decision trees
    - kNN
    - kernalized linear models
    - SVMs

# Lecture

## Ensemble Learning

- given. a set of base classifiers $h_1,…$﻿ → build an enemble classifier $H(\bm x)$﻿ that combines decisions of the base classifiers (usually in sequence): majority vote, weight some base classifiers more than others for differentregions of instance space
- good classifiers work well if each base has low error rates and each makes a dfferent set of mistakes → diversity

### Combining Classifiers - Simple

- averaging
    
    ![[/Untitled 27.png|Untitled 27.png]]
    
- weighted averaging
    
    ![[/Untitled 1 18.png|Untitled 1 18.png]]
    
- gating
    
    ![[/Untitled 2 17.png|Untitled 2 17.png]]
    
- stacking
    
    ![[/Untitled 3 14.png|Untitled 3 14.png]]
    

### Achieving Diversity

![[/Untitled 4 13.png|Untitled 4 13.png]]

## Bagging - vary the training set (one-shot)

### Bootstrap Replication

- Given $n$﻿ training examples. → construct new training set. by sampling $n$﻿ intances with replacement → creates a new training set of size $n$﻿ with possible repetitions using only the indices (does not depend on true dataset)
- i.e. excludes ~30% of the training instances on average due to repeats
    
    ![[/Untitled 5 11.png|Untitled 5 11.png]]
    
- i.e. replicates your training set WITH repetitions

### Bagging

- create multiple bootstrap replicates of the training set
- train a base classifer for each replicate → gives $n$﻿ different trained classifiers
- estimate classifier performance uing out-of-bootstrap data
- average output of all classifiers as a final hypothesis

### Random Forest

- Bagging but changes features of the training intances as well
- construct decision trees on bootstrap replicas
- do not. prune trrees → estimate tree on out-of-bootstrap data
- average output of all trees

![[/Untitled 6 11.png|Untitled 6 11.png]]

  

## Boosting

### AdaBoost - adaptive boosting

- Kearn and Valiant (1988,1989): “can a set of weak models createa ingle strong learner?”
- Freund and Schapire (1997): Adaboost → yes (great theoretical and empirical performance)

![[/Untitled 7 11.png|Untitled 7 11.png]]

![[/Untitled 8 10.png|Untitled 8 10.png]]

![[/Untitled 9 8.png|Untitled 9 8.png]]

- $\epsilon$﻿ is theerror measured as miclasification rate
- error < 0.5 → better than random→ assignd weight $\beta$﻿ > 0
- incorrect predictions → boost their weight

  

### Full AdaBoost algo

![[/Untitled 10 6.png|Untitled 10 6.png]]

### Training a model on points with weights

- akin to traning a modelona set where weihtedpoints simply occur more often in thee set

![[/Untitled 11 5.png|Untitled 11 5.png]]

![[/Untitled 12 5.png|Untitled 12 5.png]]

### Dynamic Behavior

![[/Untitled 13 5.png|Untitled 13 5.png]]

# Discussion

  

# Resources

---

![[/11_-_Ensembles.pdf|11_-_Ensembles.pdf]]

📌

**SUMMARY  
**