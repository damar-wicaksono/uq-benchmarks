# Short Column Function

[//]: # "Benchmark type: test-function"
[//]: # "Application fields: reliability, metamodeling, rbdo"
[//]: # "Dimension: 5-dimension"

The 5-dimensional short column function models a short column with a rectangular cross-section (width $b$ and depth $h$) having uncertain material properties (yield stress $Y_C$) and is subjected to uncertain loads (bending moment $M_C$ and axial force $P_C$). The function is used as a test function in reliability analysis (Eldred et al., 2007), metamodeling (Eldred and Burkardt, 2009; Eldred et al., 2008), and reliability-based design optimization (Kuschel and Rackwitz, 1997; Eldred et al., 2007). The test problem features a correlated pair of inputs.

## Description

The analytical limit state function is given as:

$$
f(\mathbf{x},\mathbf{p}) = 1 - \frac{4 M_c}{b h^2 Y_C} - \frac{P_C^2}{b^2 h^2 Y_C^2},
$$
where $\mathbf{x} = \{Y_C, M_C, P_C\}$ is the vector of uncertain input variables 
and $\mathbf{p} = \{ b, h\}$ is the vector of deterministic input parameters.

The failure event and the failure probability are defined as $f(\mathbf{x},\mathbf{p}) \leq 0$ and $P_f = \mathbb{P}[f(\mathbf{x},\mathbf{p}) \leq 0]$, respectively.

For reliability-based design optimization (RBDO) problem, the cost to be minimized is the weight of the column is given as:

$$
C(\mathbf{p}) = b h, \;\;\; b \in [5, 15], \; h \in [15,25],
$$

with a target value of failure probability $P_f$ of less than $0.00621$.

## Inputs

The parameters $b$ and $h$ are taken to be deterministic, while $Y_C$, $M_C$, and $P_C$ are uncertain. The nominal values for $b$ and $h$ are $5$ and $15$, respectively. For RBDO problem (Kuschel and Rackwitz, 1997), the domains of these two variables are specified: $b \in [5,15]$ and $h \in [15,25]$. 

The variables $M_C$ and $P_C$ are correlated. The distributions and their parameters of the input variables are given in the table below.

| No  | Variable | Distribution | Parameters | Description |
| :-: | :------: | :----------: | :---------: | :---------- |
| 1   | $Y_C$    | Lognormal  | $\mu_{Y_C} = 5,$<br/>$\sigma_{Y_C} = 0.5$ | Yield stress |
| 2   | $M_C$    | Gaussian   | $\mu_{M_C} = 2 \times 10^3,$<br/>$\sigma_{M_C} = 400,$<br/>$\rho_{M_C, Y_C} = 0.5$ | Bending moment |
| 3   | $P_C$    | Gaussian   | $G_{P_C} = 500,$<br/>$\sigma_{P_C} = 100,$<br/>$\rho_{Y_C, M_C} = 0.5$ | Axial force   |


## Resources

## References

* M. S. Eldred, H. Agarwal, V. M. Perez, S. F. Wojtkiewicz, Jr. and J. E. Renaud, "Investigation of reliability method formulations in DAKOTA/UQ," _Structure and Infrastructure Engineering_, vol. 3, no. 3, pp. 199--213, 2007. [DOI:10.1080/15732470500254618](https://doi.org/10.1080/15732470500254618)
* M. S. Eldred and J. Burkardt, "Comparison of Non-Intrusive Polynomial Chaos and Stochastic Collocation Methods for Uncertainty Quantification," In the _47th 47th AIAA Aerospace Sciences Meeting Including the New Horizons Forum and Aerospace Exposition_, Orlando, Florida, January 5--8, 2009. [DOI:10.2514/6.2009-976](https://doi.org/10.2514/6.2009-976)
* M. S. Eldred, C. G. Webster, and P. G. Constantine, "Evaluation of Non-Intrusive Approaches for Wiener-Askey Generalized Polynomial Chaos," In the _49th AIAA/ASME/ASCE/AHS/ASC Structures, Structural Dynamics, and Material Conference_, Schaumburg, Illinois, April 7--10, 2009. [DOI:10.2514/6.2008-1892](http://doi.org/10.2514/6.2008-1892)
* N. Kuschel and R. Rackwitz, "Two basic problems in reliability-based structural optimization," _Mathematical Methods of Operations Research_, vol. 46, no. 3, pp. 309--333. [DOI:10.1007/BF01194859](https://doi.org/10.1007/BF01194859)