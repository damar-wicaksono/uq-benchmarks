# Four-Branch Function

[//]: #	"Benchmark type: test-function"
[//]: #	"Application fields: reliability"
[//]: #	"Dimension: 2-dimension"

The 2-dimensional four-branch function is a common benchmark problem in reliability analysis (Schueremans and van Gemert, 2005; Echard et al., 2011; Scöbi et al., 2017). The function describes the failure of a series system with four distinct limit state components.

## Description

The mathematical formulation of the four-branch function reads:

$$
f(\mathbf{x}) =
\min 
\begin{Bmatrix}
     3 + 0.1(x_1 - x_2)^2 - \frac{x_1 + x_2}{\sqrt{2}}\\
     3 + 0.1(x_1 - x_2)^2 + \frac{x_1 + x_2}{\sqrt{2}}\\
     (x_1 - x_2) + \frac{6}{\sqrt{2}}\\
     (x_2 - x_1) + \frac{6}{\sqrt{2}}
\end{Bmatrix}
$$

where the input variables $\mathbf{x} = \{x_1, x_2\}$ are modeled as two independent Gaussian random variables.

The failure event is defined as $f(\mathbf{x}) \leq 0$ and the failure probability $P_f = \mathbb{P}[f(\mathbf{x}) \leq 0]$.


## Inputs

The two input variables are modeled as independent Gaussian random variables.

|  No  |      Variable      | Distribution | Parameters |
| :--: | :----------------: | :----------: | :--------- |
|  1   | $x_1$ |   Gaussian   | $\mu_{x_1} = 0$<br/>$\sigma_{x_1} = 1$ |
|  2   | $x_2$ |   Gaussian   | $\mu_{x_2} = 0$<br/>$\sigma_{x_2} = 1$ |

## Reference values

Some reference values for the failure probability $P_f$ from the literature are shown in the table below.

|  Method   | N |  $\hat{P}_f$   | $\text{COV}[\hat{P}_f]$ |    Source  |
| :-------: | :---------: | :--: | :------: | :------------------: |
| <abbr title="Monte Carlo simulation">MCS</abbr> |   $10^8$    | $4.460 \times 10^{-3}$ | $1.5\%$ | Schöbi et al. (2017) |
| MCS  |   $10^6$    | $4.416 \times 10^{-3}$ | $0.15\%$ | Echard et al. (2011) |
| <abbr title="Important Sampling">IS</abbr> |   $1469$    | $4.9 \times 10^{-3}$ | - | Echard et al. (2011) |

## Resources

## References

* B. Echard, N. Gayton, and M. Lemaire, "AK-MCS: An active learning reliability method combining kriging and Monte Carlo simulation", _Reliability Engineering and System Safety_, vol. 33, no. 2, pp. 145-154, 2011. [DOI:10.1016/j.ress.2012.10.008](https://doi.org/10.1016/j.ress.2012.10.008)
* R. Schöbi, B. Sudret, and S. Marelli, "Rare event estimation using polynomial-chos Kriging," _Journal of Risk Uncertainty in Engineering System, Part A: Civil Engineering_, vol. 3, no. 2, 2017. [DOI:10.1061/AJRUA6.0000870](https://doi.org/10.1061/AJRUA6.0000870)
* L. Schueremans and D. van Gemert, "Benefit of splines and neural networks in simulation based structural reliability analysis," _Structural Safety_, vol. 27, no. 3, 2005. [DOI:10.1016/j.strusafe.2004.11.001](https://doi.org/10.1016/j.strusafe.2004.11.001)