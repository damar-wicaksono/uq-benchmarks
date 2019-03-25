%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 10-bar truss structure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% See also:
% Wei, D., and Rahman, S., “Structural Reliability Analysis by Univariate
% Decomposition and Numerical Integration,” Probabilistic Engineering
% Mechanics, Vol. 22, No. 1, 2007, pp. 27–38.
% doi:10.1016/j.probengmech.2006.05.004

clearvars
uqlab

%% Input marginals
for ii = 1:10
    Iopts.Marginals(ii).Name = ['A',num2str(ii)]; %cross section areas
    Iopts.Marginals(ii).Type = 'Gaussian';
    Iopts.Marginals(ii).Moments = [2.5, 0.5]; % in^2
    Iopts.Marginals(ii).Bounds = [1e-5, inf];
end

myInput = uq_createInput(Iopts);


%% Computational model
Mopts.mFile = 'uq_TenBarTruss_response';

myModel = uq_createModel(Mopts);


%% FORM analysis
Aopts.Type = 'Reliability';
Aopts.Method = 'SORM';

Aopts.LimitState.Threshold = 18; % in
Aopts.LimitState.CompOp = '>=';

tic
mySORM = uq_createAnalysis(Aopts);
tSORM = toc;

%% MCS
Aopts.Method = 'MCS';
Aopts.Simulation.MaxSampleSize = 1e4;

tic
myMCS = uq_createAnalysis(Aopts);
tMCS = toc;