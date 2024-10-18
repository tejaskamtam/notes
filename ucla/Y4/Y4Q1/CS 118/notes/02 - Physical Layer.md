---
area: ucla
quarter: Y4Q1
created: 2024-10-01 16:55
updated: Tuesday 1st October 2024 16:55:19
course: CS 118
---
## Signal Modulation
Modem
- **Mod**ulation and **dem**odulation of digital signal to analog to digital
# Physical Layer
- possibly faulty, single hop, bit-pipe that connects 1 sender to possibly Many receivers; e.g., morse code:
	- ![[Pasted image 20241001165749.png]]
- ![[Pasted image 20241001165904.png]]
- Constraints at every sublayer ![[Pasted image 20241001170007.png]]
## Bot Sublayer: Signal Transmission Limits
- transmission done on light: 0=low,1=high
- distortion is inevitable so: ![[Pasted image 20241001170135.png]]
### Fourier Analysis
- we can describe a channel by plotting the amplitude and phase of a signal $S$ over all frequencies s.t. a wave of frequency $\mathcal{f}$ is scaled by fixed $a(\mathcal f)$ (amplitude) and shifted by fixed $p(\mathcal f)$ (phase)
- to then find the original signal, we write $S$ as a sum of sine waves with diff frequencies using the amplitude and phase response to guage the difference and add the scaled sine waves to the fourier
- EE - range of signal freqs; CS - speed of cable modem in bits/s![[Pasted image 20241001170659.png]]
- higher bandwidth = higher fidelity (easier to distinguish high and low) = better bit recovery ![[Pasted image 20241001170920.png]]
- thus, lower bandwidth means more sluggish response as channels can't infer signals past a certain frequency
- most common noise is white noise - uniformly distributed across all freqs and normally distributed within a specific freq
- ![[Pasted image 20241001171201.png]]
### Nyquist Limit
- Given a bandwidth for an amplitude response: ![[Pasted image 20241001171356.png]]
- we can send signals without intersymbol interference (ISI) up to a rate of **2xBandwidth** / second
- this is the limit of sending symbols not bits (baud rate)![[Pasted image 20241001171434.png]]
### Shannon Limit
- speed of transmission depends on noise and bandwidth
- see that we can send multiple bits over a single wave: ![[Pasted image 20241001171651.png]]
- Thus baud rate for $L$ signal levels is = $\log L \times 2B$
- noise messes with the amplitudes, so we set Shannon bounds ![[Pasted image 20241001171807.png]]
	- ![[Pasted image 20241001171913.png]]
- Shannon bound ![[Pasted image 20241003194707.png]]
### Nyquist-Shannon Sampling Thm
https://youtu.be/Jv5FU8oUWEY?si=Y2GXnNIvty9OEfAa
- Due to aliasing from too low of a sampling frequency, we may only capture the orginal signal accuratley if the sampling frequency $f_s > 2\cdot f_{\max}$ is greater than twice the max frequency of the original signal
- this is why audio recorders record at 44.1 kHz (a little more than twice the max frequency humans can hear)
- larger bandwidth = better recovery ![[Pasted image 20241003194618.png]]

## Top Sublayer: Clock Recovery
- b/c clocks drift, we hve initial training bits. to anti-alias, we need transitions in clock voltage
- we need signal transitions bw multiple clock cycles of the same signal to know that the clock has ticked ![[Pasted image 20241001172027.png]]
- we add start and stop bits ![[Pasted image 20241001172227.png]]
- asynchronous tranmision of bits over signal don't require robust start and stop, usually jusst 1-2 trailing stop bits
- synch. transmission needs better clock tolerance -> sophisticated coding, ususally of the form:
	-  ![[Pasted image 20241005181436.png]]
- synch. does this to reduce receiver clock startup overhead (knowing when to start the receiver clock is expensive which iss a blocker to assynch transmission, instead long leading and trailing bits wrapping the message)
### Manchester encoding
- encodes the transition of the signal/data itself, e.g. hi->lo : 1, lo->hi : 0
- this helps with getting the phase matching easier - with asyc you have 1 transition to sync sender and receiver clock, but with manchester you have a preamble of transitioons of form 010101...11
- solves clock recovery problem but 50% efficient as it encodes 1/2 bit per transition ![[Pasted image 20241005181812.png]]
### Receiver code
- usually use phase locked loops to speed up or slow receiver clock to lock in phase
- ![[Pasted image 20241005182347.png]]
## Broadband Coding
- baseband coding uses binary energy levels, e.g. light or voltage
- broadband modules the data/information on a carrier wave at some frequency
- modulation can be Frequency Shift Keying (FSK) - high freq = 1, low freq = 0; or Amplitude Shift Keying (ASK), or QAM (mix), or similar e.g. Phase Shift Keying (PSK) 
	- ![[Pasted image 20241005182702.png]]
- TODO: three levers of modulation - FDMA, TDMA, CDMA
	- ![[Pasted image 20241005182846.png]]
- TODO: Signal Multiplexing - Time Division Mux (TDM), Freq Div Mux (FDM)
	- ![[Pasted image 20241005182945.png]]
## Middle Sublayer: Media
- hardware tech to best convert digital to analog signal
	-  important to consider due to hardware limitations on bandwidth, etc. ![[Pasted image 20241005183214.png]]
### Twisted Pair Coax
- ![[Pasted image 20241005183334.png]]
- ![[Pasted image 20241005183345.png]]
- twisted pair today ![[Pasted image 20241005183424.png]]
### Baseband Coax (Ethernet)
- ![[Pasted image 20241005183713.png]]
- ![[Pasted image 20241005183724.png]]
- baseband coax today: ![[Pasted image 20241005183743.png]]
### Fiber Optic
- unidirectional ![[Pasted image 20241005183826.png]]
- ![[Pasted image 20241005183840.png]]
- visible light disperse through reflections in glass due to different wavelengths traveling at diff speeds -> sol: monochromatic light (lasers)
### Wireless
- ![[Pasted image 20241005184025.png]]
- requires spectrum allocation - trying to allocate like a spatial resource does not work as spectrum is time and power shared -> whitespace comms
- radiowave - cheap, good bandwidth, avoids ROW, long diistance (100km), issues with raiin
- satellite - avoids ROW, good bandwidth, world wide distance, expensive, large latency
	- LEO - orbit at varying speeds, cell
	- geostationary much farther = higher latency, but regionally stationary
- types of wireless protocols (not including 5G) ![[Pasted image 20241005184354.png]]
### 802.11b (a/c?)
- AP configured with SSID, with channel number 1 to 11. non overlapping channels, e.g. 1,6,11 can be used to triple bandwidth -> ssends beacon w/ SSID payload
- each mobiile/client scans all 11 channels looking for SSID beaacons
- issues with hidden terminal problem - mobile A and B can communicate to AP, but not between themselves
### Media summary
![[Pasted image 20241005184705.png]]