---
area: ucla
quarter: Y3Q1
created: 2024-03-18 22:08
updated: Monday 18th March 2024 22:08:20
course: CS 174A
parent: CS 174A

title: 11 - Lighting

layout: note

---
## Types of lighting
- ambient - instead of checking the physical scattering, we assume each object has ambient lighting directly behind it that gives us a silhoutte
- diffuse - reveals shape of obj based on diffusivity of light across the surface of the object
- specular - shine, shows specualr highlights of the light soruces
![[Pasted image 20240318221048.png]]
## Ambient Lighting
- background light - estimates true scattering
- does NOT depend on position/direction, object, or eye
![[Pasted image 20240318221155.png]]
## Diffuse Lighting
- point source light
- lambertian (diffuse) reflection for dull matte surfaces -> looks equally bright from all directions
- reflect light equally in all directions
	- ![[Pasted image 20240318221251.png]]
- Lambert's law: light intensity is prop to direction
![[Pasted image 20240318221303.png]]
- N is the normal from/to the surface
- L is the light vector (surface to light source)
- $\theta$ is angle between N,L
## Specular Lighting
- shiny surfaces
- color of light matters (included in point light intensity) not color of object
- depends on position of light, object and eye
![[Pasted image 20240318222627.png]]
- R is the reflection vector from the surface
- V is the view/eye/cam vector from the surface
- $f_{att}$ is attenuation factor: see Final Lighting
- $\phi$ is angle between R and V
![[Pasted image 20240318222516.png]]

### Calculating R vector
$$\vec R=2(\vec N\cdot\vec L)\vec N\space-\space\vec L$$
![[Pasted image 20240318222912.png]]
### Blinn-Phong: Replacing RV with Halfway Vector
- halfway vector $\vec H$ is halfway b/w L and V = norm(L+V)
- replace $(R\cdot V)^n$ with $(H\cdot N)^n$
- s.t. $$(H\cdot N)^n=\cos^n\Psi\quad :\quad \Psi=\phi/2$$
## Final Lighting
$$I_\lambda=\bigg(k_{a\lambda}*I_{a\lambda}\bigg)*O_{d\lambda}\space+\space \bigg(f_{att}*k_{d\lambda}*I_{p\lambda}*(N\cdot L)\bigg)*O_{d\lambda}\space+\space\bigg(f_{att}*k_{s\lambda}*I_{d\lambda}*(R\cdot V)^n\bigg)$$
where $\lambda\in\{R,G,B\}$
![[Pasted image 20240319015206.png]]
### Incident Angle
- angle is angle bw norm to surface and light source
- $\theta\lt 90$ => some light based on angle
- $\theta=90$ => max light
- $\theta > 90$ => self-occlusion, no light
### Directional light sources
- if light is far enough away
- L is the same (constant) for the entire scene for all objects
- N is the same for the entire polygon
- thus $N\cdot L$ is constant on the poly
### Attenuated Light source
- diffuse light reflected off object
![[Pasted image 20240318224235.png]]
- d is the distance of the light to the object
### Colored Light Sources
OBJECT COLOR (not light color)
- object's diffuse color $O_{d\lambda}\in\{O_{dR},O_{dG},O_{dB}\}$
- split into R,G,B components
- thus final term => (ambient + diffuse term) \* $O_{d\lambda}$
### Fog: Atmospheric Attenuation and Blending
![[Pasted image 20240318230116.png]]
### Misc Improvements
![[Pasted image 20240318230140.png]]

## Global Illumination
- based on physics light energy (radiosity)
- ![[Pasted image 20240319015454.png]]