%% *_Exp-Tanh Function_*
%
% Syntax:
% Y = UQ_EXP_TANH(X)
%
% The model contains M=2 (independent) random variables (X=[X_1,X_2]).
%
% Input:
% X     N x M matrix including N samples of M stochastic parameters
%
% Output/Return:
% Y     column vector of length N including evaluations using exp_tanh
%       function
%


%%%
function Y = uq_exp_tanh(X)


%% Check
%
narginchk(1,1)

assert(size(X,2)==2,'only 2 input variables allowed')


%% Evaluation
%
% $$f(\mathbf{x}) = exp(-x_1) tanh(5x_2)$$
%

Y = exp(-X(:,1)).*tanh(5*X(:,2));


end