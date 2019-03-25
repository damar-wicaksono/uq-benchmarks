%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ROSENBROCK FUNCTION - EXAMPLE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

clearvars
uqlab


%% INPUT
% Definition of the input model
%

% dimension
d = 2;

for k = 1:d
    iopts.Marginals(k).Name = ['X_' num2str(k)];
    iopts.Marginals(k).Type = 'Uniform';
    iopts.Marginals(k).Moments = [-5, 10];
end

clear k


myInput = uq_createInput(iopts);


%% MODEL
% Full model
%

mopts.Name = 'rosenbrockFunctionModel';
mopts.mFile = 'uq_rosenbrock';
myModel = uq_createModel(mopts);




