%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BRANIN FUNCTION - EXAMPLE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

clearvars
uqlab


%% INPUT
% Definition of the input model
% Remark: only 2 input variables allowed!
%

iopts.Marginals(1).Name = 'X_1';
iopts.Marginals(1).Type = 'Uniform';
iopts.Marginals(1).Parameters = [-5, 10];

iopts.Marginals(2).Name = 'X_2';
iopts.Marginals(2).Type = 'Uniform';
iopts.Marginals(2).Parameters = [0, 15];

myInput = uq_createInput(iopts);


%% MODEL
% Full model
%

mopts.Name = 'braninFunctionModel';
mopts.mFile = 'uq_branin';
myModel = uq_createModel(mopts);


