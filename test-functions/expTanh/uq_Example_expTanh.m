%% EXP-TANH FUNCTION
%
% This script contains the model and probabilistic input definitions
% for the 2-dimensional Exp-Tanh test function in UQLab.

%% 1 - INITIALIZE UQLAB
%
uqlab

%% 2 - COMPUTATIONAL MODEL
%
ModelOpts.Name = 'expTanhFunctionModel';
ModelOpts.mFile = 'uq_expTanh';
ModelOpts.isVectorized = true;

myModel = uq_createModel(ModelOpts);

%% 3 - PROBABILISTIC INPUT MODEL
%
InputOpts.Marginals(1).Name = 'X1';
InputOpts.Marginals(1).Type = 'Gaussian';
InputOpts.Marginals(1).Parameters = [0 1];

InputOpts.Marginals(2).Name = 'X2';
InputOpts.Marginals(2).Type = 'Gaussian';
InputOpts.Marginals(2).Parameters = [0 1];

myInput = uq_createInput(InputOpts);
