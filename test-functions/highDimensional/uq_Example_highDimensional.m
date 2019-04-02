%% HIGH-DIMENSIONAL LIMIT STATE FUNCTION
%
% This script contains the model and probabilistic input definitions for
% the High-dimensional limit state function in UQLab.
% The script also includes a crude Monte Carlo simulation to estimate
% the failure probability for $M = \{50, 100, 200\}$.

%% 1 - INITIALIZE UQLAB
%
clearvars
rng(100,'twister')
uqlab

%% 2 - COMPUTATIONAL MODEL
%
ModelOpts.Name = 'highDimensionalFunctionModel';
ModelOpts.mFile = 'uq_highDimensional';
myModel = uq_createModel(ModelOpts);

%% 3 - PROBABILISTIC INPUT MODELS
%

% Number of dimensions
Dims = [50 100 200];
N = 1e6;

myInputs = [];

for i=1:size(Dims,2)
    for k = 1:Dims(i)
        InputOpts.Marginals(k).Type = 'Lognormal';
        InputOpts.Marginals(k).Moments = [1, 0.2];
    end
    myInputs = [myInputs, uq_createInput(InputOpts, '-private')];
end

%% 4 - RELIABILITY ANALYSIS
%
Pf_est = zeros(1, size(Dims,2));
CoV_est = zeros(1, size(Dims,2));

for i=1:size(Dims,2)
    X = uq_getSample(myInputs(i),N);
    Y = uq_evalModel(myModel,X);
    
    Pf_est(i) = sum(Y<0)/N;
    CoV_est(i) = sqrt((1-Pf_est(i))/(N*Pf_est(i)));
end