---
area: ucla
quarter: Y3Q1
created: 2024-01-11 19:06
updated: Thursday 11th January 2024 19:06:13
course: CS 174A
📕 courses:
parent: CS 174A

title: 2 - Display Technology

layout: note

---
## Output Devices
### Cathode Ray Tube (CRT)
- electrons strike a Phosphor coating and emits light
	- ![[Pasted image 20240111191013.png]]
- electron gun launches electrons
- electron direction controlled by deflection plates to target a direction on the Phosphor coating
- random-scan, calligraphic, or vector CRT displays - just draw lines cant fill
- refresh rate of 60 hz - 85 hz
- issue - cant rasterize images - cant create solid shapes
### Raster CRTs
- framebuffer depth:
	- 1 bit = b/w image either filled or not
	- 8 bit = grayscale with 256 possible shades of b/w
	- 8 bit per RGB = 16M colors
	- 12 bits per color = HD
- 3 colored electron guns shoot into a raster mask that creates pixels as triads
	- ![[Pasted image 20240111192912.png]]
- guns scan line by line of "pixels" so frame buffer holds the LxWxD, here it is 3 bit color
- refreshing is done at least 30 hz and line by line, so it can produce rasterized images, BUT now has aliasing due to atomic pixel size
- interlaced displays (most commercial) - signals sent to so that each refresh does every odd/even lines then interlace between every 2 refreshes
- single vs double buffering
	- to prevent read write clash from reading and writing to the same pixel in the buffer, implement double buffers and swap after reading
### Display Memory Calculations
- $n\times m$ pixel resolution
- $r$ Hz refresh rate
- $b$ bits/pixel (all colors so RGB is 3 bytes=24 bits per pixel)
- Memory space per second: $$= \frac{n\cdot m\cdot r\cdot b}8\space \text{bytes}$$
- Non-interlaced Memory Read Time: $$=\frac1{n\cdot m\cdot r}\space\text{s/pixel}$$
- interlaced is $$\frac2{n\cdot m\cdot r}\space\text{s/pixel} $$
### Other displays
- Flat screens
	- raster displays: active matrix with transistors at grid points
	- LEDs
	- LCDs: polarization of liquid crystals
	- OLED
	- Plasma: energize gases to glow
- VR
	- stereoscopic
	- __foveated rendering__: HD where focused, low res where not
- anamorphic LED displays
	- ![[Pasted image 20240111194722.png]]
- holographic real time displays
- spherical displays
- 