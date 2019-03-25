%% *_High Dimensional Function_*
%
% Syntax:
% Y = UQ_HIGH_DIMENSIONS(X)
% Y = UQ_HIGH_DIMENSIONS(X,P)
%
% The model contains M=n (independent) random variables (X=[X_1,...,X_n])
% and 1 scalar parameter of type double (P=[a]).
%
% Input:
% X     N x M matrix including N samples of M stochastic parameters
% P     vector including parameters
%       by default: a = 0.2;
%
% Output/Return:
% Y     column vector of length N including evaluations using high
%       dimensional example function
%


%%%
function Y = uq_high_dimensions(X,P)


%% Check
%
narginchk(1,2)


%% Evaluation
%
% $$f(\mathbf{x}) = (n+3a \sqrt{n}) - \sum_{i=1}^n X_i$$
%

% dimension
n = size(X,2);

if nargin==1
    % Constant
    a = 0.2;
    
    Y = (n + 3*a*sqrt(n)) - sum(X,2);
end


if nargin==2
    Y = (n + 3*P*sqrt(n)) - sum(X,2);
end


end