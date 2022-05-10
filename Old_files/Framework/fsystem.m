function f = fsystem(t,x)
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

%% State Space Representations
% A pursues T and D pursues A blindly
R1_dot = vA*cos(alpha_A - theta_AD) - vD*cos(alpha_D - theta_AD);
theta_AD_dot = 1/R1*(vA*sin(alpha_A - theta_AD) - vD*sin(alpha_D - theta_AD));
alpha_D_dot = aD/vD; % CONTROL INPUT
alpha_A_dot = aA/vA; % CONTROL INPUT
alpha_T_dot = aT/vT; % CONTROL INPUT
R2_dot = vT*cos(alpha_T - theta_TA) - vA*cos(alpha_A - theta_TA);
theta_TA_dot = 1/R2*(vT*sin(alpha_T - theta_TA) - vA*sin(alpha_A - theta_TA));
x_D_dot = vD*cos(alpha_D);
y_D_dot = vD*sin(alpha_D);

%% Output Assignment
f(1,1) = R1_dot;
f(2,1) = theta_AD_dot;
f(3,1) = alpha_D_dot;
f(4,1) = alpha_A_dot;
f(5,1) = alpha_T_dot;
f(6,1) = R2_dot;
f(7,1) = theta_TA_dot;
f(8,1) = x_D_dot;
f(9,1) = y_D_dot;