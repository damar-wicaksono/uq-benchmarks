%% LIQUID HYDROGEN TANK PROBLEM
%
% This script contains the model and probabilistic input definitions
% for the 5-dimensional liquid hydrogen tank limit state function
% (Bichon et al., 2011) in UQLab.
% The script includes a crude Monte Carlo simulation to estimate
% the failure probability.
%
% *References*:
%
% * Bichon, B. J., J. M. McFarland, and S. Mahadevan. (2011).
%   Efficient surrogate models for reliability analysis of systems
%   with multiple failure modes. Reliability Engineering & System Safety,
%   vol. 96, no. 10, pp. 1386-1395.
%   <https://doi.org/10.1016/j.ress.2011.05.008 [DOI:10.1016/j.ress.2011.05.008]>

%% 1 - INITIALIZE UQLAB
%
clearvars
rng(100,'twister')
uqlab

%% 2 - COMPUTATIONAL MODEL
%
ModelOpts.Name = 'liquidHydrogenTankModel';
ModelOpts.mFile = 'uq_liquidHydrogenTank';
ModelOpts.isVectorized = true;

myModel = uq_createModel(ModelOpts);

%% 3 - PROBABILISTIC INPUT MODEL
%
InputOpts.Marginals(1).Name = 't_plate'; % Plate thickness [-]
InputOpts.Marginals(1).Type = 'Gaussian';
InputOpts.Marginals(1).Moments = [0.07433 0.005];
    
InputOpts.Marginals(2).Name = 't_h'; % Honeycomb thickness [-]
InputOpts.Marginals(2).Type = 'Gaussian';
InputOpts.Marginals(2).Moments = [0.1 0.01];

InputOpts.Marginals(3).Name = 'N_x'; % Loading on tank (x-component) [-]
InputOpts.Marginals(3).Type = 'Gaussian';
InputOpts.Marginals(3).Moments = [13 60];

InputOpts.Marginals(4).Name = 'N_y'; % Loading on tank (y-component) [-]
InputOpts.Marginals(4).Type = 'Gaussian';
InputOpts.Marginals(4).Moments = [4751 48];

InputOpts.Marginals(5).Name = 'N_xy'; % Loading on tank (xy-component) [-]
InputOpts.Marginals(5).Type = 'Gaussian';
InputOpts.Marginals(5).Moments = [-684 11];

myInput = uq_createInput(InputOpts);

%% 4 - RELIABILITY ANALYSIS
%
N = 1e6;
X = uq_getSample(N);
Y = uq_evalModel(X);

Pf = sum(Y<0)/N;

CoV_Pf = sqrt((1-Pf)/(N*Pf));
