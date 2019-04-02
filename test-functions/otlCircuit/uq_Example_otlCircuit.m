%% OTL CIRCUIT FUNCTION
%
% This script contains the model and probabilistic input definitions of the
% OTL circuit test function for UQLab.

%% 1 - INITIALIZE UQLAB
%
clearvars
uqlab

%% 2 - COMPUTATIONAL MODEL
%
ModelOpts.Name = 'OTLCircuitFunctionModel';
ModelOpts.mFile = 'uq_otlCircuit';
ModelOpts.isVectorized = true;

myModel = uq_createModel(ModelOpts);

%% 3 - PROBABILISTIC INPUT MODEL
%
InputOpts.Marginals(1).Name = 'Rb1'; % Resistance b1 (kOhm)
InputOpts.Marginals(1).Type = 'Uniform';
InputOpts.Marginals(1).Parameters = [50 150];

InputOpts.Marginals(2).Name = 'Rb2'; % Resistance b1 (kOhm)
InputOpts.Marginals(2).Type = 'Uniform';
InputOpts.Marginals(2).Parameters = [25 70];

InputOpts.Marginals(3).Name = 'Rf'; % Resistance f (kOhm)
InputOpts.Marginals(3).Type = 'Uniform';
InputOpts.Marginals(3).Parameters = [0.5 3];

InputOpts.Marginals(4).Name = 'Rc1'; % Resistance c1 (kOhm)
InputOpts.Marginals(4).Type = 'Uniform';
InputOpts.Marginals(4).Parameters = [1.2 2.5];

InputOpts.Marginals(5).Name = 'Rc2'; % Resistance c2 (kOhm)
InputOpts.Marginals(5).Type = 'Uniform';
InputOpts.Marginals(5).Parameters = [0.25 1.2];

InputOpts.Marginals(6).Name = 'beta'; % Current gain (A)
InputOpts.Marginals(6).Type = 'Uniform';
InputOpts.Marginals(6).Parameters = [50 300];

myInput = uq_createInput(InputOpts);
