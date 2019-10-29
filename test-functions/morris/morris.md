# Morris Function

[//]: # "Benchmark type: test-function"
[//]: # "Application fields: sensitivity"
[//]: # "Dimension: 20-dimension"

The Morris function is a 20-dimensional function typically used to test the performance of sensitivity analysis methods (Morris, 1991; Blatman and Sudret, 2010; Lamboni et al, 2012;).

## Description

The analytical expression of the Morris function is given as:

$$
f(\mathbf{x}) = \beta_o + \sum_{i=1}^{20} \beta_i \omega_i + \sum_{i<j}^{20} \beta_{i,j} \omega_i \omega_j + \sum_{i<j<l}^{20} \beta_{i,j,l} \omega_i \omega_j \omega_l + \sum_{i<j<l<s}^{20} \beta_{i,j,l,s} \omega_{i} \omega_{j} \omega_{l} \omega_{s}
$$
where $\mathbf{x}$ is the vector of input variables; $\omega_i$'s are functions of the input variables; and $\beta$'s are coefficients.

Different versions exist in the literature for the domain of the input variables $\mathbf{x}$ and the definitions of $\omega_i$ and $\beta$'s.

### Blatman and Sudret (2010)

Below are the definitions of $\omega_i$'s and $\beta$'s following Blatman and Sudret (2010):

$$
\omega_i =
\begin{cases}
2 (1.1 \frac{x_i}{x_i + 0.1} - 0.5) & \;\; \text{if} \;\; i = 3,5,7 \\ 
2 (x_i - 0.5) & \;\; \text{otherwise}.
\end{cases}
$$

The zeroth-order coefficient $\beta_0$ is taken to be $0$, while the first-order coefficients $\beta_i$'s are defined as:

$$
\beta_i =
\begin{cases}
20     & \;\; \text{for} \;\; i = 1,\ldots,10 \\
(-1)^i & \;\; \text{for} \;\; i = 11,\ldots,20.
\end{cases}
$$

The second-order coefficients $\beta_{i,j}$'s are defined as:

$$
\beta_{i,j} =
\begin{cases}
-15     & \;\; \text{for} \;\; i,j = 1,\ldots,6 \\
(-1)^{i+j} & \;\; \text{otherwise}.
\end{cases}
$$

The third-order coefficients $\beta_{i,j,l}$'s are defined as:

$$
\beta_{i,j,l} =
\begin{cases}
-10  & \;\; \text{for} \;\; i,j,l = 1,\ldots,5 \\
0    & \;\; \text{otherwise}.
\end{cases}
$$

Finally, the fourth-order coefficients are defined as:

$$
\beta_{i,j,l,s} =
\begin{cases}
5 & \;\; \text{for} \;\; i,j,l,s = 1,\ldots,4 \\
0 & \;\; \text{otherwise}.
\end{cases}
$$

### Morris (1991)

Morris (1991) assigns different values for some of $\beta$'s. That is:

* $\beta_i \sim \mathcal{N}(0,1)$ for $i = 11,\ldots,20$
* $\beta_{i,j} \sim \mathcal{N}(0,1)$ for $i = 7,\ldots,20$

The rest of the definitions is the same as that of Blatman and Sudret (2010).

### Lamboni et al. (2013)

Lamboni et al. (2013) uses the same definitions of $\beta$'s as that of Morris (1991). $\omega_i$, however, is now defined as:

$$
\omega_i =
\begin{cases}
2 (1.1 \frac{x_i}{x_i + 1} - 0.5) & \;\; \text{if} \;\; i = 3,5,7 \\ 
2 (x_i - 0.5) & \;\; \text{otherwise}.
\end{cases}
$$

## Inputs

In the version of Morris (1991) as well as Blatman and Sudret (2010), the inputs are modeled as independent uniform random variables as given in the table below.

|No |Variable|Distribution|Parameters|
|:-:|:------:|:----------:|:--------:|
| 1  | $x_1$   | Uniform     | $x_{1,\min}=0,$<br/>$x_{1,\max}=1$|
| $\vdots$ |$\vdots$   |$\vdots$ | $\vdots$                      |
| 20 | $x_{20}$| Uniform     | $x_{20,\min}=0,$<br />$x_{20,\max}=1$ |

The version given in Lamboni et al. (2013) replaces some of the input variables above with the definitions given below.

|No |Variable|Distribution|Parameters|
|:-:|:------:|:----------:|:--------:|
| 1 | $x_2$  | Gaussian   |$\mu_{x_2} = 0.5,$<br/>$\sigma_{x_2} = (0.1)^{0.5}$ |
| 2 | $x_3$  | Exponential|$\lambda_{x_3} = 4$ |
| 3 | $x_4$  | Gumbel     |$\mu_{x_4}=0.2,$<br/>$\beta_{x_4}=0.2$ |
| 4 | $x_5$  | Weibull    |$\alpha_{x_5}=0.5,$<br/>$\beta_{x_5}=2$|
| 5 | $x_{12}$| Gaussian   |$\mu_{x_{12}}=0.5,$<br/>$\sigma_{x_{12}}=(0.1)^{0.5}$|
| 6 | $x_{13}$| Exponential|$\lambda_{x_{13}} = 4$ |
| 7 | $x_{14}$| Gumbel     |$\mu_{x_{14}}=0.2,$<br/>$\beta_{x_{14}}=0.2$|
| 8 | $x_{15}$| Weibull    |$\alpha_{x_{15}}=0.5,$<br/>$\beta_{x_{15}}=2$|

## Resources

The vectorized implementation of the Morris function in MATLAB as well as the script file with the model and probabilistic inputs definitions for the function in UQLAB can be downloaded below:

The contents of the file are:

|Filename|Description|
|:-------|:----------|
| `uq_morris` | vectorized implementation of the Morris function in MATLAB |
| `uq_Example_morris.m` | definitions for the model and probabilistic inputs in UQLab with $\omega_i$, the coefficients, and input marginals following Morris (1991) |
| `uq_Example_morrisSudret.m` | definitions for the model and probabilistic inputs in UQLab with $\omega_i$, the coefficients, and input marginals following Blatman and Sudret (2010) |
| `uq_Example_morrisLamboni.m` | definitions for the model and probabilistic inputs in UQLab with $\omega_i$, the coefficients, and input marginals following Lamboni et al. (2013) |
| `LICENSE` | license for the function (BSD 3-Clause) |

> **Note**: The three versions of $\omega_i$ and $\beta$'s are supported in the `uq_morris` function. Call the function with an additional argument `'Morris'`, `'Sudret'`, or `'Lamboni'` to use the definitions of Morris (1991), Blatman and Sudret (2010), or Lamboni et al. (2013), respectively. See the in-code documentation for detail.

## References

* M. D. Morris, "Factorial sampling plans for preliminary computational experiments," _Technometrics_, vol. 33, pp. 161--174, 1991. [DOI:10.1080/00401706.1991.10484804](https://doi.org/10.1080/00401706.1991.10484804)
* G. Blatman and B. Sudret, "Efficient computation of global sensitivity indices using sparse polynomial chaos expansions," _Reliability Engineering & System Safety_, vol. 95, pp. 1216--1229, 2010. [DOI:10.1016/j.ress.2010.06.015](https://doi.org/10.1016/j.ress.2010.06.015)
* M. Lamboni, B. Iooss, A.-L. Popelin, and F. Gamboa, "Derivative-based global sensitivity measures: General links with Sobol' indices and numerical tests," _Mathematics and Computers in Simulation_, vol. 87, pp. 45--54, 2013. [DOI:10.1016/j.matcom.2013.02.002](https://doi.org/10.1016/j.matcom.2013.02.002)