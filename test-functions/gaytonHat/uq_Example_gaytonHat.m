%% GAYTON HAT FUNCTION
%
% This script contains the model and probabilistic input definitions for
% the 2-dimensional Gayton Hat test function in UQLab.
% The script also includes a crude Monte Carlo simulation to estimate
% the failure probability.

%% 1 - INITIALIZE UQLAB
%
clearvars
rng(100,'twister')
uqlab

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
NSample = 1e6;
XX = uq_getSample(NSample);
YY = uq_evalModel(XX);

Pf = sum(YY<0)/NSample;

CV_Pf = sqrt((1-Pf)/(NSample*Pf));