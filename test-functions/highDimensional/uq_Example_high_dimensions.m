%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% HIGH DIMENSIONAL EXAMPLE FUNCTION - EXAMPLE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

clearvars
uqlab


%% INPUT
% Definition of the input model
%

% dimension
n = 40;

for k = 1:n
    iopts.Marginals(k).Name = ['X_' num2str(k)];
    iopts.Marginals(k).Type = 'Lognormal';
    iopts.Marginals(k).Moments = [1, 0.2];
end

clear k


myInput = uq_createInput(iopts);


%% MODEL
% Full model
%

mopts.Name = 'HighDimensionalModel';
mopts.mFile = 'uq_high_dimensions';
myModel = uq_createModel(mopts);


%% Quick MCS Reliability

NSAMPLES = 1e6;
X = uq_getSample(NSAMPLES);
Y = uq_evalModel(X);

Pf = sum(Y<0)/NSAMPLES;

CV_Pf = sqrt((1-Pf)/(NSAMPLES*Pf));
