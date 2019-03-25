function Y = uq_rosenbrock(X)
% UQ_ROSENBROCK computes the M-dimensional Rosenbrock's function.
%
%   The M-dimensional Rosenbrock's function is defined as:
%   $$f(\mathbf{x}) = \sum_{m=1}^{M-1} [100(x_{m+1} - x_m^2)^2 + (x_m - 1)^2]$$
%
%   Y = UQ_ROSENBROCK(X) computes the Rosenbrock's function for N-by-M 
%   input matrix X, where N and M are the number of evaluation points and
%   the number of dimensions, respectively.
%

%% Check input
narginchk(1,1)

%% Get the number of dimensions
M = size(X,2);

%% Evaluate function
idx = 1:(M-1);
Y = sum((100*(X(:,idx+1)-X(:,idx).^2).^2 + (X(:,idx)-1).^2),2);

end