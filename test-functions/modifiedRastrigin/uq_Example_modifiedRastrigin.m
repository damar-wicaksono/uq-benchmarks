%% MODIFIED RASTRIGIN FUNCTION
%
% This script contains the model and probabilistic input definitions for
% the 2-dimensional modified Rastrigin test function in UQLab.
% The script also includes a crude Monte Carlo simulation to estimate
% the failure probability.

%% 1 - INITIALIZE UQLAB
%
clearvars
rng(100,'twister')
uqlab

%% 2 - COMPUTATIONAL MODEL
%
ModelOpts.Name = 'modifiedRastriginFunctionModel';
ModelOpts.mFile = 'uq_modifiedRastrigin';
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

%% 4 - RELIABILITY ANALYSIS
%
N = 1e6;
X = uq_getSample(N);
Y = uq_evalModel(X);

Pf = sum(Y<0)/N;

CoV_Pf = sqrt((1-Pf)/(N*Pf));
