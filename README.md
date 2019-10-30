# uq-benchmarks

This project contains all the available UQ benchmark functions in MATLAB
along with their respective description in markdown format.

The currently available benchmark test functions are:

- Rosenbrock's Function (_published_)
- Exp-Tanh Function (_published_)
- Gayton Hat Function (_published_)
- Branin Function (_published_)
- Four-Branch Function (_published_)
- OTL Circuit Function (_published_)
- Composite Gaussians (_published_)
- Short Column function (_published_)
- Modified Rastrigin Function (_published_)
- Infinite Slope (_published_)
- Borehole Function (_published_)
- High-dimensional Example Function (_published_)
- Liquid Hydrogen Tank Problem (_published_)
- Ishigami function (_published_)
- Morris function

The references of these functions are stored in a BibTeX file in the `references/` folder.

## Structure of Descriptions

Each benchmark test functions must be accompanied by a description with the following structure:

- Description, preferrably including plots
- Inputs
- Reference values (if any) based on the literature or analytical values
- Resources (the downloadable package)

## Downloadable package content

A benchmark test function is packaged into a zip file with the following content:

- A vectorized implementation of the test function
- definitions for the model and probabilistic inputs (if any) in UQLab
- An BSD 3-clause license

## Creating a zip file

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
