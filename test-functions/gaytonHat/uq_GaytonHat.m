function Y = uq_GaytonHat(X)


%%  Performance function for the Gayton Hat function
% This performance function is used in the paper: 
% Echard, B., Gayton, N., Lemaire, M., Relun, N., Reliability Engineering
% and System Safety 111 (2013) 232-240. 
% and contains 2 independent random variables. 
% X = {U_1,U_2}

%% Transformation of random variables into real space

% First variable [-]
U_1 = X(:,1);

% Second variable [-]
U_2 = X(:,2);

%% Evaluation of the performance function
Y = 0.5*(U_1 - 2).^2 - 1.5*(U_2 - 5).^3 - 3;