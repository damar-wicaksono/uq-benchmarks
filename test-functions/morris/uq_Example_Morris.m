%% MORRIS FUNCTION - TEST FUNCTION IN MORRIS (1991)
%
% This script contains the model and probabilistic input definitions
% for the 20-dimensional Morris function in UQLab following the definition
% in Morris (1991).
%
% *Reference*:
%
% * Morris, M. D. (1991). Factorial sampling plans for preliminary
%   computational experiments. Technometrics, vol. 33, pp. 161-174. 
%   <https://doi.org/10.1080/00401706.1991.10484804
%   DOI:10.1080/00401706.1991.10484804>

%% 1 - INITIALIZE UQLAB
%
clearvars
uqlab

%% 2 - COMPUTATIONAL MODEL
%
ModelOpts.Name = 'morrisFunctionModel';
ModelOpts.mFile = 'uq_morris';
ModelOpts.Parameters = 'Morris';
ModelOpts.isVectorized = true;

myModel = uq_createModel(ModelOpts);

%% 3 - PROBABILISTIC INPUT MODEL
%
for i = 1:20
    InputOpts.Marginals(i).Type = 'Uniform';
    InputOpts.Marginals(i).Parameters = [0 1];
end

myInput = uq_createInput(InputOpts);