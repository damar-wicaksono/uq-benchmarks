# High-dimensional Function

[//]: #	"Benchmark type: test-function"
[//]: #	"Application fields: reliability"
[//]: #	"Dimension: M-dimension"

The high-dimensional example function is used to test algorithms in structural reliability analysis, such as Adaptive Kriging Monte Carlo simulation (AK-MCS) and others (Rackwitz, 2001; Echard et al., 2013). A prominent feature of this test function is that the failure probability does not change significantly when changing the number of inputs.

## Description

The analytic expression of the high-dimensional example function is given as:

$$
f(\mathbf{x}) = \left(M + 3 a \sqrt{M}\right) - \sum_{i=1}^{M} x_i,
$$

where $M$ is the number of input variables (dimension; positive integer);
$\{x_i\}_{i=1}^{M}$ are the input variables; and $a$ is a constant.



Figure 1 and 2 show the surface and contour plots of the 2-dimensional high-dimensional example function using the default values of the constants, respectively.

![highDimensionalSurface](/home/wdamar/projects/uq-benchmarks/test-functions/highDimensional/highDimensionalSurface.png)
**Figure 1**: Surface plot of the 2-dimensional high-dimensional example function.

![highDimensionalContour](/home/wdamar/projects/uq-benchmarks/test-functions/highDimensional/highDimensionalContour.png)
**Figure 2**: Contour plot of the 2-dimensional high-dimensional example function.

## Inputs

$M$ independent identically distributed lognormal random variables are considered for the high-dimensional example function.

| No     | Variable | Distribution | Parameters                         |
| :----: | :------: | :----------: | :--------------------------------- |
| 1    | $x_1$    | Lognormal      | $di$ |
| $\vdots$    | $\vdots$    | $\vdots$      | $\vdots$ |
| $M$  | $x_M$    | Lognormal      | $i$ |

## Constants

By default, the constant parameter $a$ is set to $0.2$.

## Reference values

## Resources

## References

* R. Rackwitz, "Reliability analysis---a review and some perspectives," _Structural Safety_, vol. 23, no. 4, 2001. [DOI:10.1016/S0167-4730(02)00009-7](https://doi.org/10.1016/S0167-4730(02)00009-7)
* B. Echard, N. Gayton, M. Lemaire, and N. Relun, "A combined Importance Sampling and Kriging reliability method for small failure probabilities with time-demanding numerical models", _Reliability Engineering and System Safety_, vol. 111, pp. 232-240, 2013. [DOI:10.1016/j.ress.2012.10.008](https://doi.org/10.1016/j.ress.2012.10.008)