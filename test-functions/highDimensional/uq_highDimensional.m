function Y = uq_highDimensional(X,P)
% UQ_HIGHDIMENSIONAL computes the High-dimensional limit state function.
%
%   Y = UQ_HIGHDIMENSIONAL(X) evaluates the high-dimensinal limit state
%   function for N-by-M input matrix X, where N and M are the numbers of 
%   evaluation points and input dimensions, respectively; and returns 
%   a column vector of length N. The default scalar parameter value is 0.2.
%
%   Y = UQ_HIGHDIMENSIONAL(X,P) evaluates the high-dimensional limit state
%   function with an additional user-specified scalar parameter stored
%   in P.
%
%   Reference:
%
%   - Rackwitz, R. (2001). Reliability analysis - a review and some
%     perspectives. Structural Safety, vol. 23, no. 4, pp. 365-395.
%     DOI:10.1016/S0167-4730(02)00009-7
%

%% Check input
%
narginchk(1,2)

%% Assign default parameter
%
if nargin==1
    a = 0.2;
else
    a = P;
end

%% Get the number of dimensiona
%
M = size(X,2);

%% Evaluate the limit state function
%
Y = (M + 3*a*sqrt(M)) - sum(X,2);

end