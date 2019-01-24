%% Initialize UQLab
clearvars
uqlab
rng(1,'twister')

%% Create input
InputOpts.Marginals(1).Type = 'Gaussian';
InputOpts.Marginals(1).Parameters = [0 1];
InputOpts.Marginals(2).Type = 'Gaussian';
InputOpts.Marginals(2).Parameters = [0 1];

myInput = uq_createInput(InputOpts);

%% Create model for the Gayton hat function
ModelOpts.mString = '0.5 * (X(:,1) - 2).^2 - 1.5 * (X(:,2) - 5).^3 - 3';
ModelOpts.isVectorized = true;

myGaytonHat = uq_createModel(ModelOpts);

%% Evaluate the Gayton hat function
X = uq_getSample(5e6,'LHS');
Y = uq_evalModel(X);

%% Determine failure points
g = char(ones(length(g),1) * 'f(x) > 0');
g(Y < 0,:) = char(ones(length(g(Y<0)),1) * 'f(x) < 0');

%% Create scatter plot
x0 = 10;
y0 = 10;
width = 256;
height = 256;
set(gcf,'position',[x0, y0, width, height])

gscatter(X(:,1), X(:,2), g, 'kr', '.x')
xlabel('U_1')
ylabel('U_2')

saveas(gcf, 'gaytonHatScatter.png')
