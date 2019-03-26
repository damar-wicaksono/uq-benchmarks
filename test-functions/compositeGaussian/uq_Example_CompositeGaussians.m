%% COMPOSITE GAUSSIANS FUNCTION
%
% This script contains the model and probabilistic input definitions of the
% composite Gaussians test function for UQLab. It is followed by a crude
% Monte Carlo simulation to estimate the failure probability.

%% 1 - INITIALIZE UQLAB
%
clearvars
rng(100,'twister')
uqlab

%% 2 - COMPUTATIONAL MODEL
%
ModelOpts.Name = 'CompositeGaussianFunctionModel';
ModelOpts.mFile = 'uq_CompositeGaussians';
myModel = uq_createModel(ModelOpts);

%% 3 - PROBABILISTIC INPUT MODEL
%
InputOpts.Marginals(1).Name = 'X1';              
InputOpts.Marginals(1).Type = 'Gaussian';
InputOpts.Marginals(1).Moments = [5.5 1];

InputOpts.Marginals(2).Name = 'X2';
InputOpts.Marginals(2).Type = 'Gaussian';
InputOpts.Marginals(2).Parameters = [5 1];

myInput = uq_createInput(InputOpts);

%% 4 - RELIABILITY ANALYSIS
%
NSamples = [1e4 1e5 1e6 1e7];
Pf = zeros(length(NSamples),1);
Cov_Pf = zeros(length(NSamples),1);

for i=1:length(NSamples)
    XX = uq_getSample(NSamples(i));
    YY = uq_evalModel(XX);
    Pf(i) = sum(YY<0)/NSamples(i);
    Cov_Pf(i) = sqrt((1-Pf(i))/NSamples(i)/Pf(i));
end
