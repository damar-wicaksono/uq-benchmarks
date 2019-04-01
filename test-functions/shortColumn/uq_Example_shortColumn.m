%% SHORT COLUMN FUNCTION
%
% This script contains the model and probabilistic input definitions for
% the 3-dimensional Short column function in UQLab.

%% 1 - INITIALIZE UQLAB
%
clearvars
uqlab

%% 2 - COMPUTATIONAL MODEL
%
ModelOpts.Name = 'shortColumnFunctionModel';
ModelOpts.mFile = 'uq_shortColumn';
myModel = uq_createModel(ModelOpts);

%% 3 - PROBABILISTIC INPUT MODEL
%
InputOpts.Marginals(1).Name = 'Y'; % Yield stress
InputOpts.Marginals(1).Type = 'Lognormal';
InputOpts.Marginals(1).Moments = [5 0.5]; % (MPa)

InputOpts.Marginals(2).Name = 'M'; % Bending moment
InputOpts.Marginals(2).Type = 'Gaussian';
InputOpts.Marginals(2).Moments = [2000 400];

InputOpts.Marginals(3).Name = 'P'; % Axial force
InputOpts.Marginals(3).Type = 'Gaussian';
InputOpts.Marginals(3).Moments = [500 100];

InputOpts.Copula.Type = 'Gaussian';
InputOpts.Copula.RankCorr = [1 0 0; 0 1 0.5; 0 0.5 1];

myInput = uq_createInput(InputOpts);
