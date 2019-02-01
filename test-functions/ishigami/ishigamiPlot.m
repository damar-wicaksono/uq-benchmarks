%% Initialize UQLab
clearvars
uqlab
rng(100,'twister')

%% Create input
InputOpts.Marginals(1).Type = 'Uniform';
InputOpts.Marginals(1).Parameters = [-pi pi];
InputOpts.Marginals(2).Type = 'Uniform';
InputOpts.Marginals(2).Parameters = [-pi pi];
InputOpts.Marginals(3).Type = 'Uniform';
InputOpts.Marginals(3).Parameters = [-pi pi];

myInput = uq_createInput(InputOpts);

%% Create model for the Ishigami function
ModelOpts.mFile = 'uq_ishigami';
ModelOpts.isVectorized = true;

myModel = uq_createModel(ModelOpts);

%% Generate sample points and model responses
X = uq_getSample(1e6,'LHS');
Y = uq_evalModel(myModel,X);

%% Create the histogram
uq_figure('Position', [50 50 500 400]);
uq_histogram(Y);
xlabel('Y')
ylabel('Number of samples')

saveas(gcf, 'ishigamiHistogram.png')