# Ishigami Function

[//]: # "Benchmark type: test-function"
[//]: # "Application fields: sensitivity, uncertainty-quantification"
[//]: # "Dimension: 3-dimension"

The Ishigami function is commonly used as a test function to benchmark global sensitivity analysis methods.

## Description

The analytic expression of the Ishigami function is given as:

$$
f(\mathbf{x}) = \sin{x_1} + a \sin^2{x_2} + b x_3^4 \sin{x_1}
$$

where $\mathbf{x} = \{x_1, x_2,x_3\} \in [-\pi, \pi]^3$ are input variables; while $a$ and $b$ are constants.

The Ishigami function is highly nonlinear and non-monotonous, particularly influenced by $x_3$.

![ishigamiHistogram|200x200](/home/wdamar/projects/uq-benchmarks/test-functions/ishigami/ishigamiHistogram.png)
**Figure 1**: The histogram of the Ishigami function based on $10^6$ sample points.


## Inputs

For computer experiments, the inputs $x_1, x_2,x_3$ are modeled as three independent uniform random variables.

| No   | Variable | Distribution | Parameters                        |
| ---- | -------- | ------------ | --------------------------------- |
| 1    | $x_1$    | Uniform     | $x_{1,\min} = -\pi, x_{1,\max} = \pi$ |
| 2    | $x_2$    | Uniform     | $x_{2,\min} = -\pi, x_{2,\max} = \pi$ |
| 3    | $x_2$    | Uniform     | $x_{3,\min} = -\pi, x_{3,\max} = \pi$ |

## Constants

The recommended values of the constants according to Marrel et al. (2009) are shown below.

| No | Constant | Value |
| - | - | - |
| 1 | a | 7 |
| 2 | b | 0.1 |

Other values are recommended according to Sobol' and Levitan (1999).

| No | Constant | Value |
| - | - | - |
| 1 | a | 7 |
| 2 | b | 0.05 |

## Resources


## References

* T. Ishigami and T. Homma, "An importance quantification technique in uncertainty analysis for computer models," In _the First International Symposium on Uncertainty Modeling and Analysis_, Maryland, USA, Dec. 3--5, 1990.  [DOI: 10.1109/ISUMA.1990.151285](https://doi.org/10.1109/ISUMA.1990.151285)
* I. M. Sobol' and Y. L. Levitan, "On the use of variance reducing multipliers in Monte Carlo computations of a global sensitivity index," _Computer Physics Communications_, vol. 117, no. 1, pp. 52--61, 1999. [DOI:10.1016/S0010-4655(98)00156-8](https://doi.org/10.1016/S0010-4655(98)00156-8)
* A. Marrel, B. Iooss, B. Laurent, O. Roustant, "Calculatons of Sobol indices for the Gaussian process metamodel," _Reliability Engineering & System Safety_, vol. 94, no. 3, pp. 742--751, 2009. [DOI:10.1016/j.ress.2008.07.008](https://doi.org/10.1016/j.ress.2008.07.008)