%% SENSITIVITY: OVERVIEW OF THE AVAILABLE METHODS
% In this example, *sensitivity* analysis on the Cantilever Beam 
% Displacememnt function (as described in 
% http://www.sfu.ca/~ssurjano/canti.html) will be performed with a 
% number of techniques

%% 1 - STARTUP OF THE FRAMEWORK
%  Clear variables from the workspace and reinitialize the UQLab framework
clearvars;
uqlab;
rng(100) % fix the random seed for repeatable results

%% 2 - COMPUTATIONAL MODEL
% The computational model is an analytical formula that is used to model
% a simple uniform cantilever beam with horizontal and vertical loads.
% More specifically, the response of the Cantilever Beam model is the
% displacement.
% (http://www.sfu.ca/~ssurjano/canti.html). 
% It is a model with 3 stochastic parameters and 3 independent deterministic
% parameters.
%
% Create a model from the uq_CantileverBeamDisplacement.m file
MOpts.mFile = 'uq_CantileverBeamDisplacement';
myModel = uq_createModel(MOpts);

%% 3 - PROBABILISTIC INPUT MODEL
%  Create the 3-dimensional stochastic input model.
%  (Type "help uq_CantileverBeamDisplacement" for a detailed explanation of
% the meaning of each variable)

IOpts.Marginals(1).Name = 'E'; % Young's modulus of beam material (psi)
IOpts.Marginals(1).Type = 'Gaussian';
IOpts.Marginals(1).Parameters = [2.9E7, 1.45E6];

IOpts.Marginals(2).Name = 'X_L';  % Horizontal load (lb)
IOpts.Marginals(2).Type = 'Gaussian';
IOpts.Marginals(2).Parameters = [500, 100];

IOpts.Marginals(3).Name = 'Y_L'; % Vertical load (lb)
IOpts.Marginals(3).Type = 'Gaussian';
IOpts.Marginals(3).Parameters = [1000, 100];

%%
% Create and store the input object in UQLab
myInput = uq_createInput(IOpts);

%% 4 - SENSITIVITY ANALYSIS
%  Sensitivity analysis on the Cantilever Beam Displacement model is
%  performed with the following methods:
%  - Input/output correlation
%  - Standard Regression Coefficients
%  - Perturbation method
%  - Cotter sensitivity indices
%  - Morris elementary effects
%  - Sobol' sensitivity indices

%% 4.1 - Input/output correlation analysis
%  Select the sensitivity tool and the correlation module
CorrSensOpts.Type = 'uq_sensitivity';
CorrSensOpts.Method = 'Correlation';
%%
%  Specify the sample size used to calculate the correlation-based indices
CorrSensOpts.Correlation.SampleSize = 10000;
%%
%  Create and add the sensitivity analysis to UQLab
CorrAnalysis = uq_createAnalysis(CorrSensOpts);
%%
%  Printout a report of the results
uq_print(CorrAnalysis);
%%
%  Create a graphical representation of the results
uq_display(CorrAnalysis);

%% 4.2 - Standard Regression Coefficients (SRC) 
%  Select the sensitivity tool and the SRC module
SRCSensOpts.Type = 'uq_sensitivity';
SRCSensOpts.Method = 'SRC';
%%
% Specify the sample size used to calculate the regression-based indices
SRCSensOpts.SRC.SampleSize = 10000;
%%
% Create and add the sensitivity analysis to UQLab
SRCAnalysis = uq_createAnalysis(SRCSensOpts);
%%
% Printout a report of the results:
uq_print(SRCAnalysis);
%%
% Create a graphical representation of the results
uq_display(SRCAnalysis);


%% 4.3 - Perturbation-based indices 
% Select the sensitivity tool and the perturbation module
PerturbationSensOpts.Type = 'uq_sensitivity';
PerturbationSensOpts.Method = 'Perturbation';
%%
% Create and add the sensitivity analysis to UQLab
PerturbationAnalysis = uq_createAnalysis(PerturbationSensOpts);
%%
% Printout a report of the results:
uq_print(PerturbationAnalysis);
%%
% Create a graphical representation of the results
uq_display(PerturbationAnalysis);

%% 4.4 - Cotter sensitivity indices
% Select the sensitivity tool and the Cotter module
CotterSensOpts.Type = 'uq_sensitivity';
CotterSensOpts.Method = 'Cotter';
%%
% Specify the boundaries for the factorial design
CotterSensOpts.Factors.Boundaries = 0.5;
%%
% Create and add the sensitivity analysis to UQLab
CotterAnalysis = uq_createAnalysis(CotterSensOpts);
%%
% Printout a report of the results:
uq_print(CotterAnalysis);
%%
% Create a graphical representation of the results
uq_display(CotterAnalysis);


%% 4.5 - Morris' elementary effects
% Select the sensitivity tool and the Morris module
MorrisSensOpts.Type = 'uq_sensitivity';
MorrisSensOpts.Method = 'Morris';
%%
% Specify the boundaries for the Morris method. Make sure there are no
% unphysical values (e.g., with the positive-only lognormal variable #2)
MorrisSensOpts.Factors.Boundaries = 0.5;
%%
% Specify the maximum cost (in model evaluations) to calculate the
% Morris elementary effects
MorrisSensOpts.Morris.Cost = 10000;
%%
% Create and add the sensitivity analysis to UQLab
MorrisAnalysis = uq_createAnalysis(MorrisSensOpts);
%%
% Printout a report of the results:
uq_print(MorrisAnalysis);
%%
% Create a graphical representation of the results
uq_display(MorrisAnalysis);

%% 4.6 - Sobol' indices
% Select the sensitivity tool and the Sobol' module
SobolOpts.Type = 'uq_sensitivity';
SobolOpts.Method = 'Sobol';
%%
% Specify the maximum order of the Sobol'  indices calculation
SobolOpts.Sobol.Order = 1;
%%
%  Specify the sample size of each variable. Note that the total cost will
%  equal (M+2)*SampleSize for sampling-based Sobol' indices calculation.
SobolOpts.Sobol.SampleSize = 10000;
%%
% Create and add the sensitivity analysis to UQLab
SobolAnalysis = uq_createAnalysis(SobolOpts);

%  Printout a report of the results:
uq_print(SobolAnalysis);
%%
% Create a graphical representation of the results
uq_display(SobolAnalysis);

