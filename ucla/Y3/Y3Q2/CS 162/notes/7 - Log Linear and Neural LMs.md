---
area: ucla
quarter: Y3Q1
created: 2024-02-06 12:24
updated: Tuesday 6th February 2024 12:24:55
course: CS 162
📕 courses:
parent: CS 162

title: 7 - Log Linear and Neural LMs

layout: note

---
## Log-Linear Language Models
- we want to create a conditional distribution $p(y|x)$ from a scoring function, we define as $$\text{score($x$,$y$)}=\sum_k\theta_k\cdot f_k(x,y)=\vec\theta\cdot\vec f(x,y)$$ where $\theta$ is the weight of feature $k$ and the feature function can be many representations (3.g., counts, binary, strength)
- we can make the conditional probability distribution wrt the weights as ![[Pasted image 20240206123535.png]]
### Training
- given $n$ training instances and $f_1,f_2,...$ feature functions, we maximize the log probs of training instances conditioned on the weights: $$\sum_{i=1}^n\log\space p_{\vec\theta}(y_i|x_i)$$
	- originally it is actually a joint probability distribution that we prod over but easier to sum over logs ![[Pasted image 20240206123747.png]]
### Gradient Descent
- the thing we want to improve is make the prob dist approach the RHS ![[Pasted image 20240206124519.png]]
#### Cross Entropy
- same as neg log likelihood of our model ![[Pasted image 20240206130351.png]]
### Generalization and OoD  (unseen) samples
- ![[Pasted image 20240206131007.png]]
## Neural LM
### NN Review
- idea for NN for LMs - FFNN (3-MLP)
	- ![[Pasted image 20240206132847.png]]
- forward pass ![[Pasted image 20240206132225.png]]
- backprop ![[Pasted image 20240206132435.png]]
- weight update
	- ![[Pasted image 20240206132715.png]]


### Word Embeddings
- map tokens to dense low-dim vecs to create prob dists over
	- ![[Pasted image 20240206133057.png]]
- these vector representations allow similarity comparison and analogies
- we construct LMs in such a way to learn the model and representations i.e., update embeddings along with the weights
### Objective Function
- likelihood is softmax, we want to maximize softmax![[Pasted image 20240207021039.png]]
- ![[Pasted image 20240207021113.png]] ![[Pasted image 20240207021126.png]]

