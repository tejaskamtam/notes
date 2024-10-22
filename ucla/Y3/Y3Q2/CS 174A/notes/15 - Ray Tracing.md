---
area: ucla
quarter: Y3Q1
created: 2024-03-19 14:54
updated: Tuesday 19th March 2024 14:54:41
course: CS 174A
parent: CS 174A

title: 15 - Ray Tracing

layout: note

---
## Transmission and Reflected Rays
- recursive ray casting, we can decide recursive stack size
- at every intersetion, we have a relected ray AND a refracted ray called a transmission ray
- we can illluminate these points based on the the r,t rays
- these reflected rays are secondary rays and an spawn more reflected rays and transmission rays with other objets
![[Pasted image 20240319150052.png]]
### Direction of rays
- derived from real world ![[Pasted image 20240319150144.png]]
### Ray tree
- we can create a ray tree baed on secondary rays
- we also consider shadow rays
![[Pasted image 20240319150241.png]]
## Performance
![[Pasted image 20240319155523.png]]
![[Pasted image 20240319155811.png]]

## Limitations
- Surface "acne" from numerial precision of rays being off and misclassifying a point as in shadow -> a dark spot on the surface of the objet
- backward ray tracing means that if there is a refractive material ffrom the intersection point of an object to the LIGHT
	- then that point should actually be refracted in forward tracing, but bc we do back tracing, we're not able to do that
- aliasing isues usually happn when camera is far from objects bc rays diverge bw each pixel
	- spatial aliasing - overlapping object
	- temporal aliasing - object moves over time and may pop in and out bc rays miss
	- fix both by increasing sampling of rays
-  ![[Pasted image 20240319160750.png]]

## Stochastic RT
- fixes many problems b ut requires many ray samples per pixel
![[Pasted image 20240319160906.png]]
![[Pasted image 20240319161211.png]]