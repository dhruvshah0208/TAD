function f = system_dynamics(t,x)
% This function contains the state space formulation for the three body
% system. x is a 9 dimensional variable

constants % This initializes the values of the constants

R_TA = x(1);
theta_TA = x(2);
alpha_T = x(3);
alpha_A = x(4);
alpha_D = x(5);
R_DT = x(6);
theta_DT = x(7);
xT = x(8);
yT = x(9);
%% Computations
% The defender is implementing PN guidance
xA = xT + R_TA.*cos(theta_TA);
yA = yT + R_TA.*sin(theta_TA);

xD = xT + R_DT.*cos(theta_DT);
yD = yT + R_DT.*sin(theta_DT);

theta_AD = atan2(yA - yD,xA - xD);
R_AD = sqrt((xA - xD)^2 + (yA - yD)^2);
theta_AD_dot = 1/R_AD*(vA*sin(alpha_A - theta_AD) - vD*sin(alpha_D - theta_AD));
N = 4;
u_D = N*theta_AD_dot*vD/aD;
u_T = 0;
u_A = bang_bang_control2(alpha_A,theta_AD); % The attacker is using a naive Bang-Bang evader.

%% State Space Representations
R_TA_dot = vA*cos(alpha_A - theta_TA) - vT*cos(alpha_T - theta_TA);
theta_TA_dot = 1/R_TA*(vA*sin(alpha_A - theta_TA) - vT*sin(alpha_T - theta_TA));
alpha_D_dot = u_D*aD/vD; 
alpha_A_dot = u_A*aA/vA; 
alpha_T_dot = u_T*aT/vT; 
R_DT_dot = vD*cos(alpha_D - theta_DT) - vT*cos(alpha_T - theta_DT);
theta_DT_dot = 1/R_DT*(vD*sin(alpha_D - theta_DT) - vT*sin(alpha_T - theta_DT));
x_T_dot = vT*cos(alpha_T);
y_T_dot = vT*sin(alpha_T);

%% Output Assignment
f(1,1) = R_TA_dot;
f(2,1) = theta_TA_dot;
f(3,1) = alpha_T_dot;
f(4,1) = alpha_A_dot;
f(5,1) = alpha_D_dot;
f(6,1) = R_DT_dot;
f(7,1) = theta_DT_dot;
f(8,1) = x_T_dot;
f(9,1) = y_T_dot;