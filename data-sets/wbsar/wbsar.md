# Whole-body Specific Absorption Rate Data Set

[//]: # "Benchmark type: data-set"
[//]: # "Application fields: sensitivity, metamodeling"
[//]: # "Dimension: 4-dimension"

## Context

Though wireless communications are prevalent these days, the risk perception on the possible health impacts of <abbr title="electromagnetic fields"> EMF</abbr> is still important. Before any effect on a human can be assessed or any limit on the level of exposure can be imposed, measuring and monitoring the exposure on a body (_dosimetry_) are the first step towards any protection measure.

Dosimetry studies (i.e., estimation of exposure) often relies on the use of expensive computer simulation. Because the inputs to these simulations are often uncertain, uncertainty quantification of the simulation prediction becomes an important issue to address. Due to the high computational cost, uncertainty quantification via crude Monte Carlo simulation is prohibitive. This calls for more advanced--and efficient--methods. Metamodels have emerged as powerful statistical methods that allow for accurate emulation of the input/output relationship of a complex and expensive computational model. 

The data set described below is resulted from such dosimetry studies, in which the exposure induced by femtocell on a numerical fetus model is estimated. The uncertain inputs considered are the position of the femtocell device.

## Data set description

The data set consists of 356 rows of inputs/output pairs. The first four columns are the inputs and the last is the output.

The four inputs (independent variables of the data set) are the position of the femtocell device described in the table below.

| No  | Variable | Distribution | Parameters | Description |
| :-: | :------: | :----------: | :--------- | :---------- |
| 1  | $r$  | Uniform   | $r_\min = 1,$<br/>$r_\max = 3$ | Radius $[\text{m}]$ |
| 2  | $\phi$    | Uniform | $\phi_{\min} = -90,$ <br/>$\phi_\max = 270$ | Azimuth $[^o]$ |
| 3  | $Z$  | Uniform   | $Z_\min = 0.75,$<br/>$Z_\max = 1.75$ | Elevation $[\text{m}]$ |
| 4  | $\alpha$  | Uniform   | $\alpha_\min = 0,$<br/>$\alpha_\max = 360$ | Rotation $[^o]$ |

The output of the simulation (dependent variable of the data set) is the whole body specific absorption rate (WBSAR). It is the energy absorbed by a body due to emissions from the Femtocell.

The first 100 points of the data sets are generated by LHS and the next 256 points have been added sequentially by an adaptive learning algorithm. The input points are generated according to the distributions of the uncertain inputs shown in the above table.

## Data set files

The data set is contained in a single file `Data001.mat`.

## Applications

The data set has been used for metamodeling and sensitivity analysis exercises (Kerchaudy, 2015; Kerchaudy et al., 2015)

## License

## References

* P. Kersaudy, "Modélisation statistique de l'exposition humaine aux ondes radiofréquences," Université Paris-Est, Marne-la-Vallée, pp. 68--69, 2015.
* P. Kersaudy, B. Sudret, N. Varsier, O. Picon, and J. Wiart, "A new surrogate modeling technique combining Kriging and polynomial chaos expansions -- Application to uncertainty analysis in computational dosimetry," _Journal of Computational Physics_, vol. 286, pp. 103--117, 2015.[DOI:10.1016/j.jcp.2015.01.034](https://doi.org/10.1016/j.jcp.2015.01.034)