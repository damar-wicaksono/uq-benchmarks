function Y = uq_branin(X,P)
% UQ_BRANIN(X,P) computes the Branin function.
%
%   The 2-dimensional Branin function is defined as:
%   $$f(\mathbf{x}) = a(x_2 - bx_1^2 + cx_1 - r)^2 +s(1-t)\cos(x_1) +s$$
%
%   where a, b, c, r, s, and t are scalar parameters.
%
%   Y = UQ_BRANIN(X) evaluates the Branin function for N-by-2 input matrix
%   X, where N is the number of evaluation points; and returns
%   a column vector of length N. The default scalar parameters of the
%   function is:
%     a: 1
%     b: 5.1/(2*pi)^2
%     c: 5/pi
%     r: 6
%     s: 10
%     t: 1/(8*pi)
%
%   Y = UQ_BRANIN(X,P) evaluates the Branin function with user-defined
%   scalar parameters stored in the vector P.
%
%   References:
%
%   - Forrester, A., A. Sóbester, and A. Keane. (2008).
%     Engineering Design via Surrogate Modelling: A Practical Guide, 
%     West Sussex: John Wiley & Sons Ltd., pp. 196-197.
%   - Picheny, V., T. Wagner, and D. Ginsbourger. (2012).
%     A benchmark of kriging-based infill criteria for noisy optimization, 
%     HAL, hal-00658212.
 
%% Check inputs
%
narginchk(1,2)
assert(size(X,2)==2,'Only 2 input variables are allowed!')

%% Evaluate function
%
if nargin == 1 % With default parameters values
    a = 1;
    b = 5.1/(2*pi)^2;
    c = 5/pi;
    r = 6;
    s = 10;
    t = 1/(8*pi);
    
    Y = a*(X(:,2) - b*X(:,1).^2 + c*X(:,1) - r).^2 + s*(1-t)*cos(X(:,1))...
        + s;
end

if nargin==2
    Y = P(1)*(X(:,2) - P(2)*X(:,1).^2 + P(3)*X(:,1) - P(4)).^2 ...
        + P(5)*(1-P(6))*cos(X(:,1)) + P(5);
end

end