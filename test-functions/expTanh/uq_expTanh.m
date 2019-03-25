function Y = uq_expTanh(X)
% UQ_EXPTANH computes the 2-dimensional Exp-Tanh test function.
%
%   The 2-dimensional Exp-Tanh function is defined as:
%   $$f(\mathbf{x}) = exp(-x_1) tanh(5x_2)$$
%
%   Y = UQ_EXPTANH(X) computes the Exp-Tanh function for N-by-2 input
%   matrix X, where N is the number of evaluation points; and returns
%   column vector of length N.

%% Check input
%
narginchk(1,1)
assert(size(X,2)==2,'Only 2 input variables are allowed!')

%% Evaluate function
%
Y = exp(-X(:,1)) .* tanh(5*X(:,2));

end