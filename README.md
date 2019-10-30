# uq-benchmarks


## Test Functions 

This project contains all the available UQ benchmark functions in MATLAB
along with their respective description in markdown format.

The currently available benchmark test functions are:

| Function Name  | Folder Name  | # of Input Variables   | Application Fields   | Published in UQWorld   |
|-----------------------------------|---|---|---|---|
| Rosenbrock's Function             | `rosenbrock`         | m  | optimization  | yes |
| Exp-Tanh Function                 | `expTanh`            | 2  | metamodeling  | yes |
| Gayton Hat Function               | `gaytonHat`          | 2  | reliability   | yes |
| Four-Branch Function              | `fourBranch`         | 2  | reliability   | yes |
| OTL Circuit Function              | `otlCircuit`         | 6  | metamodeling, | yes |
|                                   |                      |    | sensitivity   |     |
| Composite Gaussians               | `compositeGaussians` | 2  | reliability,  | yes |
|                                   |                      |    | metamodeling  |     |
| Short Column Function             | `shortColumn`        | 3  | rbdo          | yes |
| Modified Rastrigin Function       | `modifiedRastrigin`  | 2  | reliability   | yes |
| Infinite Slope                    | `infiniteSlope`      | 6  | reliability   | yes |
| Borehole Function                 | `borehole`           | 8  | sensitivity,  | yes |
|                                   |                      |    | metamodeling  |     |
| High-Dimensional Example Function | `highDimensional`    | m  | reliability   | yes |
| Liquid Hydrogen Tank Problem      | `liquidHydrogenTank` | 5  | reliability   | yes |
| Ishigami Function                 | `ishigami`           | 3  | sensitivity   | yes |
| Morris Function                   | `morris`             | 20 | sensitivity   |     |
| Ten Bar Truss                     | `tenBarTruss`        |    |               |     |
| Branin Function                   | `branin`             | 2  | metamodeling, | yes |
|                                   |                      |    | optimization  |     |

The references of these functions are stored in a BibTeX file in the `references/` folder.

### Structure of Descriptions

Each benchmark test functions must be accompanied by a description with the following structure:

- Metadata (as Markdown comment): benchmark type, application fields, dimension
- Description, preferrably including plots (e.g., input/output surface, or illustration of the problem).
  The scripts to generate the plots or the illustration in vector graphics format are stored in the respective folder.
- Inputs
- Reference values (if any) based on the literature or analytical values
- Resources (the downloadable package)
- References the source of the benchmark test functions

### Downloadable package content

A benchmark test function is packaged into a zip file with the following content:

- A vectorized implementation of the test function
- Definitions for the model and probabilistic inputs (if any) in UQLab
- A BSD 3-clause license

### Creating a zip file

In UQWorld, the relevant files are provided for community members.
A Makefile is available to compile a set of required files as a zip.
If the list of benchmark functions is updated then the Makefile should be updated as well.

For example to create a zip file for the Gayton hat test function:

```bash
make uq_gaytonHat.zip
```

Note that the recipe for this particular function is:

```makefile
ZIP=zip
...
uq_rosenbrock.zip: ./rosenbrock/uq_rosenbrock.m ./rosenbrock/uq_Example_rosenbrock.m LICENSE
	$(ZIP) -j ./rosenbrock/$@ $^
```

## Data sets

In addition to test functions, data sets were planned to be released in UQWorld.
A draft of the description has been made in `data-sets/wbsar`.
However, because the licensing of the data itself has not been settled, they cannot be released publicly.
