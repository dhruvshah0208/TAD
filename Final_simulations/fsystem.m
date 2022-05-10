function f = fsystem(x)
% This function contains the state space formulation for the three body
% system. x is a 9 dimensional variable
constants % This initializes the values of the constants
R_TA = x(4);
theta_TA = x(5);
alpha_T = x(6);
alpha_A = x(7);
alpha_D = x(8);
R_DT = x(9);
theta_DT = x(10);
u_A = x(1);
u_D = x(2);
u_T = x(3);

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
f(1) = R_TA_dot;
f(2) = theta_TA_dot;
f(3) = alpha_T_dot;
f(4) = alpha_A_dot;
f(5) = alpha_D_dot;
f(6) = R_DT_dot;
f(7) = theta_DT_dot;
f(8) = x_T_dot;
f(9) = y_T_dot;