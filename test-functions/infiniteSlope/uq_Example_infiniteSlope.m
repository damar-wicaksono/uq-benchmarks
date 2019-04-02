%% INFINITE SLOPE MODEL
%
% This script contains the model and probabilistic input definitions for
% the 6-dimensional limit state function of the Infinite Slope model 
% in UQLab. The script also includes a crude Monte Carlo simulation
% to estimate the failure probability.

%% 1 - INITIALIZE UQLAB
%
clearvars
rng(100,'twister')
uqlab

%% 2 - COMPUTATIONAL MODEL
%
ModelOpts.Name = 'infiteSlopeModel';
ModelOpts.mFile = 'uq_infiniteSlope';
myModel = uq_createModel(ModelOpts);

%% 3 - PROBABILISTIC INPUT MODEL
%
InputOpts.Marginals(1).Name = 'H'; % Depth of soil above bedrock (m)
InputOpts.Marginals(1).Type = 'Uniform';
InputOpts.Marginals(1).Parameters = [2 8];

InputOpts.Marginals(2).Name = 'U'; % Relative height of water table(-)
InputOpts.Marginals(2).Type = 'Uniform';
InputOpts.Marginals(2).Parameters = [0 1];

InputOpts.Marginals(3).Name = 'phi'; % Effective stress friction angle (-)
InputOpts.Marginals(3).Type = 'Lognormal';
InputOpts.Marginals(3).Moments = 35/180*pi * [1 0.08];

InputOpts.Marginals(4).Name = 'theta'; % Slope inclination (-)
InputOpts.Marginals(4).Type = 'Lognormal';
InputOpts.Marginals(4).Moments = 20/180*pi * [1 0.05];

InputOpts.Marginals(5).Name = 'Gs'; % Specific gravity of soil (-)
InputOpts.Marginals(5).Type = 'Uniform';
InputOpts.Marginals(5).Parameters = [2.5 2.7];

InputOpts.Marginals(6).Name = 'e'; % Void ratio of soil (-)
InputOpts.Marginals(6).Type = 'Uniform';
InputOpts.Marginals(6).Parameters = [0.3 0.6];

myInput = uq_createInput(InputOpts);

%% 4 - RELIABILITY ANALYSIS
%
NSample = 1e6;
XX = uq_getSample(NSample);
YY = uq_evalModel(XX);

Pf = sum(YY<0)/NSample;

CV_Pf = sqrt((1-Pf)/(NSample*Pf));