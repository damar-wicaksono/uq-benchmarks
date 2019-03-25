%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Morris function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Performance functions described in: 
% UQLab - List of benchmark problems in sensitivity analysis
% 
% Blatman, G. and B. Sudret (2010). Efficient computation of global 
% sensitivity indices using sparse polynomial chaos expansions. 
% Reliab. Eng. Sys. Safety 95, 1216?1229

clearvars
uqlab

%% MODEL DECISION
% Define whether to use Lamboni model (otherwise uses Sudret)
P.Model = 'Sudret';    % Options 'Lamboni', 'Sudret'
mopts.Parameters = P;

%% INPUT
% Definition of the indexes for random variables
u = [1,6,7,8,9,10,11,16,17,18,19,20];   % Uniform variables
for i=1:numel(u)
    iopts.Marginals(u(i)).Name = strcat('X',num2str(u(i),'%.0f'));
    iopts.Marginals(u(i)).Type = 'Uniform';
    iopts.Marginals(u(i)).Parameters = [0, 1];
end

% Check if we are using the Sudret or the Lamboni model
if strcmp(P.Model,'Sudret')
    sudret = 1;
elseif strcmp(P.Model,'Lamboni')
    sudret = 0; 
end

% Define remaining random variables accordingly
if sudret == 1
    % Define other random variables as uniformly distributed
    u = [2,3,4,5,12,13,14,15];
    for i=1:numel(u)
        iopts.Marginals(u(i)).Name = strcat('X',num2str(u(i),'%.0f'));
        iopts.Marginals(u(i)).Type = 'Uniform';
        iopts.Marginals(u(i)).Parameters = [0, 1];
    end
else
    % Define other random variables
    iopts.Marginals(2).Name = 'X2';
    iopts.Marginals(2).Type = 'Gaussian';
    iopts.Marginals(2).Parameters = [0.5, sqrt(0.1)];
    
    iopts.Marginals(12).Name = 'X12';
    iopts.Marginals(12).Type = 'Gaussian';
    iopts.Marginals(12).Parameters = [0.5, sqrt(0.1)];
    
    iopts.Marginals(3).Name = 'X3';
    iopts.Marginals(3).Type = 'Exponential';
    iopts.Marginals(3).Parameters = [4];
    
    iopts.Marginals(13).Name = 'X13';
    iopts.Marginals(13).Type = 'Exponential';
    iopts.Marginals(13).Parameters = [4];
    
    iopts.Marginals(4).Name = 'X4';
    iopts.Marginals(4).Type = 'Gumbel';
    iopts.Marginals(4).Parameters = [0.2,0.2];
    
    iopts.Marginals(14).Name = 'X14';
    iopts.Marginals(14).Type = 'Gumbel';
    iopts.Marginals(14).Parameters = [0.2,0.2];
    
    iopts.Marginals(5).Name = 'X5';
    iopts.Marginals(5).Type = 'Weibull';
    iopts.Marginals(5).Parameters = [0.5,2];
    
    iopts.Marginals(15).Name = 'X15';
    iopts.Marginals(15).Type = 'Weibull';
    iopts.Marginals(15).Parameters = [0.5,2];
end

myInput = uq_createInput(iopts);

%% MODEL
% Full model
mopts.Name = 'MorrisFunction';
mopts.mFile = 'uq_Morris';
myModel = uq_createModel(mopts);


