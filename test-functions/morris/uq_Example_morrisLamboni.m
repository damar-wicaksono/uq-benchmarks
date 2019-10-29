%% MORRIS FUNCTION - TEST FUNCTION IN LAMBONI ET AL. (2013)
%
% This script contains the model and probabilistic input definitions
% for the 20-dimensional Morris test function in UQLab following
% the definition in Lamboni et al. (2013).
%
% *Reference*:
%
% * Lamboni, M., B. Iooss, A.-L. Popelin, and F. Gamboa. (2013). 
%   Derivative-based global sensitivity measures: General links with
%   Sobol' indices and numerical tests. Mathematics and Computers
%   in Simulation, vol. 87, pp. 45-54.
%   <https://doi.org/10.1016/j.matcom.2013.02.002
%   DOI:10.1016/j.matcom.2013.02.002>

%% 1 - INITIALIZE UQLAB
%
clearvars
uqlab

%% 2 - COMPUTATIONAL MODEL
%
ModelOpts.Name = 'morrisFunctionModel';
ModelOpts.mFile = 'uq_morris';
ModelOpts.Parameters = 'Lamboni';
ModelOpts.isVectorized = true;

myModel = uq_createModel(ModelOpts);

%% 3 - PROBABILISTIC INPUT MODEL
%
for i = [1 6:11 16:20]
    InputOpts.Marginals(i).Type = 'Uniform';
    InputOpts.Marginals(i).Parameters = [0 1];
end

% Define other random variables
InputOpts.Marginals(2).Name = 'X2';
InputOpts.Marginals(2).Type = 'Gaussian';
InputOpts.Marginals(2).Parameters = [0.5 sqrt(0.1)];
    
InputOpts.Marginals(12).Name = 'X12';
InputOpts.Marginals(12).Type = 'Gaussian';
InputOpts.Marginals(12).Parameters = [0.5 sqrt(0.1)];
    
InputOpts.Marginals(3).Name = 'X3';
InputOpts.Marginals(3).Type = 'Exponential';
InputOpts.Marginals(3).Parameters = [4];
    
InputOpts.Marginals(13).Name = 'X13';
InputOpts.Marginals(13).Type = 'Exponential';
InputOpts.Marginals(13).Parameters = [4];
    
InputOpts.Marginals(4).Name = 'X4';
InputOpts.Marginals(4).Type = 'Gumbel';
InputOpts.Marginals(4).Parameters = [0.2 0.2];
    
InputOpts.Marginals(14).Name = 'X14';
InputOpts.Marginals(14).Type = 'Gumbel';
InputOpts.Marginals(14).Parameters = [0.2 0.2];
    
InputOpts.Marginals(5).Name = 'X5';
InputOpts.Marginals(5).Type = 'Weibull';
InputOpts.Marginals(5).Parameters = [0.5 2];
    
InputOpts.Marginals(15).Name = 'X15';
InputOpts.Marginals(15).Type = 'Weibull';
InputOpts.Marginals(15).Parameters = [0.5 2];

myInput = uq_createInput(InputOpts);