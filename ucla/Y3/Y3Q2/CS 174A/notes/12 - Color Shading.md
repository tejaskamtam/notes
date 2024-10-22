---
area: ucla
quarter: Y3Q1
created: 2024-03-19 01:22
updated: Tuesday 19th March 2024 01:22:21
course: CS 174A
parent: CS 174A

title: 12 - Color Shading

layout: note

---
## Flat Shading
- apply same color across a tesselated polygonal surface of an object
- i.e., N is constant across the polygon/face
- if L far enough, $N\cdot L$ is also const across the face
- similar for viewpoint -> shading is bad
	- ![[Pasted image 20240319012917.png]]

## Gouraud Smooth Shading
- intensity/color interpolation shading
- in WS: find I (intensity/color) at each vertex and **illuminate vertices (normals)**
- in SS: interpolate across the polygon face using vertex normals
- store normals along with vertices of the object faces
### Limitations
- thin polygons not great for interp
- rotating polygons -> see a polygon outline
- specular reflection with larg polys at center and vertex
- mach banding not eliminated (sharp color transitions of shades of the same color)
### Barycentric Interpolation
- interpolate with percentages so points closer to one endpoint of a segment are more of the color we want ![[Pasted image 20240319013407.png]]
- use with bilinear interpolation
### Bilinear interp
- interp across 2 edges
- usually along scanline and intersecting lines
- do using collinearity with closest poly vertices
	- ![[Pasted image 20240319013710.png]]
	- ![[Pasted image 20240319013720.png]]
- e.g., LOOOK
	- given ![[Pasted image 20240319014736.png]]
	- find scan line interps: ![[Pasted image 20240319014839.png]]
	- find bilinear interps from scanline interps: ![[Pasted image 20240319014908.png]]
- 
## Phong Smooth Shading
- in WS: illuminate each point inside poly
- in SS: interpolate across face using normals at each point
- normal vector interpolation shading
- calc intensity at each pixel
- interp normals similar to others -> norm
- more computation but looks smoother
- ![[Pasted image 20240319013905.png]]
### Limitations
- similar to Gouraud, polygon silhoutte
![[Pasted image 20240319014021.png]]

## Non-Photorealistic Shading
- determine colors based on normal directions
- useful to create silhouttes
- ![[Pasted image 20240319015328.png]]
