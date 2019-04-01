function Y = uq_shortColumn(X,P)
% UQ_SHORTCOLUMN computes the short column limit state function.
%
%   Y = UQ_SHORTCOLUMN(X) evaluates the limit state function of the short 
%   column model for N-by-3 input matrix X, where N is the number of 
%   evaluation points: 
%      X(:,1): Yc, yield stress
%      X(:,2): Mc, bending moment
%      X(:,3): Pc, axial force
%   and returns a column vector of length N. The two parameters of the 
%   function is stored in the vector P with default values: 
%      P(1): b, width
%      P(2): h, depth
%
%  Y = UQ_SHORT COLUMN(X,P) allows to manually specify the values for the 
%  parameters b and h in the vector P = [b h].
%
%  References:
%
%  - Kirjner-Neto, C., E. Polak, and A. Der Kiureghian. (1995).
%    Algorithms for reliability-based optimal design.
%    Reliability and Optimization of Structural Systems. IFIP - The
%    International Federation for Information Processing, Springer,
%    pp. 144-152. DOI:10.1007/978-0-387-34866-7_13
%  - Kuschel, N. and R. Rackwitz (1997). Two basic problems in
%    reliability-based structural optimization. Mathematical Methods of
%    Operations Research, vol. 46, no. 3, pp. 309-333. 
%    DOI:10.1007/BF01194859
%  - Eldred, M. S., H. Agarwal, V. M. Perez, S. F. Wojtkiewicz, Jr.
%    and J. E. Renaud. (2007). Investigation of reliability method
%    formulations in DAKOTA/UQ. Structure and Infrastructure Engineering,
%    vol. 3, no. 3, pp. 199-213, 2007. DOI:10.1080/15732470500254618


%% Check inputs
%
narginchk(1,2)
assert(size(X,2)==2,'only 2 input variables allowed')

%% Assign default parameter values
%
if nargin > 1
    b = P(1);
    h = P(2);
else
    b = 5;
    h = 15;
end

%% Assign inputs to local variables
%
Y_C = X(:,1);
M_C = X(:,2);
P_C = X(:,3);

%% Evaluate limit state function
%
Y_Term1 = (4*M_C)./(b.*h.^2*Y_C);
Y_Term2 = (P_C./(b.*h.*Y_C)).^2;

%%
% Limit State function
Y = 1 - Y_Term1 - Y_Term2;

end