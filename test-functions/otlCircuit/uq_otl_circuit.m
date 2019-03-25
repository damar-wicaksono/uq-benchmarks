%% *_OTL Circuit Function_*
%
% Syntax:
% Y = UQ_OTL_CIRCUIT(X)
%
% The model contains M=6 (independent) random variables
% (X=[Rb1,R_b2,R_f,R_c1,R_c2,beta]).
%
% Input:
% X     N x M matrix including N samples of M stochastic parameters
%
% Output/Return:
% Y     column vector of length N including evaluations using otl circuit
%       function
%


%%%
function V_m = uq_otl_circuit(X)


%% Check
%
narginchk(1,1)

assert(size(X,2)==6,'exactly 6 input variables needed')


%% Random variables
%

% resistance b1
R_b1 = X(:,1);
% resistance b2
R_b2 = X(:,2);
% resistance f
R_f = X(:,3);
% resistance c1
R_c1 = X(:,4);
% resistance c2
R_c2 = X(:,5);
% current gain
beta = X(:,6);


%% Abbreviations and ratios
%

% voltage b1
V_b1 = 12*R_b2./(R_b1+R_b2);


%% Evaluation response midpoint voltage
%

V_m = ((V_b1+0.74).*beta.*(R_c2+9))./(beta.*(R_c2+9)+R_f) + ...
    11.35*R_f./(beta.*(R_c2+9)+R_f) + ...
    0.74*R_f.*beta.*(R_c2+9)./((beta.*(R_c2+9)+R_f).*R_c1);


end