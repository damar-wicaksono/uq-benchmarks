%% ROSENBROCK FUNCTION
%
% This script contains the model and probabilistic input definitions
% for a 2-dimensional Rosenbrock's test function in UQLab.

%% 1 - INITIALIZE UQLAB
%
uqlab

%% 2 - COMPUTATIONAL MODEL
%
ModelOpts.Name = 'rosenbrockFunctionModel';
ModelOpts.mFile = 'uq_rosenbrock';
myModel = uq_createModel(ModelOpts);

%% 3 - PROBABILISTIC INPUT MODEL
%
M = 2;
for k = 1:M
    InputOpts.Marginals(k).Type = 'Uniform';
    InputOpts.Marginals(k).Moments = [-5 10];
end

myInput = uq_createInput(InputOpts);