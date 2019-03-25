function Y = uq_GaytonHat(X)
% UQ_GAYTONHAT computes the Gayton Hat test function.
%
%   Y = UQ_GAYTONHAT(X) evaluates the Gayton Hat function for N-by-2 input
%   matrix X, where N is the number of evaluation points; and returns
%   a column vector of length N.
%
%   Reference:
%
%   - Echard, B., N. Gayton, M. Lemaire, and N. Relun. (2013).
%     A combined Importance Sampling and Kriging reliability method
%     for small failure probabilities with time-demanding numerical models. 
%     Reliability Engineering and System Safety, vol. 111, pp. 232-240.

%% Check input
%
narginchk(1,1)
assert(size(X,2)==2,'Only 2 input variables are allowed!')

%% Evaluate function
Y = 0.5*(X(:,1) - 2).^2 - 1.5*(X(:,2) - 5).^3 - 3;

end