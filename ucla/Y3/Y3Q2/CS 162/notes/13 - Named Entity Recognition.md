---
area: ucla
quarter: Y3Q1
created: 2024-03-11 02:33
updated: Monday 11th March 2024 02:33:36
course: CS 162
📕 courses:
parent: CS 162

title: 13 - Named Entity Recognition

layout: note

---
## Named Entity Problem
- anything that can be referred to with a proper name
- 4 common tags: Person (PER), Location (LOC), Organization (ORG), Geo-Political Entity (GPE)
- but also dates, times, prices
- e.g.
	- ![[Pasted image 20240311023818.png]]
### Type Ambiguity
- Sense of words (different semantic meanings) can have different types of NER tags: ![[Pasted image 20240311023921.png]]
### BIO Tagging
- set up as a sequence tagging problem
- use BIO tagging to distinguish start and end of consecutive separate entities ![[Pasted image 20240311024137.png]]
### Algorithms
- HMM, MEMM/CRF (conditional random fields)
- neural sequence models (RNNs, LSTMs, Transformers)
- Neural CRF models
- LLMs (Bert, finetuned, etc.)

## Neural Sequence Tagging
### RNNs alone
- BIO tags as outputs for token inputs: ![[Pasted image 20240311024458.png]]
- works but completely ignores interdependencies of output tags
### MEMM w/ RNNs (LSTMs)
- concat hidden states with (previous) tags
- thus each tag has an embedding (hidden state)
- then softmax wrt to the linear transformation of these embeddings (lin. trans. done using $W^p$) to get the probs for each tag
![[Pasted image 20240311024634.png]]
using LSTM params: ![[Pasted image 20240311024651.png]]
### MEMM w/ Transformers
- concat contextualized embeddings (outputs) with previous tags to create contextualized tags
- then lin transform with $W^p$
- then softmax to select the probs of each tag
![[Pasted image 20240311024721.png]]
using transformer params: ![[Pasted image 20240311024738.png]]
## Pretrained LLMs for NER
- e.g. pretrain BERT for seq tagging
- then use it to create output embeddings and make preds as BIO tags: ![[Pasted image 20240311025359.png]]
- then softmax on the output embeddings to get probs of tags