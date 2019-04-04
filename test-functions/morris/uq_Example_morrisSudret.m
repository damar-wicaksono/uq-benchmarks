%% MORRIS FUNCTION - TEST FUNCTION IN BLATMAN AND SUDRET (2010)
%
% This script contains the model and probabilistic input definitions
% for the 20-dimensional Morris test function in UQLab following
% the definition in Blatman and Sudret (2010).
%
% *Reference*:
%
% * Blatman, G. and B. Sudret. (2010). Efficient computation of global
%   sensitivity indices using sparse polynomial chaos expansions. 
%   Reliability Engineering & System Safety, vol. 95, pp. 1216-1229. 
%   <https://doi.org/10.1016/j.ress.2010.06.015
%   DOI:10.1016/j.ress.2010.06.015>

%% 1 - INITIALIZE UQLAB
%
clearvars
uqlab

%% 2 - COMPUTATIONAL MODEL
%
ModelOpts.Name = 'morrisFunctionModel';
ModelOpts.mFile = 'uq_morris';
ModelOpts.Parameters = 'Sudret';
ModelOpts.isVectorized = true;

myModel = uq_createModel(ModelOpts);

%% 3 - PROBABILISTIC INPUT MODEL
%
for i = 1:20
    InputOpts.Marginals(i).Type = 'Uniform';
    InputOpts.Marginals(i).Parameters = [0 1];
end

myInput = uq_createInput(InputOpts);