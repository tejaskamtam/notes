---
area: ucla
quarter: Y3Q1
created: 2024-03-19 02:35
updated: Tuesday 19th March 2024 02:35:45
course: CS 174A
---
## Backward Ray casting
- a WS or ES algo
- Forward ray casting is hard:
	- ![[Pasted image 20240319142030.png]]
	- 
- Backward ray casting: hoot a ray FROM eye -> through pixel -> intersect with all objects in the world space
- NOTE for complex polygons/polyhedrons, we can draw bounding boxes to make intersection calculations easier
	- ![[Pasted image 20240319145650.png]]
- ![[Pasted image 20240319142305.png]]
### Step 1
- find coords of the ith pixel using the half angle
- then generate the ray (in ES) from eye (origin) through the center of the pixel using the x,y coords of the pixel, then z is at z=1 (we position the grid representation of the viewport/screen at z=1)
![[Pasted image 20240319142817.png]]
### Step 2
- check for intersection with each object
- if there is an intersection, then calc intersection illumination
### Casting in WS: need to factor in eye coords
![[Pasted image 20240319144831.png]]
## Ray casting Spheres
- pick the closest intersection of an intersected sphere
- find the normal at that point: $N=P-P_c$ 
	- where P is the intersection point
	- $P_c$ is the center of the intersected sphere
$B^2-4AC<0\implies$ no intersection
$B^2-4AC=0\implies$ 1 intersection
$B^2-4AC>0\implies$ 2 intersections, choose the closest (smallest t)
![[Pasted image 20240319143619.png]]
where we determine A,B,C as:
![[Pasted image 20240319143643.png]]
## Ray casting Polygons
- if planar polygon, then normal is A,B,C
- else, interp normal given vertex normals
- after plugging ES ray with plane, we solve for the interp param
$$t=-\frac{D}{Ax_p+By_p+C}$$
![[Pasted image 20240319144154.png]]