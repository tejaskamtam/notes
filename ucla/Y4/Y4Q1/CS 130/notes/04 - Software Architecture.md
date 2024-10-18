---
area: ucla
quarter: Y4Q1
created: 2024-10-14 18:11
updated: Monday 14th October 2024 18:11:09
course: CS 130
---


## Application Landscape Patterns
- Monolithic
- N-tier -> layered approach of visibility: [[04 - Software Architecture#Application Structure Patterns#Layered Architecture|Layered Architecture Notes]]
- Microservice -> each service (possibly multiple per layer) divided
- Serverless
- Peer-to-Peer (P2P) -> user posted, user-guided, decentralized like crypto
![[Pasted image 20241016181649.png]]

## Application Structure Patterns
### Layered Architecture
- separation at features/visibility ![[Pasted image 20241016181719.png]]
- pros: well known, separation of concerns
- cons: can lead to monoliths, need to write lot of code bw layer, sinkhole anti-pattern
- ![[Pasted image 20241016181804.png]]
### Microkernel Architecture
- plugin based ![[Pasted image 20241016181824.png]]
- e.g., IDEs
- pros: flexibility, clean separation of feats and teams, modify functionality at runtime
- cons: core api versioning challenges, untrusted plugins, plugin vs core decisions confusing
### CQRS Arch (Command Query Responsibility Segregation)
- feat separated stacks, synced in back ![[Pasted image 20241016182012.png]]
- ![[Pasted image 20241016182126.png]]
- e.g., banking apps - imbalance in read to write request usage
- pros: simple/fast/scalable reads
- cons: more complex impl. and learning, data and eventual inconsistency due to syncing
### Event Sourcing Arch
- action based - store actions s.t. state is the result of the last stored action ![[Pasted image 20241016182359.png]]
- e.g., netflix ![[Pasted image 20241016182438.png]]
- pros: audit trail w. event trace -> allows for return to state with history, easy event replay without changing state
- cons: event structure changes -> end-to-end changes, must take snapshots of events, learning curve
#### CQRS + Event Sourcing ![[Pasted image 20241016182637.png]]

## UI Patterns
### Model-View-Controller (MVC)
![[Pasted image 20241016184007.png]]
### Model-View-Presenter (MVP)
![[Pasted image 20241016184015.png]]
### Model-View-ViewModel (MVVM)
![[Pasted image 20241016184027.png]]

## Cloud Based Architecture
- services (SaaS - Software as a service, PaaS - Platform..., IaaS - Infra...) ![[Pasted image 20241016184615.png]]
- scriptable infrastructure - infra as code for provisioning etc.
- improved dev lifecycle - no need to wait on hardware availability, just provision resources
- unconstrained resources - just provision more or switch compute to mitigate bottlenecks
- on-demand scaling - no compute bottleneck, just provision more
- high availability and disaster recovery - edge compute, load balancing, availability zones, etc. abstracted from developer
- shared security model - not all onus is on the dev to maintain security
- optimized cost - pay as you go, etc. allowing on demand products allows usage based on traffic and thus cost as busy
