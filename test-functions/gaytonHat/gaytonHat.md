# Gayton Hat Function

[//]: # "Benchmark type: test-case"
[//]: # "Application fields: reliability"
[//]: # "Dimension: 2-dimension"

## Usage

In the paper by Echard et al. (2013), two different performance functions were proposed to compare different algorithms for the computation of failure probability. The first performance function described below is an analytical construct.

## Description

The performance function is defined as:

$$
P1 = 0.5 (U_1 - 2)^2 - 1.5(U_2 - 5)^3 - 3,
$$

where $U_1$ and $U_2$ are standard normal random variables.

## Inputs

| No | Variable | Description | Distribution | Parameters |
| - | - | - | - | - |
| 1 | $U_1$ | standard normal variable | Gaussian | $\mu_{U_1} = 0, \sigma_{U_1} = 1$ |
| 2 | $U_2$ | standard normal variable | Gaussian | $\mu_{U_2} = 0, \sigma_{U_2} = 1$ |

## Resources


## References

* B. Echard, N. Gayton, M. Lemaire, and N. Relun, "A combined Importance Sampling and Kriging reliability method for small failure probabilities with time-demanding numerical models", _Reliability Engineering and System Safety_, vol. 111, pp. 232-240, 2013. [DOI:10.1016/j.ress.2012.10.008](https://doi.org/10.1016/j.ress.2012.10.008).
