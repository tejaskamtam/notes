---
area: ucla
quarter: Y3Q1
created: 2024-04-02 08:26
updated: Tuesday 2nd April 2024 08:26:56
course: CS 118
title: 00 - Fundamentals

layout: note
parent: CS 118
---

## Basic Definitions

- hosts - endpoints
- Network apps - apps that communicate across the network using data packets
- routers - packet switching to correct routes
- bandwidth - transmission rate
- internet - a network of networks of ISPs, enterprises, cloud services, and hosts
- protocols - rules of data transmission; HTTP, TCP, UDP, IP, etc.
- internet protocol standards - standards usually set by other orgs: IEEE, RFC (request for comments), W3C (WWW consortium)

## Internet Protocol Stack

![[Pasted image 20240402091152.png|300]]

### Application View

- all network apps have no insight into lower layers, they generate data and assume the network can connect any hosts
- don't care how data is transmitted, just pushes the data
- application communication is usually where this happens: e.g. browser on client sends HTTP request to apache on server

### Transport View

- doesn't actually deliver data, but from an application layer viewpoint, transport layer delivers requests
- The transport layer has no percepts on the network layer of which ISP its going through or router etc. just the type of data so it knows what protocol to use: TCP, UDP

### Network View

- packet forwarding between endpoints through routers/ISPs to other ISPs until it reaches the requested endpoints
- IP is used to determine which network devices to packet forward to until it reaches the destination
- IP only knows the next neighbor (i.e. connected router) but has no percepts on any future "hops"
- IP can also prevent packet loss and circular routing and other issues (even without knowing which ISPs/routers its been through by the IP header - hop count, etc.)

### Link View

- transmits packets to the next "hop" across the links (WiFi, ether, fiber, etc.)
- different link layers have different protocols: e.g., WiFi6 (IEEE 802.11ax)

## Packet Switching

- Routers will probabilistically delay certain packet routings to serve into a packet buffer (used to work on a reservation system like restaurants)
- this means every packet has some probability of being **delayed**
- when the buffer is full, packets are **dropped**

### Network Performance

- 3 basic measures
  - throughput - bits/sec
  - loss rate - % of packets lost
  - delay - sec, msec packets require for round-trip
- link bandwidth - throughput across 2 endpoints directly connected on aa single link layer

#### Packet Loss

- wired link loss - due to transmission errors or congestion on the wire
- wireless link loss - due to transmission rate (bandwidth), **host mobility** (number of hosts connected on the link)

#### Delay in packet-switched networks

- 4 sources ![[Pasted image 20240404082522.png|300]]
  - node processing - error checking, tag checking (usually inconsequential with todays technology)
  - transmission delay - length/rate : R=link bandwidth (bits/sec), L=packet length (bits)
  - queuing delay - # packets in queue $\times$ transmission time of each packet
  - propagation delay - distance/sec : d=physical link length, s=propagation speed in medium (near light, ~2e8 m/sec)

### Store-and-Forward

- entire packet must arrive at router before it can be transmitted to next hop, so we need to store the bits received so far ![[Pasted image 20240404085331.png|300]]

## Layer Overview

- handshakes on multiple levels ![[Pasted image 20240404091919.png|300]]
- data is encompassed with tags/heads/tails on multiple levels ![[Pasted image 20240404092018.png|300]]
