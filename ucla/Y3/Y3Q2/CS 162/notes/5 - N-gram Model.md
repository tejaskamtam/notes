---
area: ucla
quarter: Y3Q1
created: 2024-01-29 08:10
updated: Monday 29th January 2024 08:10:28
course: CS 162
📕 courses:
parent: CS 162

title: 5 - N-gram Model

layout: note

---
## Practicals
- models $$p(x_{\{t:t+n\}})\quad\text{OR}\quad p(x_{t+n}|x_{\{t:t+n-1\}})$$
- we take (negative) log probs bc prob off words is very small
	- reg probs in range `[0,1]` and log probs map to `(-inf, 0)`
## Padding
- for getting BOS and EOS context, we pad with those tokens
- set $=w_0=\text{<BOS>}$ and $w_{n+1}=\text{<EOS>}$ 
- we pad extra tokens in the beginning with `<BOS>` depending on the n in n-grams
- then, for our trigram example:
	- ![[Pasted image 20240129082143.png]]
	- ![[Pasted image 20240129082125.png]]
	- ![[Pasted image 20240129082133.png]]
- alternatively,  combine all examples/instances into one long corpus, now probs of punctuation show behavior at edges in the corpus
- tokens are also lowercased to decrease complexity and to model the same word regardless of capitalization
## Evaluation
- intrinsic vs extrinsic metrics - extrinsic preferred, but we look at intrinsic
	- ![[Pasted image 20240129082853.png]]
- assume over the corpus summed over all sentences in the language: $\sum_{S\in L} P(S) = 1$ ![[Pasted image 20240129083307.png]]
### Cross-Entropy
- these products will underflow, so we take neg log and sum (to get a cost s.t. low log = high probs) ![[Pasted image 20240129083523.png]]
- the higher the better probs
- then normalize by the number of words N in the corpus to get **cross-entropy** ![[Pasted image 20240129083559.png]]
- the lower the better
### Perplexity
- cross-entropy values will be really small so we compare after exponentiation: ![[Pasted image 20240129084433.png]]
- the lower the better still
- roughly represents number of tokens needed for context![[Pasted image 20240129084903.png]]
## MLE - out-of-distribution word sequences
- we can count and divide token counts for a given word sequence made up of tokens present in the corpus even if the sequence itself is out-of-distribution/data ![[Pasted image 20240129093138.png]]
	- ![[Pasted image 20240129093048.png]]
- but this MLE has P=0 if the seq is not in the corpus, so we need assumptions
### Markov Assumption - Independence
- joint probability of sequence tokens is roughly the probability of the token conditioned on the immediate previous token
- we expand this to n-gram ![[Pasted image 20240129093750.png]]
- new MLE probs ![[Pasted image 20240129093907.png]]
- still, unseen words have 0 probs -> smoothing