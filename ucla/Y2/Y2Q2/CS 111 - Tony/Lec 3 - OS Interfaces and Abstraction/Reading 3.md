# Software Interface Standards

Like standardization of machine components for interchangeable parts

### History:

- key software was originally developed by hardware manufacturers
- rise of Independent Software Vendors encourages software compatibility
    - expensive to build different versions of an application for different hardware platforms
    - computer sales are driven by the apps they can support, lose customers if ISV’s software is not available on your platform
- Rise of availability of computers to general consumers(non programmers) means:
    - new apps have to work on both old and new devices
    - software upgrades cannot break existing applications
- without a standard, it is impossible to test every software application with every os version

## Challenges:

### Standards are good because:

- promote the betterment of products instead of who can support what
    - Standardizing TV signals mean TV producers compete on the quality of TV and stations compete on the basis of programming
- well considered for a wide range of applications
    - debated by experts over a long time
- relatively platform-neutral, not favoring any particular providers
    - contributors are from many different organizations
- clear and complete specifications and well developed
    - must be a basis for compatible implementations
- give technology suppliers freedom to explore alternative implementations
    - as long as they maintain specified external behavior

### Bad because:

- constrain the range of possible implementations
    - if better implementation of a new interface is not 100% upwards compatible with old ones, improved design will be non-compliant
    - hence why US has horrible tv signals
- create constraints on consumers
    - if an application uses any features and anyway that are not authorized by the standard will encounter problems with new platforms/releases
- difficult to evolve standards with many different stakeholders

## Fast Rate of Evolution:

Technologies that go into computers are evolving quickly, people expect to be able to run the latest apps on ancient devices. When making changes to OS services APIs, there are 3 choices:

1. maintaining strict compatibility with old interfaces
    1. fast track to become completely useless
2. developing new interfaces that embrace new technologies and uses, but incompatible with older interfaces and applications
    1. sacrifice existing customers
3. A compromise that partially support new technologies and apps, while remaining mostly compatible with old interfaces
    1. uncompetitive and incompatible

## Propriety vs. Open Standards

- A **proprietary** interface is one that is developed and controlled by a single organization (Microsoft Windows API)
- An **Open Standard** s one that is developed and controlled by a bunch of providers and consumers (IETF network protocols)

### Decision to make when developing new technology:

- open interface definitions to competitors to competitors to achieve a better standard and more likely to be widely adopted?
    - reduced freedom to adjust interfaces
    - give up competitive advantages from being the only provider
    - forced to re-engineer existing implementations to be compliant with committee-adopted interfaces
- keep the interface proprietary to maximize competitive advantage?
    - competing open standard might out compete
    - competing standards fragment the market and reduce adoption
    - shoulder full costs of development

## Application Programming Interfaces

A set of definitions and protocols to build and integrate application software. A typical API specification is open:

- a list of included methods, and their signature(parameters, return types)
- a list of associated macros, data types, and data structures
- a discussion of the semantics of each operations, and how it should be used
- a discussion of all the options, what each does, and how it should be used
- a discussion of return values and possible errors

API specifications are written at the source programming level. they are a basis for software portability:

- an application written to a particular API should easily recompile and execute and any platform that supports that API
- any application written to supported APIs should easily port to their platform

This means that the API has to be developed in a platform-independent way: (non-examples)

- type int which is implicitly assumed to be 64 bits might not work on a 32 bit machine
- individual bytes within an int might not work on a big-endian machine
- assume a particular features implementation might not be implantable on some platform

## Application Binary Interfaces

the binding of an API to an ISA(Instruction Set Architecture)

### ABI vs. API

- API defines subroutines, what they do, and how to use them
- ABI describes the machine language instructions and conventions that are used to call routines

### ABI contains:

- binary representation of key data types
- instructions to call to and return from a subroutine
- stack-frame structure and responsibilities of caller and callee
- how parameters are passed and return values are exchanged
- register conventions
- analogous conventions for system calls, and signal deliveries
- formats of load modules, shared objects, and dynamically loaded libraries

### Who uses ABI?

- compiler, linkage editors, program loader, the OS

# Interface Stability

## Criticality of Interface Stability

- System architecture that has well defined and well considered interfaces allow for independently designing and implementing of system components

## Importance of Interface Stability

### Software Interface is like a Contract:

- describes an interface and the associated functionality
- implementation providers agree that their systems will conform to the specification
- developer agree to limit their use of the functionality to what is described in the interface specification

💡

Conforming to the software interface ensure that no problems(failures, bug reports, bad product, incompatibility) happens

### Interface Polymophism

- a rountine had a single interface specification. If different versions of a method are readily distinguishable, it may be possible to provide new interfaces to meet new requirements, while continuing to support the older interface for backward compatibility with older apps

### Versioned Interfaces

- we can continue providing old interfaces to old clients. It is possible for an app to call out which version of an interface it requires

## Interface Stability and Design

- consider all the different types of changes that are likely to happen when we design a system
    - rearrange distribution of functionality between components to create a simpler interface
    - design features that may never be implemented just to have options
    - introduce unnatural degrees of abstraction in our services to have room for changes in the future