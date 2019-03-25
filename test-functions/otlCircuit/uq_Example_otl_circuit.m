%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% OTL CIRCUIT FUNCTION - EXAMPLE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

clearvars
uqlab


%% INPUT
% Definition of the input model
%

iopts.Marginals(1).Name = 'R_b1';               % resistance b1
iopts.Marginals(1).Type = 'Uniform';
iopts.Marginals(1).Moments = [50, 150];         % [k-ohms]

iopts.Marginals(2).Name = 'R_b2';               % resistance b2
iopts.Marginals(2).Type = 'Uniform';
iopts.Marginals(2).Moments = [25, 70];          % [k-ohms]

iopts.Marginals(3).Name = 'R_f';                % resistance f
iopts.Marginals(3).Type = 'Uniform';
iopts.Marginals(3).Moments = [0.5, 3];          % [k-ohms]

iopts.Marginals(4).Name = 'R_c1';               % resistance c1
iopts.Marginals(4).Type = 'Uniform';
iopts.Marginals(4).Moments = [1.2, 2.5];        % [k-ohms]

iopts.Marginals(5).Name = 'R_c2';               % resistance c2
iopts.Marginals(5).Type = 'Uniform';
iopts.Marginals(5).Moments = [0.25, 1.2];       % [k-ohms]

iopts.Marginals(6).Name = 'beta';               % current gain
iopts.Marginals(6).Type = 'Uniform';
iopts.Marginals(6).Moments = [50, 300];         % [amperes]


myInput = uq_createInput(iopts);


%% MODEL
% Full model
%

mopts.Name = 'otl_circuitFunctionModel';
mopts.mFile = 'uq_otl_circuit';
myModel = uq_createModel(mopts);