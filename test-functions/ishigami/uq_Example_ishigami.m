%% FOUR-BRANCH FUNCTION
%
% This script contains the model and probabilistic input definitions for
% the 3-dimensional Ishigami function.

%% 1 - INITIALIZE UQLAB
%
clearvars
uqlab

%% 2 - COMPUTATIONAL MODEL
%
ModelOpts.Name = 'ishigamiFunctionModel';
ModelOpts.mFile = 'uq_ishigami';
ModelOpts.isVectorized = true;

myModel = uq_createModel(ModelOpts);

%% 3 - PROBABILISTIC INPUT MODEL
%
InputOpts.Marginals(1).Name = 'X1';
InputOpts.Marginals(1).Type = 'Uniform';
InputOpts.Marginals(1).Parameters = [-pi pi];

InputOpts.Marginals(2).Name = 'X2';
InputOpts.Marginals(2).Type = 'Uniform';
InputOpts.Marginals(2).Parameters = [-pi pi];

InputOpts.Marginals(3).Name = 'X3';
InputOpts.Marginals(3).Type = 'Uniform';
InputOpts.Marginals(3).Parameters = [-pi pi];

myInput = uq_createInput(InputOpts);