%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GAYTON HAT FUNCTION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Echard, B., Gayton, N., Lemaire, M., Relun, N., Reliability Engineering
% and System Safety 111 (2013) 232-240. 

clearvars
uqlab

%% INPUT
% Definition of the input model
iopts.Marginals(1).Name = 'U_1';         % First variable [-]
iopts.Marginals(1).Type = 'Gaussian';
iopts.Marginals(1).Parameters = [0, 1];
    
iopts.Marginals(2).Name = 'U_2';         % Second variable [-]
iopts.Marginals(2).Type = 'Gaussian';
iopts.Marginals(2).Parameters = [0, 1];

myInput = uq_createInput(iopts);


%% MODEL
% Full model
mopts.Name = 'GaytonHat';
mopts.mFile = 'uq_GaytonHat';
myModel = uq_createModel(mopts);

%% Quick MCS Reliability
NSAMPLES = 1e6;
XX = uq_getSample(NSAMPLES);
YY = uq_evalModel(XX);

Pf = sum(YY<0)/NSAMPLES;