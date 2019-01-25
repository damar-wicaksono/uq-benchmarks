# Gayton Hat Function

[//]: # "Benchmark type: test-function"
[//]: # "Application fields: reliability"
[//]: # "Dimension: 2-dimension"

In the paper by Echard et al. (2013), two different performance functions were proposed to compare different algorithms for the computation of failure probability. The first performance function as described below is an analytical construct.

## Description

The performance function is defined as:

$$
f(\mathbf{x}) = 0.5 (U_1 - 2)^2 - 1.5(U_2 - 5)^3 - 3,
$$

where $\mathbf{x} = \{U_1, U_2\}$ are standard normal random variables.
Figure 1 shows the scatter plot of $5\times 10^6$ sample points, with each point categorized either as failed ($f(\mathbf{x}) < 0) or safe ($f(\mathbf{x}) > 0$)

![gaytonHatScatter](/home/wdamar/projects/uq-benchmarks/test-functions/gaytonHat/gaytonHatScatter.png)
**Figure 1**: Scatter plot of $5 \times 10^6$ sample points.

## Inputs

| No | Variable | Distribution | Parameters |
| - | - | - | - |
| 1 | $U_1$ | Gaussian | $\mu_{U_1} = 0, \sigma_{U_1} = 1$ |
| 2 | $U_2$ | Gaussian | $\mu_{U_2} = 0, \sigma_{U_2} = 1$ |

## Resources


## References

* B. Echard, N. Gayton, M. Lemaire, and N. Relun, "A combined Importance Sampling and Kriging reliability method for small failure probabilities with time-demanding numerical models", _Reliability Engineering and System Safety_, vol. 111, pp. 232-240, 2013. [DOI:10.1016/j.ress.2012.10.008](https://doi.org/10.1016/j.ress.2012.10.008)
