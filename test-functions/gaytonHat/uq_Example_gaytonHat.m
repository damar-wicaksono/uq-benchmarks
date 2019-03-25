%% GAYTON HAT FUNCTION
%
% This script contains the model and probabilistic input definitions for
% the 2-dimensional Gayton Hat test function in UQLab.
% It also includes a crude Monte Carlo simulation to compute
% the failure probability.

%% 1 - INITIALIZE UQLAB
uqlab
rng(100,'twister')

%% 2 - COMPUTATIONAL MODEL
%
ModelOpts.Name = 'gaytonHatFunctionModel';
ModelOpts.mFile = 'uq_gaytonHat';
myModel = uq_createModel(ModelOpts);

%% 3 - PROBABILISTIC INPUT MODEL
%
InputOpts.Marginals(1).Type = 'Gaussian';
InputOpts.Marginals(1).Parameters = [0 1];
    
InputOpts.Marginals(2).Type = 'Gaussian';
InputOpts.Marginals(2).Parameters = [0 1];

myInput = uq_createInput(InputOpts);

%% 4 - RELIABILITY ANALYSIS
%
NSamples = 1e6;
XX = uq_getSample(NSamples);
YY = uq_evalModel(XX);

Pf = sum(YY<0)/NSamples;