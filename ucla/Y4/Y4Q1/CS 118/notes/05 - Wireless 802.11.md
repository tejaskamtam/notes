---
area: ucla
quarter: Y4Q1
created: 2024-10-15 15:40
updated: Tuesday 15th October 2024 15:40:40
course: CS 118
title: 05 - Wireless 802.11

layout: note
parent: CS 118
---

## WLAN: IEEE 802.11b

- 1, 2, 5.5, or 11 Mbps
  - User data rate max approx 6 Mbps
- transmission range of 300m outdoor 30m indoor
  - max data rate 10m indoor
- frequency free 2.4 Ghz ISM-band
- physical channels ![[Pasted image 20241015154343.png|300]]

## CD

- because there are multiple channels and not a single shared channel
- CSMA carrier sense doesnt work for wireless because C cannot detect data from A to B on line A->B->C
- so if C transmits, collision at B -> C needs to defer sending

### RTX/CTS (MACA)

- Hidden terminal problem
  - sps you have stations A<->B<->C where B is in range of A and C but A and C are hidden from each other
  - if A and C both try to send data to B, there will be a collision at B, but because the other is out of range, A and C don't detect the collisions at their stations (unlike Ethernet where the sender will realize the collision after some time)
-
- Multiple Access Collision Avoidance (MACA)
  - node A, before transmitting, send a couple bytes called RTS request to send on channels
  - B respond with clear to send CTS broadcast
  - C hears CTS and defers
- Binary Exponential Backoff
  - if there are RTS collisions, use backoff to decrease likelihood of RTS collisions
- Exposed Terminal, even with MACA
  - Sps there are 4 stations A, B, C, D where range is 2 nodes i.e. A can see B and C but not D and so on for each node.
  - If B is sending to A, C hears the CTS from A and defers
  - This is an issue because it can still send to D without collision
