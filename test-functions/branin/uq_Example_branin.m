%% BRANIN FUNCTION
%
% This script contains the model and probabilistic input definitions
% for a 2-dimensional Branin function in UQLab.

%% 1 - INITIALIZE UQLAB
%
clearvars
uqlab

%% 2 - COMPUTATIONAL MODEL
%
ModelOpts.Name = 'braninFunctionModel';
ModelOpts.mFile = 'uq_branin';
ModelOpts.isVectorized = true;

myModel = uq_createModel(ModelOpts);

%% 3 - PROBABILISTIC INPUT MODEL
%
InputOpts.Marginals(1).Name = 'X1';
InputOpts.Marginals(1).Type = 'Uniform';
InputOpts.Marginals(1).Parameters = [-5 10];

InputOpts.Marginals(2).Name = 'X2';
InputOpts.Marginals(2).Type = 'Uniform';
InputOpts.Marginals(2).Parameters = [0 15];

myInput = uq_createInput(InputOpts);
