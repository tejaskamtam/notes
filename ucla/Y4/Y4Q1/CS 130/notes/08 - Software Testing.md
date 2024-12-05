---
title: 08 - Software Testing
area: ucla
created: 2024-11-25
course: CS 130
parent: CS 130
layout: note
---
## Software Testing
- to detect diffs bw observed and expected (errors due to omission or commission) ![[Pasted image 20241125164028.png]]
- test-driven dev suggests writing testable code via:
	- writing tests first before code
	- common for unit testing
	- requires "seams" to insert tests
### Levels of Testing
- **Unit testing** (devs) tests indiv modules
- **Regression testing**: (devs or testers) incremental differential tests of previously tested sw after change
- **Integration testing** (testers) interface bw multiple sw modules
- **System testing** (testers) end-to-end testing
- **Acceptance testing** (users) tests user requirements on a release candidate of the system

### Isolating Item-Under-Test (IUT)
- to reduce uncertainty, isolate - e.g., mock/patch
- **Test stub**: mock items called by IUT
- **Test driver**: mock items that call IUT

## JUnit - Test Automation
- testing is hard bc failure causes may be sparse
	- e.g., ![[Pasted image 20241125164637.png]]
- so automate via frameworks - e.g., JUnit for Java testing
### Features
- Annotations, assert statement, test fixtures for common shared code/data, test aggregation for suites
- **Annotation Examples** ![[Pasted image 20241125164753.png]]
	- code example
	```java
	public class DummyTest {
	    private static List<String> list;
	
	    @BeforeClass
	    public static void beforeClass() {
	        list = new ArrayList<String>();
	    }
	
	    @Before
	    public void before() {
	        list.add("Alex");
	    }
	
	    @Test
	    public void getElement() {
	        String element = list.get(0);
	        assertEquals(element, "Alex");
	    }
	
	    @After
	    public void after() {
	        list.remove("Alex");
	    }
	
	    @AfterClass
	    public static void afterClass() {
	        list = null;
	    }
	}
	```
- **Assertions** ![[Pasted image 20241125165332.png]]
	- code example ![[Pasted image 20241125165344.png]]
- other features ![[Pasted image 20241125165359.png]]

## Control Flow Testing
- **statement coverage** - percent of statements executed by tests
- **branch coverage** - % of branches explored by tests
- **path coverage** - % of control flow paths explored by tests
- **Control Flow Graph (CFG)** Notation ![[Pasted image 20241125170345.png]]
### Analyzing Test Coverage
- given ![[Pasted image 20241125170424.png]]
- solution:
1. Draw CFG ![[Pasted image 20241125170444.png]]
2. Fill test coverage table ![[Pasted image 20241125170458.png]]
### Branch Coverage
- measured via decision takes T or F branch ![[Pasted image 20241125170549.png]]
- example ![[Pasted image 20241125170611.png]]
### Path Count Estimation
- entails estimating number of loop iterations for bounded progs
- for loop free with $k$ decisions => $2^k$ feasible paths
- for loops -> perform loop **unrolling** s.t. number of paths = $2^\text{\# of non-det. decisions}$
- e.g., given ![[Pasted image 20241125170912.png]] we can follow the steps of CFG then loop unrolling:
	- draw CFG ![[Pasted image 20241125170930.png]]
	- unroll loop ![[Pasted image 20241125170941.png]]
	- draw unrolled CFG ![[Pasted image 20241125170952.png]]
	- calc coverage table ![[Pasted image 20241125171009.png]]
- nested loop estimation via polynomial combination![[Pasted image 20241125171102.png]]

## Symbolic Execution
- path counts evaluate whether branch flattens to true or false in nondeterministic paths
- unconditional code is deterministic
- but, infeasible paths are dead or unreachable code
- **symbolic execution** - unroll loop -> use fresh vars in beginning and with state updates -> for each decision propagate both branches: for each path, the condition exercised is the **path condition** and the result is the **path effect** e.g., ![[Pasted image 20241125171651.png]]
- examples
	- given1 ![[Pasted image 20241125171806.png]]
	- solution1![[Pasted image 20241125171820.png]]
	- example 2 ![[Pasted image 20241125171852.png]]

### Generating Test Input
- symbolic execution can generate test inputs - determine path conditions then find concrete input values that make the path condition true ![[Pasted image 20241125172035.png]]

## Regression Testing
- testing to ensure incremental changes don't take a step "backward" and cause failures of previously succeeded test cases
- goal is to select a set of minimum tests to ensure no regressive changes
### Regression Test Selection (RTS)
- idea is given older version of prog $P$, create test suite for $P$ called $T$ and use it to generate coverage matrix $C_{PT}$-> create new version $P'$ and calc delta bw new and old version -> use to select $\subset T$ s.t. safe RTS covers new version
- e.g., **Harrold & Rothermel's RTS** ![[Pasted image 20241125173434.png]]
	1. Build CFG of original prog $P$ ![[Pasted image 20241125173500.png]]
	2. run test suite $T$ on $P$ ![[Pasted image 20241125173528.png]]
	3. build coverage matrix $C$ ![[Pasted image 20241125173545.png]]
	4. build CFG of $P'$ ![[Pasted image 20241125173612.png]]
	5. traverse both CFGs in parallel ![[Pasted image 20241125173628.png]]
	6. select tests for dangerous edges ![[Pasted image 20241125173649.png]]
