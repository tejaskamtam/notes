---
area: ucla
quarter: Y3Q1
created: 2024-04-01 17:16
updated: Monday 1st April 2024 17:16:10
course: ECE 209AS
parent: ECE 209AS

title: 1 - Adversarial Robustness

layout: note

---
## Adversarial Perturbation (For Red-Teaming)
- Geometric perturbation - rotating, flipping images to misclassify, e.g. MNIST 7 -> 3 by rotating
- Noise - overlay noise onto images to misclassify, e.g. ![[Pasted image 20240401171953.png]]
- adding a destructive sentence to language inputs to misgenerate
- concat noise to RLHF to misclassify/mispredict action of the RL model
- can also be used to find better, nonlinear classification metrics
## Robustness
- outputting correct outputs for all inputs
- large input pace -> local robustness: outputting correct outputs on inputs similar to inputs in the training set -> accuracy
- Accuracy is not a great metric on the test set, though, due to the prob distribution of samples, so there are some low prob examples that have never been seen and will thus have low classification accuracy.
## Attacks
- targeted attacks - misclassify a specific label to some other label or any other label
- untargeted attack - misclassify all labels to any incorrect label
- e.g. we define a NN $f:X\to C$ for some inputs $x\in X$
- then given a target $t\in C\space :\space f(x)\neq t$ 
- then an adversarial example is given as $x'=x+\eta$ s.t. $f(x')=t$
- i.e., misclassification
### Types of Attacks
- white box attacks - attacker knows about model arch, params, etc.
- black box attacks - attacker knows arch (layers) but not params (weights)
### Fast Gradient Sign Method (FGSM)
- From the previous example:
$$\eta = \epsilon\cdot\text{sign}(\nabla_x\text{loss}_t(x)$$
- I.e., we grab the gradient w.r.t. the inputs for the bad (misprediction) class $t$ and sign function maps negative values to -1, 0 to 0, and positive to 1
- Because we want the loss of misclassification to go down (i.e. making it misclassify more), we subtract the loss so we move towards a lower loss -> optimizing misclassification
- Perturb the input:
$$x'=x-\eta$$

- Then we check and grab losses if $$f(x')=t$$
### Untargeted FGSM
- For the correct class $s$, we find some value (noise): $$\eta = \epsilon\cdot\text{sign}(\nabla_x\text{loss}_s(x)$$
- perturb positively because we want the loss to go up i.e. maximize loss and minimize correct predictions $$x'=x+\eta$$
- then check $$f(x')\neq s$$
### Concept of distance
- we want small but effective perturbations for attacks so we don't perturb the image to much and make a significant change
- so we need some metric for distance: norms to find sim $x\sim x'$ iff $$||x-x'||_p<\epsilon$$
- we usually look at L inf to find maximum noise and then reduce that: $$||\vec x||_\infty=\max(|x_1|,...,|x_n|)$$
- thus we want noise $\vec\eta$ s.t. $||\vec\eta||_p$ is minimized - a hard, discrete optimization problem
### The optimization problem
- ![[Pasted image 20240403170203.png]]
- Now, we consider some functions for obj that satisfy the constrained optimization problem: ![[Pasted image 20240403170247.png]]
	- Choice 1: ![[Pasted image 20240403170537.png]]
	- Choice 2: ![[Pasted image 20240403170546.png]]
#### (Naive) Gradient-based optimization
- gradient updates are circular in updating the objective function due to oscillation across the elements of the perturbation $\vec\eta$
	- after first step through we see the next steps may just update past updated values to the original values -> oscillation![[Pasted image 20240403170659.png]]
#### Regularization
- we can solve this issue using regularization of the perturbation by $\tau$ , so we replace: $$||\vec\eta||_{\infty}\to\sum_i\max(0,|\eta|-\tau)$$
- we see when applying $\tau$ we get the following updates ($\tau$ is presented as $\cdot$ in the slides): ![[Pasted image 20240403171132.png]]
## Projected Gradient Descent
- we project all noise values outside some bounding box to make the optimization faster and easier to update \[TODO: insert clip function from slides]
### Working Example
- \[insert slides on PGD w/ example
### Implementation Details
- projection is linear op for $L_{\infty}$
- finding efficient project spaces (convex regions) is an open problem - domain-dependent
- early stopping is usually implemented
- we also usually do a random walk from the initial random perturbation (usually ends up inside the clipped box instead of the corner example) instead of taking FGSM off the bat
### Tradeoff
\[insert table from slides here]

## Blue-Teaming against Adversarial examples
- models train on adversarial examples now
- measure both test accuracy and adversarial accuracy on adversarial examples and optimize model -> these accuracies are usually inversely proportional and may train oppositely (adv acc inc <-> test acc dec)
- making robust classifiers
	- empirically robust (attacks cannot find adversarial examples within the model's space)
	- certifiably robust (adversarial examples do not exist within model space)
### Optimization Problem for Robustness
\[insert slides on optimization]
#### PGD Defense Example
- start with mini-batch B of dataset D
- compute $B_\max$ by applying PGD attack:\[insert slide]
### Solution to empirically robust models
- the loss after adversarial training reduces the loss and frequency space to a very marginal area which limits the number/space of adversarial examples
- \[insert slide on loss change after adversarial training]