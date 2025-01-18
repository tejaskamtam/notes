---
area: ucla
quarter: Y4Q1
created: 2024-10-01 14:36
updated: Tuesday 1st October 2024 14:36:58
course: CS 118
title: 01 - Layering

layout: note
parent: CS 118
---

## TCP vs OSI Model

![[Pasted image 20241001143829.png|300]]

## Layering

- Data packet is wrapped at each layer with a new header for that layer
  - ![[Pasted image 20241001143919.png|300]]
- Each hop consumes/allocates a new header until all headers are consumed and data arrives at dest:
  - ![[Pasted image 20241001143959.png|300]]
  - ![[Pasted image 20241001144031.png|300]]
  - ![[Pasted image 20241001144017.png|300]]
- Each layer must only look into its header, else a layer violation occurs, but this may not always be bad
  - e.g., a firewall looks into the TCP layer despite residing on IP layer to ensure the TCP port is permissible. This is a layer violation, but is ok.
- In some cases this requires new specs, e.g. congestion at a router requires it to inform the src that there is congestion and must reduce its rate but it can only modify IP, so we add an [Explicit Congestion Notification (ECN)](https://en.wikipedia.org/wiki/Explicit_Congestion_Notification) added to the IP & TCP
  - This requires sending forward to dest then dest sending back to src, bc packet switching is asymmetric and may not result in the same path backward from the congested router to the src
