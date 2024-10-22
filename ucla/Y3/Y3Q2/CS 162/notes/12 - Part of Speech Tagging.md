---
area: ucla
quarter: Y3Q1
created: 2024-02-26 08:03
updated: Monday 26th February 2024 08:03:58
course: CS 162
📕 courses:
parent: CS 162

title: 12 - Part of Speech Tagging

layout: note

---
## Background
- effort to add is high so usually not used
- when used, usually as features
### Ambiguity
- each sense of a word can represent a diff POS tag
	- ![[Pasted image 20240226082857.png]]
- Most word types (the unique word) are not ambigous (only 11.5% are)
- BUT, most word tokens ARE (40% are)
### Baselines
- average tagged disagreement on HF is 3.5%
- baseline i pick the most frequent tag for that word type - 90%
	- 93% with Penn Treebank Tags
### Tagging Approaches
- rule based: human rules based on knowledge of linguistics
- learner based: trained on human created corpora like Penn Treebank
	- statistical models - Hidden Markov (HMM), Max Entropy Markov (MEMM), Conditional Random Field (CRF)
	- neural - RNN, LSTMs
	- both - neural CRF
## Sequence Tagging Problem
- each token (word) in a sequence is assigned 1 tag
- tags are usually dependent on their neighbor tags
- so, w may use classification model but w lose dependent info in tagging
## Classification - Noun Phrase (NP) Chunking
- group together noun phrases
### Shallow Parsing
![[Pasted image 20240226085605.png]]
### BIO Tagging
- Introduces 7 unique tags
![[Pasted image 20240226085631.png]]
### Limitations
- dependency between classified tags
![[Pasted image 20240226085914.png]]
## Hidden Markov Model (HMM)
- a **generative model** (models prob dist of the tokens) that assume states are generated from hidden states
- states follow a Markov chain
- states are not observed (no percepts)
- each state stochastically emits an observation ![[Pasted image 20240226091351.png]]
- e.g., ![[Pasted image 20240226091417.png]]
### Notation
- K is num of POS tags
- M is num of words
![[Pasted image 20240226091500.png]]
- to get the probability of the sequence (the above is joint): $$P(x_1,...,x_n)=\sum_y p(x_1,...,x_n,y_1,...,y_n)$$
- Inference - find the most probable state seq (POS tag seq) given an input sentence: $$P(y_1,...,y_n|x_1,...,x_n)=$$
- Learning - calculate $(\pi, A, B)$ from observations: $$TBA$$
### Inference: Trellis Diagram
- create a forward DAG where each edge has the transition probability and every node has the emission probability given the token at that layer
- In this image, the first layer is assumed "The" (most probable)![[Pasted image 20240226095132.png]]
- thus we maximize over the sum of all possible tag sequence (maximum a posteriori) ![[Pasted image 20240226095257.png]]
- ![[Pasted image 20240308155643.png]]
- e.g., ![[Pasted image 20240226095313.png]]
- but this is too slow, so we need a faster algo (Viterbi)
### Training
- can be done supervised (given $<\vec x_i, \vec y_i>$) or unsupervised given only $\vec x_i$
- learn HMM($\pi$, A, B)
	- $\pi$: initial probs
	- A: transition probs
	- B: emission probs
#### Supervised
- do MLE on each of the training params of HMM (using count and divide)
- ![[Pasted image 20240311022117.png]]
### Benefits/Limitations
- + can do unsupervised training
- - no feature selection
## Viterbi Algo (Inference)
- DP on Trellis
![[Pasted image 20240311022922.png]]
### Recursive
- ![[Pasted image 20240308155742.png]]
- ![[Pasted image 20240308155912.png]]
- ![[Pasted image 20240308155932.png]]
### Tabular
![[Pasted image 20240308160246.png]]
## Maximum Entropy Markov Models (MEMM)
- discriminative models $P(y|x)$
- models the tag probs given the sequence/token
- MEMM is the conditional model, models "cliques" bc we can use Markov independence assumption ![[Pasted image 20240311022309.png]]
- ![[Pasted image 20240311022435.png]]
- thus we can use any cls, e.g. logistic regression model, perceptron: ![[Pasted image 20240311022619.png]]
- e.g. ![[Pasted image 20240311022645.png]]
### Training
- only supervised bc its a classifier
- same as any other log-linear model (or cls): ![[Pasted image 20240311022738.png]]
### Inference
- Greedy (local) on trellis is still not optimal
- so we need "joint inference": using DP
- thus, use the same Viterbi but with the different score
![[Pasted image 20240311022909.png]]
### Benefits/Limitations
- + rich feature representation of inputs using feature function/kernel
- + discriminative predictor instead of joint
- - no unsupervised training
- - label bias problem