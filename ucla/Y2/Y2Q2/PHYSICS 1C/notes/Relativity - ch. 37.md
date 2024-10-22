---
course: PHYSICS 1C
area: ucla
created: 2023-03-18T20:58
updated: 2023-03-19T20:25
📕 courses:
  - "[[Physics 1C- EM, Waves, & Optics]]"
parent: PHYSICS 1C

title: Relativity - ch. 37

layout: note

---
# Definitions

---

# Big Ideas

---

## Einstein’s Postulates and Galilean Transforms

### 1st Postulate (Principle of Relativity)

- Laws of physics are the same in every inertial reference frame
    
    ![[/Untitled 72.png|Untitled 72.png]]
    

### 2nd Postulate (Speed of Light in Vacuum)

- Speed of light in a vacuum is the sam in all inertial frames of reference and independent of the motion of the source
    
    ![[/Untitled 1 54.png|Untitled 1 54.png]]
    

### Galilean Transformation

- a coordinate transformation between 2 inertial frames
    
    - Galilean transformations are a set of equations that relate the coordinates of an event as measured by two observers in relative motion. They assume that time and space are absolute and do not depend on the observer. These transformations were the basis of classical mechanics until the discovery of special relativity.
    
      
    
- e.g. two frames $S, S'$﻿ where $S’$﻿ is moving at velocity $u\hat i$﻿, then coordinate for any object in the frame transform to:

$x=x'+ut\quad y,z=y',z'\implies v_x=v_x'+u$

- Implies $c=c’+u$﻿ but this violates Einstein’s 2nd postulate: $c=c’$﻿
- Thus the Galilean transformation $v_x=v_x’+u$﻿ _cannot_ be correct

## Relativity of Time Intervals

$\Delta t_0=\frac{2d}{c}$

- time intervals in different frames are different (time dilation)

$\Delta t=\frac{\Delta t_0}{\sqrt{1-u^2/c^2}}\implies \Delta t \gt \Delta t_0$

- The proper time $\Delta t_0$﻿ describes time interval of 2 events that occur at the same point, thus transformations are given by the **Lorentz factor**

$\Delta t=\gamma \Delta t_0\implies \gamma =\frac{1}{\sqrt{1-u^2/c^2}}$

- This is known as time dilation - clocks moving relative to an observer run slow

## Relativity of Length

$\Delta t_0 = \frac{2l_0}{c}$

$\Delta t=\frac{2l_0}{c\sqrt{1-u^2/c^2}}\quad l_0:\text{proper length}$

- Length Contraction

$l=l_0\sqrt{1-u^2/c^2}=\frac{l_0}\gamma$

## Lorentz Transformations

- Galilean transforms work as speeds approach 0, while Lorentz transforms are general

$x=ut+\frac{x'}\gamma=ut+x'\sqrt{1-u^2/c^2}\\\implies\\ x'=\frac{x-ut}{\sqrt{1-u^2/c^2}}=-ut'+x\sqrt{1-u^2/c^2}$

$t'=\gamma(t-ux/c^2)=\frac{t-xu/c^2}{\sqrt{1-u^2/c^2}}$

### Lorentz Velocity Transformation

$v_x'=\frac{v_x-u}{1-uv_x/c^2}\quad v_x=\frac{v_x'+u}{1+uv_x'/c^2}$

## Doppler Effect on EM Waves

- observed frequency of a moving object is greater than emitted: $f>f_0$﻿

$f=f_0\sqrt{\frac{c+u}{c-u}}\quad \text{(approaching)}\\$

$T=\frac{cT_0}{\sqrt{c^2-u^2}}\implies f=\frac{c}{(c-u)T}\quad \&\quad \lambda=(c-u)T$

## Newtonian Mechanics in Relativity

### Relativistic Momentum

$\vec p=\frac{m\vec v}{\sqrt{1-v^2/c^2}}=\gamma m\vec v$

### 2nd Law

- $\vec v\parallel\vec F$﻿

$\vec F=\frac d{dt}(\gamma m\vec v)\implies F=\gamma^3ma$

- $\vec v\perp\vec F$﻿

$F=\gamma ma$

- General

$\vec F=\gamma m\frac{d\vec v}{dt}+\frac{d\gamma}{dt}m\vec v=\gamma m\bigg[\vec a+\frac{\gamma^2}{c^2}\vec v(\vec v\cdot\vec a)\bigg]$

### Work and Energy

$W=\int_{x_1}^{x_2}\frac{ma}{(1-v^2_x/c^2)^{3/2}}dx$

$K=(\gamma-1)mc^2$

$E=K+mc^2=\gamma mc^2\\\space\\$

# Resources

---

![[/ch37_lecture.pdf|ch37_lecture.pdf]]

  

📌

**SUMMARY  
**