---
area: ucla
quarter: Y3Q1
created: 2024-03-19 16:16
updated: Tuesday 19th March 2024 16:16:49
course: CS 174A
parent: CS 174A

title: 16 - Misc Rendering - Procedural, Particle, Volumetric

layout: note

---
## Opacity
- introduce oopacity intensity 0-1 as $\alpha$
- apply this to color channels by multiplying over
### Composition of colors
- layered polys can be composited colors based on opacity
- straight - factor out opacity, just get composite color
- pre-multiplied - assuming colors given after opacity multiplied, find olor aand alpha w saame algo
![[Pasted image 20240319161825.png]]

## Procedural/Behavioral Models
![[Pasted image 20240319162337.png]]
## Particle Rendering
![[Pasted image 20240319162347.png]]
rendered as sprites, display color based on z-buffer or sprite which ever is on top 
render sprites (particles) always facing the front/camera ![[Pasted image 20240319162526.png]]

## Volume Rendering
- tesselation make "hollow" objects
- volume rendering allows us to make "solid" objects that can be sliced and can be "entered"
- usually nothing but ray casting (non-recursive) and parallel projection
- discretize volumetric objects to elements called "voxels"
	- each voxel can store some properties (scalars)
	- stored a small changes in the coordinate system
	- usually naturally ordered
	- ![[Pasted image 20240319163214.png]]
### Marching Cubes (Volumetric Rendering Algo)
- makes a poly mesh of iso-surfaces by looking at voxel coords ![[Pasted image 20240319163545.png]]
- iso surfaces in voxels: ![[Pasted image 20240319163929.png]]
- e.g. 2D marching squares, check if the color or other property is greater than a threshold, then determine the cases to render
	- ![[Pasted image 20240319163831.png]]
### Splatting Method
- "splat" the front facing (bc no PS) voxels of the object and composite (FTB or BTF) and splat it onto the screen to generate the footprint of the volumetric object
![[Pasted image 20240319164324.png]]
### V-buffer
- ray cast from eye through volume
- trilinear interp for properties of non-vertex location of a voxel
- accumulate color and opacity as ray passes through the volume ![[Pasted image 20240319164721.png]]
- parallel ray cast through each pixel (in parallel), choose t as sampling rate to determine how many voxels along the ray you will sample
- color composition is done FTB so no backface culling, just do composition above
![[Pasted image 20240319165122.png]]
- determine color using composition aalgo![[Pasted image 20240319165340.png]]
- where the transfer function can be specified ![[Pasted image 20240319165402.png]]
#### Optimization
![[Pasted image 20240319165528.png]]

## Incremental Formulas
![[Pasted image 20240319165857.png]]