# Short Column Function

[//]: # "Benchmark type: test-function"
[//]: # "Application fields: metamodeling, rbdo"
[//]: # "Dimension: 3-dimension"

The 3-dimensional Short column function models a short column with a rectangular cross-section (width $b$ and depth $h$) having uncertain material properties (yield stress $Y_C$) and subjected to uncertain loads (bending moment $M_C$ and axial force $P_C$). The function is used as a test function in metamodeling (Eldred and Burkardt, 2009; Eldred et al., 2008) and reliability-based design optimization (Kirjner-Neto et al., 1995; Kuschel and Rackwitz, 1997; Eldred et al., 2007). The test problem features a correlated pair of inputs.

## Description

The analytical limit state function is given as:

$$
f(\mathbf{x},\mathbf{p}) = 1 - \frac{4 M_c}{b h^2 Y_C} - \frac{P_C^2}{b^2 h^2 Y_C^2},
$$
where $\mathbf{x} = \{Y_C, M_C, P_C\}$ is the vector of uncertain input variables and $\mathbf{p} = \{ b, h\}$ is the vector of parameters.

The failure event and the failure probability are defined as $f(\mathbf{x},\mathbf{p}) \leq 0$ and $P_f = \mathbb{P}[f(\mathbf{x},\mathbf{p}) \leq 0]$, respectively.

For reliability-based design optimization (RBDO) problem, the cost to be minimized is the weight of the column is given as:

$$
C(\mathbf{p}) = b h, \;\;\; b \in [5, 15], \; h \in [15,25],
$$

with a target value for the failure probability $P_f$ of less than $0.00621$ (or reliability index $\beta$ of more than $2.5$).

## Inputs

The input variables are modeled as random variables with distributions and their parameters given in the table below. The variables $M_C$ and $P_C$ are correlated.

| No  | Variable | Distribution | Parameters | Description |
| :-: | :------: | :----------: | :---------: | :---------- |
| 1   | $Y_C$    | Lognormal    | $\mu_{Y_C} = 5,$<br/>$\sigma_{Y_C} = 0.5$ | Yield stress |
| 2   | $M_C$    | Gaussian     | $\mu_{M_C} = 2 \times 10^3,$<br/>$\sigma_{M_C} = 400,$<br/>$\rho_{M_C, Y_C} = 0.5$ | Bending moment |
| 3   | $P_C$    | Gaussian     | $mu_{P_C} = 500,$<br/>$\sigma_{P_C} = 100,$<br/>$\rho_{Y_C, M_C} = 0.5$  | Axial force |

## Parameters

The nominal values for the parameters $b$ (width) and $h$ (depth) are $5$ and $15$, respectively. For RBDO problem, these parameters are the design variables and their domains are specified (Kuschel and Rackwitz, 1997): $b \in [5,15]$ and $h \in [15,25]$.

## Reference values

Some reference values for the optimal $b$ and $h$ under reliability-based design optimization are shown in the table below.

| Source | $b^*$ | $h^*$  |
| :---- | :-:   | :---:  |
| Kirjner-Neto et al. (1995) | $8.668$ | $25.0$ | 
| Kuschel and Rackwitz (1997)| $8.668$ | $25.0$ |
| Eldred et al. (2007) | $8.68$ | $25.0$ |      

## Resources

The vectorized implementation of the Short column function in MATLAB as well as the script file with the model and probabilistic inputs definitions for the function in UQLab can be downloaded below:


| Filename| Description|
| :------ | :--------- |
| uq_shortColumn.m | vectorized implementation of the Short column function in MATLAB |
| uq_Example_shortColumn.m | definitions for the model and probabilistic inputs in UQLab |
| LICENSE | lices for the function (BSD 3-Clause) |

## References

* C. Kirjner-Neto, E. Polak, and A. Der Kiureghian, "Algorithms for reliability-based optimal design," In _Reliability and Optimization of Structural Systems. IFIP --- The International Federation for Information Processing_, Springer, pp. 144--152, 1995. [DOI:10.1007/978-0-387-34866-7_13](https://doi.org/10.1007/978-0-387-34866-7_13)
* N. Kuschel and R. Rackwitz, "Two basic problems in reliability-based structural optimization," _Mathematical Methods of Operations Research_, vol. 46, no. 3, pp. 309--333, 1997. [DOI:10.1007/BF01194859](https://doi.org/10.1007/BF01194859)
* M. S. Eldred, H. Agarwal, V. M. Perez, S. F. Wojtkiewicz, Jr. and J. E. Renaud, "Investigation of reliability method formulations in DAKOTA/UQ," _Structure and Infrastructure Engineering_, vol. 3, no. 3, pp. 199--213, 2007. [DOI:10.1080/15732470500254618](https://doi.org/10.1080/15732470500254618)
* M. S. Eldred and J. Burkardt, "Comparison of Non-Intrusive Polynomial Chaos and Stochastic Collocation Methods for Uncertainty Quantification," In the _47th 47th AIAA Aerospace Sciences Meeting Including the New Horizons Forum and Aerospace Exposition_, Orlando, Florida, January 5--8, 2009. [DOI:10.2514/6.2009-976](https://doi.org/10.2514/6.2009-976)
* M. S. Eldred, C. G. Webster, and P. G. Constantine, "Evaluation of Non-Intrusive Approaches for Wiener-Askey Generalized Polynomial Chaos," In the _49th AIAA/ASME/ASCE/AHS/ASC Structures, Structural Dynamics, and Material Conference_, Schaumburg, Illinois, April 7--10, 2008. [DOI:10.2514/6.2008-1892](http://doi.org/10.2514/6.2008-1892)
