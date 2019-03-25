%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EXP_TANH FUNCTION - EXAMPLE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

clearvars
uqlab


%% INPUT
% Definition of the input model
% Remark: only 2 input variables allowed!
%

iopts.Marginals(1).Name = 'X_1';
iopts.Marginals(1).Type = 'Gaussian';
iopts.Marginals(1).Parameters = [0, 1];

iopts.Marginals(2).Name = 'X_2';
iopts.Marginals(2).Type = 'Gaussian';
iopts.Marginals(2).Parameters = [0, 1];

myInput = uq_createInput(iopts);


%% MODEL
% Full model
%

mopts.Name = 'exp_tanhFunctionModel';
mopts.mFile = 'uq_exp_tanh';
myModel = uq_createModel(mopts);