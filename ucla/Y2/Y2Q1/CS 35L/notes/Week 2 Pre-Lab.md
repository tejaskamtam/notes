---
course: PHYSICS 4AL
area: ucla
created: 2023-01-16T16:28
updated: 2023-01-16T16:36
📕 courses:
  - "[[Physics 4AL- Kinematics Lab]]"
parent: CS 35L

title: Week 2 Pre-Lab

layout: note

---
# Definitions

---

# Big Ideas

---

$Q=(A+B)^2=400\\ \text{sps. } x=A+B=20\space \\ \space \delta x=\sqrt{(\delta A)^2+(\delta B)^2}=5 \\ \delta Q=2\frac{\delta x}{x}\cdot Q=200$

```
# assuming the data is given by numpy arrays "x,y"
# assuming matplotlib imported as "plt"

# assigning variables
res, cov = np.polyfit(x,y,1,cov=True)

# fitting data to liner function
plt.plot(x,res[0]*x+res[1],'r',label="fit")

# extracting fit coeff(s)
slope = res[0]
intercept = res[1]

# extracting covariance matrix elements
var_slope = cov[0][0]
var_intercept = cov[1][1]
covar = cov[0][1] # or cov[1][0]
```

# Resources

---

[](https://www.notion.soundefined)

📌

**SUMMARY  
**