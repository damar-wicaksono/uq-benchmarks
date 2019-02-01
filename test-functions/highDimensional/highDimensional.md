# High-dimensional Example Function

[//]: #	"Benchmark type: test-function"
[//]: #	"Application fields: reliability"
[//]: #	"Dimension: M-dimension"

The high-dimensional example function is used to test algorithms in structural reliability analysis, such as Adaptive Kriging Monte Carlo simulation (AK-MCS) and others (Rackwitz, 2001). A prominent feature of this test function is that the failure probability does not change significantly when changing the number of input dimensions.

## Description

The analytic expression of the high-dimensional example function is given as:

$$
f(\mathbf{x}) = \left(M + 3 a \sqrt{M}\right) - \sum_{i=1}^{M} x_i,
$$

where $M$ is the number of input variables (dimension; positive integer);
$\{x_i\}_{i=1}^{M}$ are the input variables; and $a$ is a constant. By default, the constant is set to $0.2$.

The failure event is defined as $f(\mathbf{x}) \leq 0$ and the failure probability $P_f = \mathbb{P}[f(\mathbf{x}) \leq 0]$. Figure 1 and 2 show the surface and contour plots of the 2-dimensional high-dimensional example function using the default values of the constants, respectively.
In Figure 2, the limit state function ($f(\mathbf{x}) = 0$) is shown.

![highDimensionalSurface](/home/wdamar/projects/uq-benchmarks/test-functions/highDimensional/highDimensionalSurface.png)
**Figure 1**: Surface plot of the 2-dimensional high-dimensional example function.

![highDimensionalContour](/home/wdamar/projects/uq-benchmarks/test-functions/highDimensional/highDimensionalContour.png)
**Figure 2**: Contour plot of the 2-dimensional high-dimensional example function. The limit state function is also shown.

## Inputs

$M$ independent identically distributed lognormal random variables are considered for the high-dimensional example function.

| No       | Variable | Distribution | Parameters  |
| :----:   | :------: | :---------: | :------------|
| 1        | $x_1$    | Lognormal   | $\mu_{x_1} = 1,$<br />$\sigma_{x_1} = 0.2$     |
| $\vdots$ | $\vdots$ | $\vdots$    | $\vdots$     |
| M        | $x_M$    | Lognormal   | $\mu_{x_1} = 1,$<br />$\sigma_{x_1} = 0.2$     |

## Constants

By default, the constant parameter $a$ is $0.2$ following Rackwitz (2001).

## Reference values

The asymptotic value of the failure probability $P_f$ with $M \rightarrow \infty$ is $1.35 \times 10^{-3}$ (Rackwitz, 2001). Some other values of $P_f$ calculated using different methods for different values of $M$ are shown in the table below.

|  Method   | $M$ | $N$ |  $\hat{P}_f$   | $\text{COV}[\hat{P}_f]$ |    Source  |
| :-------: | :---------: | :---------: | :--: | :------: | :------------------: |
| <abbr title="First-order reliability method">FORM</abbr> |   $50$    |  $154$ | $1.531 \times 10^{-4}$ | --- | Rackwitz (2001) |
| FORM | $100$  | $304$ | $3.369 \times 10^{-4}$ | --- | Rackwitz (2001)  |
| <abbr title="Second-order reliability method">SORM</abbr> | $100$ |   $1'480$    | $2.555 \times 10^{-3}$ | --- | Rackwitz (2001) |
| SORM | $100$  | $5'455$   | $2.98 \times 10^{-3}$ | --- | Rackwitz (2001) |
| SORM | $200$  | $20'904$ | $4.53 \times 10^{-3}$ | --- | Rackwitz (2001) |
| <abbr title="Monte Carlo simulation">MCS</abbr> | $50$ |   $10^{6}$    | $1.915 \times 10^{-3}$ | $2.28\%$ | UQLab v1.1 |
| MCS | $100$ |   $10^{6}$    | $1.795 \times 10^{-3}$ | $2.36\%$ | UQLab v1.1 |
| MCS | $200$ |   $10^{6}$    | $1.572 \times 10^{-3}$ | $2.52\%$ | UQLab v1.1 |

## Resources

## References

* R. Rackwitz, "Reliability analysis---a review and some perspectives," _Structural Safety_, vol. 23, no. 4, 2001. [DOI:10.1016/S0167-4730(02)00009-7](https://doi.org/10.1016/S0167-4730(02)00009-7)