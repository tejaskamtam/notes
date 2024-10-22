---
area: ucla
quarter: Y3Q1
created: 2024-03-19 01:50
updated: Tuesday 19th March 2024 01:50:03
course: CS 174A
parent: CS 174A

title: 13 - Mappings and Shadows

layout: note

---
## Texture Mapping
- pasttern mapping: wrap a pattern across a surface
- individual texture elements are Texels
- use texel color as diffuse color, index using $(s,t)$ texture coords
- index the surface using $(u,v)$ coords and map $(s,t)\to(u,v)$
### Aliasing
- usually due to sampling too few points per pixel
- due to points sharing texels, we might miss the texture map and end up with useless colors:
	- in this example we mapepd directly and everythign ended up white: ![[Pasted image 20240319020013.png]]
- we can anti-alias using **area average sampling**
	- e.g., take a square and color the average of that texel: ![[Pasted image 20240319020259.png]]
- or **MipMap**:
	- bilinear interp the $(u,v)$ coord of the object and map from $(s,t)$: 
		- ![[Pasted image 20240319020611.png]]
	- setting the u,v coords of the image to different values allows different layouts of texture mapping:
		- ![[Pasted image 20240319020722.png]]
## Bump and Displacement Mapping
- displacement maps actually displace the objects a little based on the map
	- B is the bump param that will usualyl given as a map per pixel or can be interp
	- B>0 => raise it up
	- B<0 => push it down
	- changes the actual geometry of the object: ![[Pasted image 20240319021243.png]]
- bump mapping only changes the direction of the normals
	- uses partial derivatives wrt to the surface/pixel index and point index
![[Pasted image 20240319020914.png]]

## Environmental Mapping
- reflection mapping
- use polar/spherical coords of reflected ray to map environment
- use the reflected ray R (vector) to map based on the direction of R
- maps are usually cubic or spherical
![[Pasted image 20240319021701.png]]

## Shadow Algos
- if a light ray does not touch the surface of a polygon/object, that point is in a shadow
- for object precision: shadow volume algo (old)
- for image precision: 2-pass z-buffer algo
- render shadows with ambient light
- mark shadows for specific light sources by running HSR from eye position
### Shadow Volume Method
- create shadow volumes by tracing the 3d object made by the 2d front facing faces ![[Pasted image 20240319022413.png]]
- add this shadow volume to database
- then do parity check to remove unnecessary volumes ![[Pasted image 20240319022426.png]]
### 2-Pass Z-buffer
- treat each light source as a spotlight
- then calculate this z-buffers for each light
- 1st pass
	- do z-buffer (2d full) from <u>light position</u>
	- this z-buffer will give us the z-value of the closest polygons to the light at each pixel
	- ![[Pasted image 20240319023112.png]]
- 2nd pass
	- do z-buffer (scanline or full) from eye position
	- for each visible pixel in scan line
		- check if the z-value that the poly's object belongs to in WS is farther than the z-buffer at that coordinate
		- if so, then it is in a shadow
	- we check (x,y,z) and see that z > z_blue_polygon thus it is in shadow ![[Pasted image 20240319023243.png]]
- e.g. 
	- ![[Pasted image 20240319023338.png]]
	- ![[Pasted image 20240319023346.png]]
#### Tradeoff
- simple to implement
- BUT, regires large shadow buffer, depth buffer resolution usually 8-bit
- umbra and penumbra aliasing may happen if shadows are far from the light