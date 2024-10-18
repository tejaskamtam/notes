---
area: ucla
quarter: Y4Q1
created: 2024-10-16 16:44
updated: Wednesday 16th October 2024 16:44:13
course: CS 163
---
## Question 1
First, to make visualizing the bytes easier, we can convert the binary representations to hex:
```python
Flag (F)   = 0b01111110 = 0x7e
Escape (E) = 0b01111101 = 0x7d
Mask (M)   = 0b00100000 = 0x20

XOR(F,M)   = 0b01011110 = 0x5e # when F occurs replace w/: 0x7d5e
XOR(E,M)   = 0b01011101 = 0x5d # when E occurs replace w/: 0x7d5d
```
### Q1
Given sender datagram:
```python
source_datagram = 0b01111101_01111101_01111110_01111110 = 0x7d_7d_7e_7e
```

PPP Byte stuffing results in the modified frame:
```python
PP_frame_struct = <F>_<E^M>_<E^M>_<F^M>_<F^M>_<F>
PPP_frame = 0x7e_7d5d_7d5d_7d5e_7d5e_7e
= 0b01111110_01111101_01011101_01111101_01011101_01111101_01011110_01111101_01011110_01111110
```

### Q2
Byte stuffing seems to be easier for software than bit stuffing because byte stuffing allows us to work with hex and mod 2 arithmetic at word/byte level. Most memory and data in software are stored as hex, and trying to manipulate a single bit within a byte can be expensive compared to running operations on hex. 

### Q3
Considering only the flag byte and not possible escape bytes, HDLC has a $1/32$ chance of the flag appearing in any 5-bit pattern in the datagram. On the other hand, PPP has a $1/256$ chance of the flag appearing in any 1-byte pattern in the datagram. This is roughly a 0.4% overhead for bit stuffing, given uniformly random bytes in the datagram.

### Q4
