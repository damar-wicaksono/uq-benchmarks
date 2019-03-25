%% *_Four-Branch Function_*
%
% Syntax:
% Y = UQ_FOUR_BRANCH(X)
% Y = UQ_FOUR_BRANCH(X,P)
%
% The model contains M=2 (independent) random variables (X=[X_1,X_2])
% and 1 scalar parameter of type double (P=[k]).
%
% Input:
% X     N x M matrix including N samples of M stochastic parameters
% P     vector including parameters
%       by default: k = 6;
%
% Output/Return:
% Y     column vector of length N including evaluations using four-branch
%       function
%


%%%
function Y = uq_four_branch(X,P)


%% Check
%
narginchk(1,2)

assert(size(X,2)==2,'only 2 input variables allowed')


%% Evaluation
%
% $$f(\mathbf{x}) = min \{
% 3 + 0.1\cdot(x_1-x_2)^2 - \frac{x_1+x_2}{\sqrt{2}};
% 3 + 0.1\cdot(x_1-x_2)^2 + \frac{x_1+x_2}{\sqrt{2}};
% (x_1-x_2) + \frac{k}{\sqrt{2}};
% (x_2-x_1) + \frac{k}{\sqrt{2}} \}
% $$
%


if nargin==1
    % Constant
    k = 6;
    
    Y = min( [ 3 + 0.1*(X(:,1)-X(:,2)).^2 - 1/sqrt(2)*(X(:,1)+X(:,2)), ...
        3 + 0.1*(X(:,1)-X(:,2)).^2 + 1/sqrt(2)*(X(:,1)+X(:,2)), ...
        (X(:,1)-X(:,2)) + 1/sqrt(2)*k, ...
        (X(:,2)-X(:,1)) + 1/sqrt(2)*k],[],2);
end


if nargin==2
    Y = min( [ 3 + 0.1*(X(:,1)-X(:,2)).^2 - 1/sqrt(2)*(X(:,1)+X(:,2)), ...
        3 + 0.1*(X(:,1)-X(:,2)).^2 + 1/sqrt(2)*(X(:,1)+X(:,2)), ...
        (X(:,1)-X(:,2)) + 1/sqrt(2)*P, ...
        (X(:,2)-X(:,1)) + 1/sqrt(2)*P],[],2);
end


end