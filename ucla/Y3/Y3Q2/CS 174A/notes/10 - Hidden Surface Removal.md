---
area: ucla
quarter: Y3Q1
created: 2024-03-18 20:56
updated: Monday 18th March 2024 20:56:59
course: CS 174A
---
- Determine which objects are in front/behind and decide what to display
- order front to back (priority list) and prioritize those in front and ensure those are not transparent/translucent

## Backface Culling/Removal
- for a 3d object, depending on orientation, roughly half of the objects faces (if they are simple polyhedrons) the camera (front faces) while the others don't and are hidden (back faces)
- Given
	- N = outward normal vector of a face
	- P = point on the face
	- E = eye vector = Eye - P
- The face is a front face depends on space iff.:
	- World Space: $$N\cdot E > 0$$
	- Eye/Camera Space
		- Before mirror-x (RHCS): $$N\cdot(-P)>0\iff N\cdot P < 0 = N\cdot E > 0$$
		- After mirror-x (LHCS): $$N\cdot P > 0$$
	- Projection space (after perspective normalization): check if z-component of normal is neg: $$N_z < 0$$
## Painter's Algo
- object space algo
- sort all polygons by z-depth (front to back, FTB) from distance to the eye/cam
- scan convert polygons BTF => paint from back most poly to front most
### Limitations
- cyclic polygons
	- when the polygon is not completely sortable: ![[Pasted image 20240318214626.png]]
- intersecting polys
	- a poly intersects in front of another poly: ![[Pasted image 20240318214649.png]]
### Solution
- split polys into linearly z-separable then run Painter's

## Z-Buffer
- a screen space algo (2d projections of 3d objections onto the screen/viewport from WTV)
- create 2 buffers:
	- $zb[X_{resolution}][Y_{resolution}] = \inf$: set all pixels' z-value to inf
	- $cb[X_{res}][Y_{res}]=background$: set all pixels' color to backround
- for each pixel covered by a poly
	- calc z for poly at (x,y) (at that pixel)
	- if z < zb\[x\]\[y\] =>
		- zb\[x]\[y] = z
		- cb\[x]\[y] = color of poly
### Properties
- works on screen space so simple, efficient, precise
- polys scan-converted in random order (since we dont sort)
- no problems with cyclic/intersecting polys
### Limitations
- memory reqs color and depth for entire image (Every pixel in resolution)
- aliasing issues - if a pixel is overlapped by multiple polys: what do we color or set depth, we pick one
- transparency - since we overwrite based on the polygon at the front
- time complexity - depends on polygon complexity

## Scanline Z-buffer
- store 2 buffers: zb\[X_res], cb\[X_res]
- the scanline is the row of pixels @ x
- for each scanline, reset zb and cb
	- for each poly that intersects the scanline:
		- calc span - contiguous set of pixels on the scanline
		- for each pixel in span:
			- calc z for poly at (x,y)
			- if z < zb\[x]: zb\[x]=z, cb\[x]=color of poly
- ![[Pasted image 20240318220126.png]]
### Tradeoff
- same advantages as z-buffer
- less memory req than z-buffer
- BUT, regs multiple passes through database of polygons on the screen
- entire polygon is the same color
### Optimality (Efficiency)
- assuming planar polys
- specifically bilinear interpolation:
	- calc z of next pixel over by modifying prev z with a change in z=-A/C
- ![[Pasted image 20240318220424.png]]
$$z_{x+1,y+1}=-\frac{A(x+1)+B(y+1)+C}{C}=z_x-\frac AC -\frac BC$$