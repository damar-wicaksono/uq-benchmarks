%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INFINITE SLOPE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% benchmark geotechnical reliability problem found in 
% http://140.112.12.21/issmge/edu_2010.htm
% (benchmark 1)

clearvars
uqlab

%% INPUT
% Definition of the input model
iopts.Marginals(1).Name = 'H';           % Depth of soil above bedrock
iopts.Marginals(1).Type = 'Uniform';
iopts.Marginals(1).Parameters = [2, 8];  %m
    
iopts.Marginals(2).Name = 'U';           % Percentage height of water table
iopts.Marginals(2).Type = 'Uniform';
iopts.Marginals(2).Parameters = [0, 1];  % [-]

iopts.Marginals(3).Name = 'phi';         % Effective stress friction angle
iopts.Marginals(3).Type = 'Lognormal';
iopts.Marginals(3).Moments = 35/180*pi * [1, 0.08]; % rad

iopts.Marginals(4).Name = 'theta';       % Slope inclination
iopts.Marginals(4).Type = 'Lognormal';
iopts.Marginals(4).Moments = 20/180*pi * [1, 0.05]; % rad

iopts.Marginals(5).Name = 'Gs';          % specific gravity of soil
iopts.Marginals(5).Type = 'Uniform';
iopts.Marginals(5).Parameters = [2.5, 2.7];

iopts.Marginals(6).Name = 'e';           % void ratio of soil
iopts.Marginals(6).Type = 'Uniform';
iopts.Marginals(6).Parameters = [0.3, 0.6]; 

myInput = uq_createInput(iopts);


%% MODEL
% Full model
mopts.Name = 'InfiteSlopeModel';
mopts.mFile = 'uq_InfiniteSlope';
myModel = uq_createModel(mopts);

%% Quick MCS Reliability
NSAMPLES = 1e6;
XX = uq_getSample(NSAMPLES);
YY = uq_evalModel(XX);

Pf = sum(YY<0)/NSAMPLES;
