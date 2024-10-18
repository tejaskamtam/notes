---
course: CS M146
area: ucla
created: 2023-06-05T14:16
updated: 2023-07-10T21:18
📕 courses:
  - "[[CS M146- Machine Learning]]"
---
# Supplemental

- issue with model complexty
    
    ![[/Screenshot_2023-06-05_at_2.32.15_PM.png|Screenshot_2023-06-05_at_2.32.15_PM.png]]
    
- DNNs became popular do to 3 advancements: algorithms, compute, data
- algorithmic advancements (optimization/training and generalization/testing) in 3 spheres: architectures, regularizers, optimizers
- convolve - slide a filter over the image spatially and computing dot products → makes a smaller convolved image
- Jacobian - gradients
- Hessian - 2nd order gradients, gradients of jacobian

# Lecture

- DNNs became popular do to 3 advancements: algorithms, compute, data
- algorithmic advancements (optimization/training and generalization/testing) in 3 spheres: architectures, regularizers, optimizers

## Neural Net Architectures

### Early Architctures

- early archs were MLPs (multi-layer perceptrons) - fully connected (dense) layers
- used sigmoid and tanh non-linear activations
- new architectures focused on:
- better connectivity
    - CNNs for translational invariance in object recognition
    - archs for many modalitites: RNNs CNNs, transformers, graph NNs
- better backprop
    - new activations (ReLU) or normalizing activations for vanishing/exploding gradients

### Convolutional Neural Networks

- Architecture
    
    ![[/Screenshot_2023-06-05_at_2.44.22_PM.png|Screenshot_2023-06-05_at_2.44.22_PM.png]]
    
- Fully connected layer → outputs
    
    ![[/Screenshot_2023-06-05_at_2.44.46_PM.png|Screenshot_2023-06-05_at_2.44.46_PM.png]]
    
- Convolutional Layer
    - applies weight matrix called a filter - a smaller subset of pixels of the image
        
        ![[/Screenshot_2023-06-05_at_2.50.43_PM.png|Screenshot_2023-06-05_at_2.50.43_PM.png]]
        
    - uses the filter (e.g. 3x5x5) across the image (e.g. 3x32x32) to make an activation map (1x28x28) and repeats for some number of filters
        
        ![[/Screenshot_2023-06-05_at_2.54.12_PM.png|Screenshot_2023-06-05_at_2.54.12_PM.png]]
        
    - stack these filters (e.g. 6x3x5x5 + 6x1 bias) to get stacked activation maps (6x1x28x28) → output image (6x28x28)
        
        ![[/Screenshot_2023-06-05_at_3.08.55_PM.png|Screenshot_2023-06-05_at_3.08.55_PM.png]]
        
    - filters are the weights → assignd randomly then updated wiith gradient descent
- Batched convolution
    
    - e.g. 2x3x32x32 images
    
    ![[/Screenshot_2023-06-05_at_3.11.03_PM.png|Screenshot_2023-06-05_at_3.11.03_PM.png]]
    
      
    
- Non-linear activations between convolutions
    
    - can use activations between layers
        
        ![[/Screenshot_2023-06-05_at_3.13.33_PM.png|Screenshot_2023-06-05_at_3.13.33_PM.png]]
        
    - MaxPool(Relu(x)) = Relu(MaxPool(x))
    
      
    

## Neural Net Regularizers

### Dropout

- at every training iteration, we drop hidden nodes with certain probability (we disable the droupout at testing)
- this means after the node is dropped, backprop does not update the weights to that node → BUT that node (And the full net) is still used to compute test predictions → reduces overfitting on node by node basis → ensembling

## Optimizing DNNs

- loss is highly non-convex in DNNs wrt parameters
    
    ![[/Screenshot_2023-06-05_at_3.42.28_PM.png|Screenshot_2023-06-05_at_3.42.28_PM.png]]
    
- trying to find curvature using Hessian is $O(d^2)$﻿ so no

### Momentum

- use a heurtic to approx rate of change of gradient and use for first-order optimization
- consider a noisy cosine func - we can make a smooth estimation using moving averages as momentum using a hyperparam $\beta$﻿
    
    ![[/Screenshot_2023-06-05_at_3.45.39_PM.png|Screenshot_2023-06-05_at_3.45.39_PM.png]]
    
    ![[/Screenshot_2023-06-05_at_3.47.50_PM.png|Screenshot_2023-06-05_at_3.47.50_PM.png]]
    
- we can use this momentum to regularize (smooth) gradients or MBGD
    
    ![[/Screenshot_2023-06-05_at_3.50.23_PM.png|Screenshot_2023-06-05_at_3.50.23_PM.png]]
    
      
    
- find the GIF for optimizer comparison

# Discussion

  

# Resources

---

![[/16_-_Neural_Networks_-_Deep_Learning.pdf|16_-_Neural_Networks_-_Deep_Learning.pdf]]

  

📌

**SUMMARY  
**