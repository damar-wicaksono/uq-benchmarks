%% BOREHOLE FUNCTION
%
% This script contains the model and probabilistic input definitions for
% the 8-dimensional Borehole function in UQLab. The marginals for the
% probabilistic input model follows Harper and Gupta (1983).
%
% *Reference*:
%
% * Harper, W. V. and S. K. Gupta. (1983) . Sensitivity/Uncertainty
%   Analysis of a Borehole Scenario Comparing Latin Hypercube Sampling
%   and Deterministic Sensitivity Approaches. Office of Nuclear Waste
%   Isolation, Battelle Memorial Institute, Columbus, Ohio, BMI/ONWI-516.
%   <https://inldigitallibrary.inl.gov/PRR/84393.pdf URL>

%% 1 - INITIALIZE UQLAB
%
clearvars
uqlab

%% 2 - COMPUTATIONAL MODEL
%
ModelOpts.Name = 'boreholeModel';
ModelOpts.mFile = 'uq_borehole';
myModel = uq_createModel(ModelOpts);

%% 3 - PROBABILISTIC INPUT MODEL
%

% Radius of the borehole (m)
InputOpts.Marginals(1).Name = 'rw';
InputOpts.Marginals(1).Type = 'Gaussian';
InputOpts.Marginals(1).Parameters = [0.10 0.0161812]; 

% Radius of influence (m)
InputOpts.Marginals(2).Name = 'r'; 
InputOpts.Marginals(2).Type = 'Lognormal';
InputOpts.Marginals(2).Parameters = [7.71 1.0056]; % 

% Transmissivity, upper aquifer (m^2/yr)
InputOpts.Marginals(3).Name = 'Tu'; 
InputOpts.Marginals(3).Type = 'Uniform';
InputOpts.Marginals(3).Parameters = [63070 115600]; % 

% Potentiometric head, upper aquifer (m)
InputOpts.Marginals(4).Name = 'Hu'; 
InputOpts.Marginals(4).Type = 'Uniform';
InputOpts.Marginals(4).Parameters = [990 1110];

% Transmissivity, lower aquifer (m^2/yr)
InputOpts.Marginals(5).Name = 'Tl';
InputOpts.Marginals(5).Type = 'Uniform';
InputOpts.Marginals(5).Parameters = [63.1 116];

% Potentiometric head , lower aquifer (m)
InputOpts.Marginals(6).Name = 'Hl';
InputOpts.Marginals(6).Type = 'Uniform';
InputOpts.Marginals(6).Parameters = [700 820];

% Length of the borehole (m)
InputOpts.Marginals(7).Name = 'L';
InputOpts.Marginals(7).Type = 'Uniform';
InputOpts.Marginals(7).Parameters = [1120 1680];

% Borehole hydraulic conductivity (m/yr)
InputOpts.Marginals(8).Name = 'Kw'; 
InputOpts.Marginals(8).Type = 'Uniform';
InputOpts.Marginals(8).Parameters = [9855 12045];

myInput = uq_createInput(InputOpts);