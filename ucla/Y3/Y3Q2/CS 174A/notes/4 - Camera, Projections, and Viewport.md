---
area: ucla
quarter: Y3Q1
created: 2024-01-30 19:09
updated: Tuesday 30th January 2024 19:09:02
course: CS 174A
📕 courses:
parent: CS 174A

title: 4 - Camera, Projections, and Viewport

layout: note

---
## Eye Space
- params
	- eye location
	- center of interest
	- tilt angle or top point
- we define the camera in the World space ![[Pasted image 20240201183104.png]]
- we create bases based on the following calculations
### Basis
- normalize to get unit vectors for basis - align as column vectors
$$\vec k = P_{ref=COI}-P{eye}=\vec E$$
$$\vec i= \vec v_{top=up}\times \vec k$$
$$\vec j=\vec k\times\vec i$$

- however, now $\vec i$ is now positive in the LHCS, so to fix this, we mirror it i.e. negate s.t. $\vec i \leftarrow -\vec i$
	- ![[Pasted image 20240201184017.png]]
- the eye basis now points $\vec k$ in line with the COI so greater magnitudes of $\vec k$ sends the object farther back away from the camera at the origin of the eye space (VCS)
## Viewport Idea
- we can take a point and project it to the viewport by applying a single amtrix that is the cross product of multiple matrices: transformation, eye, projection, etc. $$\text{True Position}=[PM][EM][TM]P$$
- then send that to the viewport; each matrix is 4x4 and the point is 4x1
## Projections
- orthographic projections
	- ![[Pasted image 20240201184856.png]]
	- ![[Pasted image 20240201184910.png]]
### Parallel projections
- the canonical view volume is the unit parallel projection with $$x\in(-1,1),\space y\in(-1,1),\space z\in(0,1)$$
- given a volume the view volume dimension are -W to W width, -H to H and distance D=far point - near point ![[Pasted image 20240201184924.png]]
- the parallel projection matrix is the identity ![[Pasted image 20240201185452.png]]
### Perspective Projection
- NOTE: slides are different
- square projection viewport
	- ![[Pasted image 20240201185817.png]]
- the half angle is angle wrt to x-axis from the z/k axis to the edge of the view volume to one side, the area swept by $(-\theta,\theta)$ is the width of the view volume
#### Normalization
- the projection plane: $(x',d)$ is the near plane that is a distance $d$ away from the eye space origin
- the object (a point: $(x,y)$) is placed on the far plane at a distance $F=x$, then the projected x value on the projection plane is $$\frac{x'}d=\frac xz\quad s.t.\quad x'=\frac{x}{z}\cdot\frac d W = \frac{x}{z\tan\theta}$$
- here $W$ is the range of x-values swept by the half angle on the projection plane
- similarly for the y-axis, where H is like W $$y'=\frac{y}{z}\cdot \frac dH=\frac{y}{z}\cdot \frac dH\cdot\frac WH=\frac{yA_r}{z\tan\theta}$$
- however for z-axis everything collapses to the projection plane so it is a constant $$z'=\frac1{\tan\theta}$$
- the division of $z\tan\theta$ is known as **perspective division** and scales the x,y based on distance -> making farther smaller and closer bigger
- final matrix is all of these plus the 1 at the last 4th dim
- but we lose depth which we need for hidden surface removal, so we can define a new matrix with some linear function for $z'$
- so we create a perspective projection matrix that maps the perspective objects into a parallel NDC (openGL) cube which we can render to the viewport; here N is near value, F is far value, D is depth: ![[Pasted image 20240201185907.png]]![[Pasted image 20240201190038.png]]
## Window to Viewport Mapping
- where T is transformation and S is scaling![[Pasted image 20240201190141.png]]
- $$WTV=T(\frac{v_l+v_r}2,\frac{v_b+v_t}2)\cdot S(\frac W2,\frac H2)\cdot T(0,0)$$
## Final Rendering Pipeline
![[Pasted image 20240201192835.png]]