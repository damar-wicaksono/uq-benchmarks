%% *_Rosenbrock Function_*
%
% Syntax:
% Y = UQ_ROSENBROCK(X)
%
% The model contains M=d (independent) random variables (X=[X_1,...,X_d]).
%
% Input:
% X     N x M matrix including N samples of M stochastic parameters
%
% Output/Return:
% Y     column vector of length N including evaluations using rosenbrock
%       function
%


%%%
function Y = uq_rosenbrock(X)


%% Check
%
narginchk(1,1)


%% Evaluation
%
% $$f(\mathbf{x}) = \sum_{i=1}^{d-1} [100(x_{i+1} - x_i^2)^2 + (x_i-1)^2]$$
%

% dimension
d = size(X,2);

index = 1:(d-1);
Y = sum((100*(X(:,index+1)-X(:,index).^2).^2 + (X(:,index)-1).^2),2);


end