# Morris Function

[//]: # "Benchmark type: test-function"
[//]: # "Application fields: sensitivity"
[//]: # "Dimension: 20-dimension"

The Morris function is a 20-dimensional function typically used to test the performance of sensitivity analysis methods (Morris, 1991; Blatman and Sudret, 2010; Lamboni et al, 2012;).

## Description

The analytical expression of the Morris function is given as:

$$
f(\mathbf{x}) = \beta_o + \sum_{i=1}^{20} \beta_i \omega_i + \sum_{i<j}^{20} \beta_{i,j} \omega_i (\mathbf{x}) \omega_j(\mathbf{x}) + \sum_{i<j<l}^{20} \beta_{i,j,l} \omega_i(\mathbf{x}) \omega_j(\mathbf{x}) \omega_l(\mathbf{x}) + \sum_{i<j<l<s}^{20} \beta_{i,j,l,s} \omega_{i}(\mathbf{x}) \omega_{j}(\mathbf{x}) \omega_{l}(\mathbf{x}) \omega_{s}(\mathbf{x})
$$
where $\mathbf{x}$ is the vector of input variables; $\omega_i$ is a function of the input variables; and $\beta$'s are coefficients. 

Different versions exist in the literature for the domain of the input variables $\mathbf{x}$ and the definitions of $\omega_i$ and $\beta$'s.
Below is the definitions of $\omega_i$ and $\beta$'s following Blatman and Sudret (2010):

* $\omega_i = 2 (x_i - 0.5)$ for $i \in \{1,2,\ldots,20\}$ and $i \notin \{3,5,7\}$
* $\omega_i = 2 (1.1 \frac{x_i}{x_i + 0.1} - 0.5)$ for $i \in \{3,5,7\}$
* $\beta_i = 20$ for $i \in \{1,2,\ldots,10\}$
* $\beta_{i,j} = -15$ for $i,j \in \{1,2,3,4,5,6\}$ and $i < j$
* $\beta_{i,j,l} = -10$ for $i,j,l \in \{1,2,3,4,5\}$ and $i < j < l$
* $\beta_{1,2,3,4} = 5$
* $\beta_{i} = (-1)^i$ for $i \in \{11,12,\ldots,20\}$
* $\beta_{i,j} = (-1)^{i+j}$ for $i \in {1,2,\ldots,20}, {j \in \{7,8,\ldots,20\}}$, and $i < j$
* $\beta_{i,j,l} = 0$ for $i \in \{1,2,\ldots,20\}$, $i \in \{1,2,\ldots,20\}$, $l \in \{6,7,\ldots,20\}$, and $i<j<l$ 
* $\beta_{i,j,l,s} = 0$ for $i \neq 1, j \neq 2, l \neq 3, s \neq 4$

## Inputs

The probabilistic input variables as given in Blatman and Sudret (2010) are given in the table below.

|   No     |  Variable  |  Distribution  |  Parameters                               |
| :----:   | :--------: | :------------: | :---------------------------------:       |
| 1        | $x_1$      | Uniform        | $x_{1,\min} = 0,$<br />$x_{1,\max} = 1$   |
| $\vdots$ | $\vdots$   | $\vdots$       | $\vdots$                                  |
| 20       | $x_{20}$   | Uniform        | $x_{20,\min} = 0,$<br />$x_{20,\max} = 1$ |

The version given in Lamboni et al. (2012) is given in the table below.

|   No     |  Variable  |  Distribution  |  Parameters                               |
| :----:   | :--------: | :------------: | :---------------------------------:       |
| 1        | $x_1$      | Uniform        | $x_{1,\min} = 0,$<br />$x_{1,\max} = 1$   |
| 2        | $x_2$      | Gaussian        | $x_{20,\min} = 0,$<br />$x_{20,\max} = 1$ |
| 3        | $x_3$      | Exponential        | $x_{20,\min} = 0,$<br />$x_{20,\max} = 1$ |
| 4        | $x_4$      | Gumbel        | $x_{20,\min} = 0,$<br />$x_{20,\max} = 1$ |
| 5        | $x_5$      | Weibull        | $x_{20,\min} = 0,$<br />$x_{20,\max} = 1$ |
| 6        | $x_6$      | Uniform        | $x_{20,\min} = 0,$<br />$x_{20,\max} = 1$ |
| $\vdots$ | $\vdots$   | $\vdots$       | $\vdots$                                  |
| 10       | $x_{10}$   | Uniform        | $x_{20,\min} = 0,$<br />$x_{20,\max} = 1$ |
| 11       | $x_{11}$   | Uniform        | $x_{20,\min} = 0,$<br />$x_{20,\max} = 1$ |
| 12       | $x_{12}$   | Gaussian        | $x_{20,\min} = 0,$<br />$x_{20,\max} = 1$ |
| 13       | $x_{13}$   | Exponential        | $x_{20,\min} = 0,$<br />$x_{20,\max} = 1$ |
| 14       | $x_{14}$   | Gumbel        | $x_{20,\min} = 0,$<br />$x_{20,\max} = 1$ |
| 15       | $x_{15}$   | Weibull        | $x_{20,\min} = 0,$<br />$x_{20,\max} = 1$ |
| 16       | $x_{16}$   | Uniform        | $x_{20,\min} = 0,$<br />$x_{20,\max} = 1$ |
| $\vdots$ | $\vdots$   | $\vdots$       | $\vdots$                                  |
| 20       | $x_{20}$   | Uniform        | $x_{20,\min} = 0,$<br />$x_{20,\max} = 1$ |

## Reference values

### First-order Sobol' indices

The analytical solution for the first-order Sobol' indices of the Ishigami function as described above is:

* $S_1 = \frac{V_1}{\mathbb{V}[Y]}$
* $S_2 = \frac{V_2}{\mathbb{V}[Y]}$
* $S_3 = \frac{V_3}{\mathbb{V}[Y]}$

where:

* $\mathbb{V}[Y] = \frac{a^2}{8} + \frac{b\pi^4}{5} + \frac{b^2\pi^8}{18} + \frac{1}{2}$
* $V_1 = 0.5 (1 + \frac{b\pi^4}{5})^2$
* $V_2 = \frac{a^2}{8}$
* $V_3 = 0$

### Total-effect Sobol' indices

The analytical solution for the total-effect Sobol' indices of the Ishigami function as described above is:

* $S_{T1} = \frac{V_{T1}}{\mathbb{V}[Y]}$
* $S_{T2} = \frac{V_{T2}}{\mathbb{V}[Y]}$
* $S_{T3} = \frac{V_{T3}}{\mathbb{V}[Y]}$

where:

* $V_{T1} = 0.5 (1 + \frac{b\pi^4}{5})^2 + \frac{8b^2\pi^8}{225}$
* $V_{T2}= \frac{a^2}{8}$
* $V_{T3} = \frac{8b^2\pi^8}{225}$

## Resources


## References

* T. Ishigami and T. Homma, "An importance quantification technique in uncertainty analysis for computer models," In _the First International Symposium on Uncertainty Modeling and Analysis_, Maryland, USA, Dec. 3--5, 1990.  [DOI: 10.1109/ISUMA.1990.151285](https://doi.org/10.1109/ISUMA.1990.151285)
* I. M. Sobol' and Y. L. Levitan, "On the use of variance reducing multipliers in Monte Carlo computations of a global sensitivity index," _Computer Physics Communications_, vol. 117, no. 1, pp. 52--61, 1999. [DOI:10.1016/S0010-4655(98)00156-8](https://doi.org/10.1016/S0010-4655(98)00156-8)
* A. Marrel, B. Iooss, B. Laurent, O. Roustant, "Calculatons of Sobol indices for the Gaussian process metamodel," _Reliability Engineering & System Safety_, vol. 94, no. 3, pp. 742--751, 2009. [DOI:10.1016/j.ress.2008.07.008](https://doi.org/10.1016/j.ress.2008.07.008)
