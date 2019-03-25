function Y = uq_LiquidHydrogenTank(X)


%%  Performance function presented as Example 5.2 in: 
% This performance function is used in the paper: 
% Bichon, B.J., McFarland, J.M., Mahadevan, S. (2011). Efficient surrogate 
% models for system reliability analysis of systems with multiple failure 
% modes. Reliability Engineering and System Safety, 96, 1386-1395. 
% 
% and contains 5 independent random variables. 
% X = {t_plate,t_h,N_x,N_y,N_xy}

%% Transformation of random variables into real space

% Thickness of plate [-]
t_plate = X(:,1);

% Thickness of honeycomb [-]
t_h = X(:,2);

% Load on tank (x-component) [-]
N_x = X(:,3); 

% Load on tank (y-component) [-]
N_y = X(:,4);

% Load on tank (xy-component) [-]
N_xy = X(:,5); 


%% Intermediate computations
x_1 = 4*(t_plate - 0.075); 
x_2 = 20*(t_h - 0.1); 
x_3 = -6000*(1./N_xy + 0.003); 


%% Compute the three different performance functions
% Von Mises stress failure
P_vm = 84000*t_plate./sqrt(N_x.^2 + N_y.^2 - N_x.*N_y + 3*N_xy.^2) - 1; 

% Isotropic strength failure
P_is = 84000*t_plate./abs(N_y) - 1; 

% Honeycomb buckling failure
P_hb = 0.847 + 0.96*x_1 + 0.986*x_2 - 0.216*x_3 + 0.077*x_1.^2 +...
       0.11*x_2.^2 + 0.007*x_3.^2 + 0.378*x_1.*x_2 - 0.106*x_1.*x_3 +...
       0.11*x_2.*x_3; 

%% Evaluation of the performance function
Y = min([P_vm,P_is,P_hb],[],2);  
        
