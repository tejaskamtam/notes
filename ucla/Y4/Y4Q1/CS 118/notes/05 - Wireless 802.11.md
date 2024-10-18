---
area: ucla
quarter: Y4Q1
created: 2024-10-15 15:40
updated: Tuesday 15th October 2024 15:40:40
course: CS 118
---
## WLAN: IEEE 702.11b
- 1, 2, 5.5, or 11 Mbps
	- User data rate max approx 6 Mbps
- transmission range of 300m outdoor 30m indoor
	- max data rate 10m indoor
- frequency free 2.4 Ghz ISM-band
- physical channels ![[Pasted image 20241015154343.png]]
## CD
- because there are multiple channels and not a single shared cchannel
- CSMA carrier sense doesnt work for wireless because C cannot detect data from A to B on line A->B->C
- so if C transmits, collision at B -> C needs to defer sending
### RTX/CTS (MACA)
- node A, before transmitting, send a couple bytes called RTS request to send on channels
- B respond with clear to send CTS broadcast
- C hears CTS and defers
### Backoff Interval