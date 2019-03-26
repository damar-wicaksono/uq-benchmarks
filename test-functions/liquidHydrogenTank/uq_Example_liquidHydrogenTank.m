%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Liquid hydrogen tank example
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Performance functions describeD in: 
% Bichon, B.J., McFarland, J.M., Mahadevan, S. (2011). Efficient surrogate 
% models for system reliability analysis of systems with multiple failure 
% modes. Reliability Engineering and System Safety, 96, 1386-1395. 

clearvars
uqlab

%% INPUT
% Definition of the input model
iopts.Marginals(1).Name = 't_plate';     % Plate thickness [-]
iopts.Marginals(1).Type = 'Gaussian';
iopts.Marginals(1).Moments = [0.07433, 0.005];
    
iopts.Marginals(2).Name = 't_h';         % Honeycomb thickness [-]
iopts.Marginals(2).Type = 'Gaussian';
iopts.Marginals(2).Moments = [0.1, 0.01];

iopts.Marginals(3).Name = 'N_x';         % Tank loading (x-component) [-]
iopts.Marginals(3).Type = 'Gaussian';
iopts.Marginals(3).Moments = [13, 60];

iopts.Marginals(4).Name = 'N_y';         % Tank loading (y-component) [-]
iopts.Marginals(4).Type = 'Gaussian';
iopts.Marginals(4).Moments = [4751, 48];

iopts.Marginals(5).Name = 'N_xy';        % Tank loading (xy-component) [-]
iopts.Marginals(5).Type = 'Gaussian';
iopts.Marginals(5).Moments = [-684, 11];

myInput = uq_createInput(iopts);


%% MODEL
% Full model
mopts.Name = 'TankModel';
mopts.mFile = 'uq_LiquidHydrogenTank';
myModel = uq_createModel(mopts);

%% Quick MCS Reliability
NSAMPLES = 1e6;
XX = uq_getSample(NSAMPLES);
YY = uq_evalModel(XX);

Pf = sum(YY<0)/NSAMPLES;