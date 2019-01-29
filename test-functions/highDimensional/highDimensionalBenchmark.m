%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% HIGH DIMENSIONAL EXAMPLE FUNCTION - EXAMPLE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

%% Initialize UQLab
clearvars
uqlab

%% Create Model object
% Define model using function handle:
highDimensional = @(X) (size(X,2) + 3 * 0.2 * sqrt(size(X,2))) - sum(X,2);
mopts.Name = 'HighDimensionalModel';
mopts.mHandle = highDimensional;
myModel = uq_createModel(mopts);

%% Create Input Object
% Define the input:

% Number of dimensions
N = [50 100 200];

Pf_est = zeros(1, size(N,2));
CoV_est = zeros(1, size(N,2));

for i=1:size(N,2)
    for k = 1:N(i)
        InputOpts.Marginals(k).Name = ['X_' num2str(k)];
        InputOpts.Marginals(k).Type = 'Lognormal';
        InputOpts.Marginals(k).Moments = [1, 0.2];
    end
    
    myInput = uq_createInput(InputOpts);
    
    rng(100,'twister')
    MCOptions.Type = 'Reliability';
    MCOptions.Method = 'MCS';
    
    % Specify the maximum sample size
    MCOptions.Simulation.MaxSampleSize = 1e6;
    
    %  Run the Monte Carlo analysis
    MCAnalysis = uq_createAnalysis(MCOptions);

    Pf_est(i) = MCAnalysis.Results.Pf;
    CoV_est(i) = MCAnalysis.Results.CoV;
    
end
