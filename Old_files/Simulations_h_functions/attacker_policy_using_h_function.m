%% Function Definition for using in ODE45
function dx = attacker_policy_using_h_function(t,x)
% This function contains the state space formulation for the three body
% system. x is a 9 dimensional variable
constants % This initializes the values of the constants

R1 = x(1);
theta_AD = x(2);
alpha_D = x(3);
alpha_A = x(4);
alpha_T = x(5);
R2 = x(6);
theta_TA = x(7);

% Careful here : Change h whenever using new h-function here
theta = atan(R2/R1);
r = (R1^2 + R2^2)^0.5;
h = a*exp(k1*theta) + b*exp(k2/r);

controller_calculations;
%% Output Assignment
dx(1,1) = R1_dot;
dx(2,1) = theta_AD_dot;
dx(3,1) = alpha_D_dot;
dx(4,1) = alpha_A_dot;
dx(5,1) = alpha_T_dot;
dx(6,1) = R2_dot;
dx(7,1) = theta_TA_dot;
dx(8,1) = x_D_dot;
dx(9,1) = y_D_dot;
