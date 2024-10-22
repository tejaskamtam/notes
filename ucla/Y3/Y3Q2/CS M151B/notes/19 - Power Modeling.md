---
area: ucla
quarter: Y3Q1
created: 2024-03-14 16:12
updated: Thursday 14th March 2024 16:12:11
course: CS M151B
parent: CS M151B

title: 19 - Power Modeling

layout: note

---
## Power Calc
Total Power = Dynamic Power + Static Power
$$P_{tot}=P_{dyn}+P_{sta}$$
$$P_{dyn}=\alpha C_LV_{dd}^2f$$
$$P_{sta}=V_{dd}I_{leak}$$
where:
- $\alpha$ is the activity factor
- $C_L$ is the total capacitance of any capacitors in the circuit
- $V_{dd}$ is the voltage across the circuit (working voltage)
- $f$ is the clock frequency
- $I_{leak}$ is the current leakage in the static circuit except I/O

Dynamic refers to the transistor activation power consumption
Static is the power consumption with no operations running, idle

### Activation factor
For each signal, it is the ratio of high cycles to total cycles. To calculate for multiple ssignals, sps:
$$\alpha_A=\frac{C_A}{C_{tot}}$$ and $$\alpha_B=\frac{C_B}{C_{tot}}$$
then: $$\alpha=\alpha_{tot}=\frac{C_A+C_B}{2C_{tot}}$$
- not usually, this is not done manually and cannot be done manually, but is instead estimated using tools that run the FPGA
- modern CPUs use tool like Quartus (for intel chips) and Cacti for simulation
- an usually track cycle counts to report power usage
## Low Power Optimizations
- clock/power gating, DVFS, MVI
### Clock Gating
- turn clock on and off by sending clk gate signal
- done by taking mux of clock or 0 line an select with gate signal
- prunes the entire clock tree that requires that clock line or requires the output of that sequential block
- to determine when to do so, we should check temperature, and whether the program needs that sequential block
### Power Gating
- sleep signal sent when a block is idle for too long
- completely switches off VCC/VDD for the entire sections
- This also shuts off the static power draw
- but requires a much larger system than clock gating to integrate: ![[Pasted image 20240314165218.png]]
- requires a power off policy: ![[Pasted image 20240314165346.png]]
- e.g., we an turn off some blocks for thee following: ![[Pasted image 20240314170536.png]]
### Dynamic Voltage and Frequency Scaling (DVFS)
- adjust voltage and frequency of a process dynamically depending on workload, power, or thermal constraints
- voltage and frequency regulated as a pair due to interconnected requirement for voltage to support high clock frequency
### Multi-voltage Islands (MVI)
- partition chips into separate islands each with its own power supply
- these islands can be independently power-regulated at different frequencies and voltages
- 