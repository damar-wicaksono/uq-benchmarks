# Liquid Hydrogen Tank Problem

[//]: # "Benchmark type: test-function"
[//]: # "Application fields: reliability"
[//]: # "Dimension: 5-dimension"

The 5-dimensional liquid hydrogen tank problem is a reliability analysis benchmark problem (Bichon et al., 2011). The problem consists in quantifying the failure probability of a liquid hydrogen fuel tank on a space launch vehicle. The structure of the tank is subjected to stresses caused by ullage pressure, head pressure, axial forces due to acceleration, and bending and shear stresses caused by the weight of the fuel.

## Description

Three different failure modes exist for the tank:

* Von Mises stress failure ($P_{VM}$)
* Isotropic strength failure ($P_{IS}$)
* Honeycomb buckling failure ($P_{HB}$)

The performance function of the overall system is then defined as:

$$
P(\mathbf{x}) = \min{(P_{VM}, P_{IS}, P_{HB})},
$$

where:

$$
P_{VM} = \frac{8.4 \cdot 10^4 \cdot t_{\text{plate}}}{\sqrt{N_x^2 + N_y^2 - N_x N_y + 3 N_{xy}^2}} - 1,
$$

$$
P_{IS}=\frac{8.4 \cdot 10^4 \cdot t_{\text{plate}}}{|N_y|} - 1,
$$

$$
\begin{split}
  P_{HB} = & 0.847  + 0.96 x_1 + 0.986 x_2 - 0.216 x_3 \\ 
                 & + 0.077 x_1^2 + 0.11 x_2^2 + 0.007 x_3^2 \\
                 & + 0.378 x_1 x_2 - 0.106 x_1 x_3 - 0.11 x_2 x_3,
\end{split}
$$

and:

* $x_1 = 4 (t_{\text{plate}} - 0.075)$
* $x_2 = 20 (t_h - 0.1)$
* $x_3 = -6 \cdot 10^3 (\frac{1}{N_{xy}} + 0.003)$

while the input variables of the performance function are $\mathbf{x} = \{t_{\text{plate}}, t_{h}, N_x, N_y, N_{xy}\}$.

## Inputs

The five input variables are modeled as independent Gaussian random variables.

| No | Variable | Distribution | Parameters                          | Description |
| :-:  | :--------: | :------------: | :------------------------------- | :- |
| 1  | $t_{\text{plate}}$ | Gaussian | $\mu_{t_\text{plate}} = 0.07433$<br/>$\sigma_{t_\text{plate}} = 0.005$ | Plate thickness |
| 2  | $t_{h}$  | Gaussian | $\mu_{t_h} = 0.1$<br/>$\sigma_{t_h} = 0.01$ | Honeycomb thickness |
| 3  | $N_x$    | Gaussian | $\mu_{N_x} = 13$<br/>$\sigma_{N_x} = 60$ | Load on tank, $x$-component |
| 4  | $N_y$    | Gaussian | $\mu_{N_y} = 4751$<br/>$\sigma_{N_y} = 48$ | Load on tank $y$-component |
| 5  | $N_{xy}$ | Gaussian | $\mu_{N_{xy}} = -648$<br/>$\sigma{N_{xy}} = 11$ | Load on tank $xy$-component |

## Reference values

Some reference values for the failure probability $P_f$ from the literature are shown in the table below. Note that the values from Bichon et al. (2011) are average values over $20$ replications.

|  Method  |  Sample size  |  $P_f$  |  Source  |
| :------: | :-----------: | :-----: | :------: |
| MCS (LHS)  | $10^4$ | 0.000700 | Bichon et al. (2011) |
| MCS (LHS)  | $10^5$ | 0.000692 | Bichon et al. (2011) |
| MCS (LHS)  | $10^6$ | 0.000697 | Bichon et al. (2011) |

## Resources

## References

* B. J. Bichon, J. M. McFarland, and S. Mahadevan, "Efficient surrogate models for reliability analysis of systems with multiple failure modes," _Reliability Engineering & System Safety_, vol. 96, no. 10, 2011. [DOI:10.1016/j.ress.2011.05.008](https://doi.org/10.1016/j.ress.2011.05.008)