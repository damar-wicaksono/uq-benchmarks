function Y = uq_ishigami(X,P)
% UQ_ISHIGAMI computes the Ishigami function.
%
%   Y = UQ_ISHIGAMI(X) evaluates the Ishigami function for N-by-3 input 
%   matrix X, where N is the number of evaluation points with default 
%   parameter values a = 7 and b = 0.1. The function returns a column 
%   vector of length N.
%
%   Y = UQ_ISHIGAMI(X,P) evaluates the Ishigami function with an additional
%   user-specified parameters stored in P with P = [a, b].
%
%   Reference:
%
%   - Ishigami, T. and T. Homma. (1990). An importance quantification
%     technique in uncertainty analysis for computer models.
%     In the First International Symposium on Uncertainty Modeling and
%     Analysis, Maryland, USA, Dec. 3-5. DOI:10.1109/ISUMA.1990.151285
%

%% Check inputs
%
narginchk(1,2)
assert(size(X,2)==3,'Only 3 input variables are allowed!')

%% Assign default parameter values
%
switch nargin
    case 1
        a = 7;
        b = 0.1;
    case 2 
        a = P(1);
        b = P(2);
    otherwise    
        error('Number of input arguments not accepted!');
end

%% Evaluate the function
%
Y = sin(X(:,1)) + a*(sin(X(:,2)).^2) + b*(X(:,3).^4).* sin(X(:,1));

end