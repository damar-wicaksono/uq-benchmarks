# OTL Circuit Function

[//]: # "Benchmark type: test-case"
[//]: # "Application fields: metamodeling, sensitivity"
[//]: # "Dimension: 6-dimension"

The six-dimensional OTL circuit function computes the mid-point voltage ($V_m$) of an output transformerless (OTL) push-pull circuit.
It has been used as a test function in metamodeling (Ben-Ari and Steinberg, 2007) and sensitivity analysis for screening (Moon, 2010) exercises.

## Description

The mid-point voltage $(V_m)$ of an OTL push-pull circuit is computed using the following analytical expression:

$$
V_m = f(\mathbf{x}) = \frac{(V_{b1} + 0.74) \beta (R_{c2} + 9)}{\beta (R_{c2} + 9) + R_f} + \frac{11.35 R_f}{\beta (R_{c2} + 9) + R_f} + \frac{0.74 R_f \beta (R_{c2} + 9)}{(\beta (R_{c2} + 9) + R_f) R_{c1}},
$$

where:

$$
V_{b1} = \frac{12 R_{b2}}{R_{b1} + R_{b2}}.
$$

and $\mathbf{x} = \{R_{b1}, R_{b2}, R_{f}, R_{c1}, R_{c2}, \beta\}$ is the vector of input variables described in the table below.

## Inputs

For computer experiment purposes, the input variables are modeled as six independent uniform random variables.

| No | Variable | Distribution | Parameters | Description |
| :-: | :-: | :-: | :- | :- |
| 1 | $R_{b1}$ | Uniform | $R_{b1,\min} = 50,$<br/>$R_{b1,\max} = 150$   | Resistance b1 $[\text{k}\Omega]$ |
| 2 | $R_{b2}$ | Uniform | $R_{b2,\min} = 25,$<br/>$R_{b2,\max} = 70$    | Resistance b2 $[\text{k}\Omega]$ |
| 3 | $R_{f}$  | Uniform | $R_{f,\min} = 0.5,$<br/>$R_{f,\max} = 3$      | Resistance f $[\text{k}\Omega]$ |
| 4 | $R_{c1}$ | Uniform | $R_{c1,\min} = 1.2,$<br/>$R_{c1,\max} = 2.5$  | Resistance c1 $[\text{k}\Omega]$ |
| 5 | $R_{c2}$ | Uniform | $R_{c2,\min} = 0.25,$<br/>$R_{c2,\max} = 1.2$ | Resistance c2 $[\text{k}\Omega]$ |
| 6 | $\beta$  | Uniform | $\beta_{\min} = 50,$<br/>$\beta_{\max} = 300$ | Current gain $[\text{A}]$ |

## Resources

The vectorized implementation of the OTL circuit function in MATLAB as well as the script file with the model and probabilistic inputs definitions of the function in UQLAB can be downloaded below:

 - [uq_otlCircuit.zip](uq_otlCircuit.zip)

| Filename | Description |
| :- | :- | 
| `uq_otlCircuit.m` | vectorized implementation of the OTL circuit function |
| `uq_Example_otlCircuit.m` | UQLab definitions for the model and probabilistic inputs |
| `LICENSE` | license for the function |

## References

* E. N. Ben-Ari and D. M. Steinberg, "Modeling Data from Computer Experiments: An Empirical Comparison of Kriging with MARS and Projection Pursuit Regression," _Quality Engineering_, vol. 19, pp. 327--338, 2007. [DOI:10.1080/08982110701580930](https//doi.org/10.1080/08982110701580930)
* H. Moon, "Design and analysis of computer experiments for screening input variables," Ohio State University, 2010. [URL](https://catalog.ohiolink.edu/iii/encore/record/C__Rb28916024?lang=eng)

