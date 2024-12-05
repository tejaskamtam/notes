---
title: 06 - DevOps
area: ucla
created: 2024-11-03
course: CS 130
parent: CS 130
layout: note
---
## DevOps Principles
- collaboration and communication
- automation - streamline software delivery pipeline
	- CI/CD - Continuous Integration / Continuous Delivery
	- Infra as Code (IaC) - provisioning infra through cloud ddev kit (e.g., cloud formation from aws)
- monitoring and logging - robust logging for continuous testing
- feedback loops ![[Pasted image 20241103160547.png]]
- continuous improvement
- CALMS model
	- **C**ulture of:
	- **A**utomation, **L**earn it, **M**easurement, **S**haring
- KPIs - empoyee and customer satisfaction, productivity, stability
#### DevOps Tool Chain
- CI/CD example tools ![[Pasted image 20241103160754.png]]
#### Challenges
- cultural resistance, toolchain complexity, skill gap
- security concerns, complex lifecycle
- KPI analysis, effective comms
#### Disciplines
- change management, environment management, deploy/integrate/monitor management

### Change Management
- identify artifacts to track - time cost analysis
- define versioning mechanism - e.g., git, gitfarm, etc.
- control changes
	- change request proces - PRs, CRs, iteration
	- commit squash, rebase, ff, etc.
- audits
	- artifact tracking, constant versioning updates
	- adherence to API standards
#### CI Version Control
- version control systems (VCS) tracks artifacts
- git based track via branches

### Environment Management
- app infra - mobile, web, desktop, etc.
- package managers (run-time, os, system)
- containerization - docker, kubernetes
	- containerization vs VM![[Pasted image 20241103161917.png]]
	- docker registry ![[Pasted image 20241103161931.png]]
- config management - ansible, vagrant, etc.
- infr as ode (IaC) - provisioning hardware on demand (cloudformation, terraform)
### Deployment Strategies
Sure! Here’s a brief overview of each software deployment strategy:

1. **Blue-Green Deployment**: This strategy involves maintaining two identical environments, referred to as "blue" and "green." At any time, one environment is live (serving users), while the other is idle. When a new version of the software is ready, it is deployed to the idle environment. Once the deployment is verified, traffic is switched from the live environment to the updated one. This allows for quick rollbacks if issues arise.

2. **Canary Deployment**: In this approach, a new version of the software is released to a small subset of users before a full rollout. This allows developers to monitor the performance and behavior of the new version in a real-world environment with minimal risk. If the canary version performs well, it can be gradually rolled out to a larger audience.

3. **Rolling Upgrades**: This strategy involves updating the software incrementally across a cluster of servers or instances. Instead of taking down the entire system, a few instances are updated at a time while the others continue to serve users. This minimizes downtime and allows for continuous service availability during the deployment process.

4. **A/B Testing**: While primarily a testing strategy, A/B testing can also be used in deployment. In this method, two versions of a feature (A and B) are deployed simultaneously to different user segments. User interactions and performance metrics are compared to determine which version performs better. This data-driven approach helps in making informed decisions about which version to fully deploy.

Each of these strategies has its own advantages and is chosen based on the specific needs and risk tolerance of the organization.

### Monitoring
- ELK - ElasticSearch, Logstash, kibana stak
- chaos engineering - program ass if anything can fail at anytime, you should be able to catch the errors
- AI ops ext