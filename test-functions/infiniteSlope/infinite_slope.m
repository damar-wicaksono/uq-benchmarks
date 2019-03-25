function Y = infinite_slope(X)
%%  Performance function for benchmark case 1 (Infinite Slope)
% This performance function describes the occurence of instability for 
% an infinite slope due to rising groundwater table. The model contains 6 
% (independent) random variables
% z = {H,U,phi,theta,Gs,e}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%!!%                                                                      %
% THIS IS A MODIFIED FILE WHICH ALLOWS FOR VECTORIZED INPUT and UQLAB     %
%!!%                                                                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Constants
k = 0.2;            % Degree of saturation of moist soil
gamma_w = 9.81;     % unit weight of water [kN/m3]

%% Transformation of random variables into real space

% Soil depth over bedrock [m]
H = X(:,1);

% Water table height [m]
h = H.*X(:,2);

% Effective stress friction angle
phi = X(:,3);

% Infinite slope angle
theta = X(:,4);

% Moist unit weight of soil [kN/m3]
gamma = gamma_w * (X(:,5) + k*X(:,6))./(1 + X(:,6));

% Saturated unit weight of soil [kN/m3]
gamma_sat = gamma_w * (X(:,5) + X(:,6))./(1 + X(:,6));

%% Evaluation of the performance function

T = (gamma.*(H-h) + h.*(gamma_sat - gamma_w)).*cos(theta).*tan(phi);
R = (gamma.*(H-h) + h.*gamma_sat).*sin(theta);
Y = T./R -1;
end