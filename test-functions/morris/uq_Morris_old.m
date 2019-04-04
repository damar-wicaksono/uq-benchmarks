function Y = uq_Morris(X,P)

%%  Performance function
% This performance function is used in the paper: 
% UQLab - List of benchmark problems in sensitivity analysis
%
% Blatman, G. and B. Sudret (2010). Efficient computation of global 
% sensitivity indices using sparse polynomial chaos expansions. 
% Reliab. Eng. Sys. Safety 95, 1216?1229 

%% Definition of constants
[n,~] = size(X);
morris = 0;
% Retrieve which model we are using
if exist('P')
    if isfield(P,'Model')
        if strcmp('Lamboni',P.Model)
            sudret = 0;
        elseif strcmp('Morris',P.Model)
            sudret = 0;
            morris = 1;
        else
            sudret = 1;
        end
    else
        sudret = 1;
    end
else 
    sudret = 1;
end

% Constant b's
b0 = 0;
b1 = 20;
b2 = -15; 
b3 = -10;
b4 = 5;

%% Intermidiate computation of weights
ind1 = [1,2,4,6,8,9,10,11,12,13,14,15,16,17,18,19,20]; 
ind2 = [3,5,7]; 
W(:,ind1) = 2*(X(:,ind1) - 1/2);
if sudret == 1
    W(:,ind2) = 2*(1.1*X(:,ind2)./(X(:,ind2)+0.1) - 1/2);   % Sudret Version
elseif morris == 1
    W(:,ind2) = 2*(1.1*X(:,ind2)./(X(:,ind2)+0.1) - 1/2);   % Sudret Version
else
    W(:,ind2) = 2*(1.1*X(:,ind2)./(X(:,ind2)+1) - 1/2);     % Lamboni Version
end

%% Computation of performance function 
% Add constant term (Initialization)
Y = b0*ones(n,1); 

% Add first order terms
for i=1:10
    Y = Y + b1*W(:,i);
end
if sudret == 1
    for i=11:20
        Y = Y + (-1)^i*W(:,i); % Sudret Version
    end
else
    for i=11:20
        Y = Y + randn*W(:,i); % Lamboni Version
    end
end

% Add second order terms
for j=2:6
    for i=1:j-1
        Y = Y + b2*W(:,i).*W(:,j);
    end
end
if sudret == 1
    for j=7:20
        for i=1:j-1
            Y = Y + (-1)^(i+j)*W(:,i).*W(:,j);  % Sudret Version
        end
    end
else
    for j=7:20
        for i=1:j-1
            Y = Y + randn*W(:,i).*W(:,j);      % Lamboni Version
        end
    end
end

% Add third order terms
for l=3:5
    for j=2:l-1
        for i=1:j-1
            Y = Y + b3*W(:,i).*W(:,j).*W(:,l);
        end
    end
end

% Add fourth order terms (Endresult)
Y = Y + b4*W(:,1).*W(:,2).*W(:,3).*W(:,4);      

end
