function Y = uq_borehole(X)
% UQ_BOREHOLE evaluates the Borehole function.
%
%   Y = uq_borehole(X) evaluates the Borehole function for N-by-8 input
%   matrix X, where N is the number of evaluation points; and returns
%   the values of the water flow through a borehole in a vector of
%   length N. The eight input variables are:
%      X(:,1): rw, radius of borehole (m)
%      X(:,2): r, radius of influence (m)
%      X(:,3): Tu, transmissivity of upper aquifer (m^2/year)
%      X(:,4): Hu, potentiometric head of upper aquifer (m)
%      X(:,5): Tl, transmissivity of lower aquifer (m^2/year)
%      X(:,6): Hl, potentiometric head of lower aquifer (m)
%      X(:,7): L, length of borehole (m)
%      X(:,8): Kw, hydraulic conductivity of borehole (m/year)
%
%   References:
%
%   - Harper, W. V. and S. K. Gupta. (1983) . Sensitivity/Uncertainty
%     Analysis of a Borehole Scenario Comparing Latin Hypercube Sampling
%     and Deterministic Sensitivity Approaches. Office of Nuclear Waste
%     Isolation, Battelle Memorial Institute, Columbus, Ohio, BMI/ONWI-516.
%     URL:https://inldigitallibrary.inl.gov/PRR/84393.pdf
%   - Morris, M. D., T. J. Mitchell, and D. Ylvisaker. (1993).
%     Bayesian design and analysis of computer experiments: Use of
%     derivatives in surface prediction. Technometrics, vol. 35, no. 3,
%     pp. 243--255. DOI:10.1080/00401706.1993.10485320
%

%% Check input
%
narginchk(1,1)
assert(size(X,2) == 8, 'Exactly 8 input variables are needed!')

%% Assign input to local variables
%
rw = X(:,1); % Radius of borehole (m)
r  = X(:,2); % Radius of influence (m)
Tu = X(:,3); % Transmissivity of upper aquifer (m^2/year)
Hu = X(:,4); % Potentiometric head of upper aquifer (m)
Tl = X(:,5); % Transmissivity of lower aquifer (m^2/year)
Hl = X(:,6); % Potentiometric head of lower aquifer (m)
L  = X(:,7); % Length of borehole (m)
Kw = X(:,8); % Hydraulic conductivity of borehole (m/year)

%% Evaluate the function
%
Logrrw = log(r./rw);

Numerator = 2*pi*Tu.*(Hu - Hl);
Denominator = Logrrw.*(1 + (2*L.*Tu)./(Logrrw.*rw.^2.*Kw) + Tu./Tl);

Y = Numerator./Denominator;

end