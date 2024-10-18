---
area: ucla
quarter: Y4Q1
created: 2024-10-03 12:06
updated: Thursday 3rd October 2024 12:06:41
course: CS 163
---
## Classification challenges
At the core is the semantic gap between an image and the idea of what is represented in the image. E.g., take the example of a chair
- viewpoint variation - must be robust to pictures from diff angles
- intraclass variation - within the class of chairs there are many types: stools, rollers, couch, etc.
- fine-grained categories - sublcasses of chairs: wooden, office, avocado?
- scene context - occlusion, cluttering of the object and other objects in the same image
- domain changes - art clip vs drawing vs photo of chairs
- material variation - leather, plastic, octopus?, etc.
- functionality - chair as a weapon, transportation, etc.
- cross-class similarity - chair vs sofa
# Image Classification
- Uses as a part of another system:
	- Game move prediction, next word prediction for I2T or T2I, self-driving etc
- computational - find edges, corners, colors, etc.
- ML approach - train a classifier
- MNIST, CIFAR10/100, ImageNet, Places365, LAION-5B
## Nearest Neighbor
- Nearest neighbor approach, reqs distance. Due to images being in grids we could use L1 (manhattan) dist to see similarity between training and test $$L_1 =d_1(I_2,I_2)= \sum_p \space \lvert I_1^p - I_2^p \rvert$$ whereas Euclidean (L2): $$L_2=d_2(I_1,I_2)=\bigg(\sum_p\space\big(I_1^p-I_2^p\big)^2\bigg)^{1/2}$$
- Example code: ![[Pasted image 20241003121808.png]]
- Training is O(1) for N samples (memorization)
- Testing O(N) - calc dist for each sample
- Bad bc slow training ok but NEED fast testing
### Variations - KNN
- Majority votes, add decision boundaries for samples not in set ![[Pasted image 20241003122126.png]]
- hyperparam of K reqs hyperparam finetuning/training
	- K=1 perfectly overfits training
	- split data into train, validation, test
	- K-fold cross validation, set different fold as validation on each set ![[Pasted image 20241003122311.png]]
- KNN is a universal approximator - as num samples to inf, it can perfectly represent any function that shows the pattern - subject to domain context
### Curse of Dimensionality
- for uniform coverage of the image space, number of training points grow exponentially: ![[Pasted image 20241003122600.png]]
## next time: conv net