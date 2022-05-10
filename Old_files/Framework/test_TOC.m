function f = test_TOC(t,x)
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
%% Values
constants
y1 = TOC(R10,theta_AD0,alpha_D0,alpha_A0,vD,vA,rD,rA);
y2 = TOC(R20,theta_TA0,alpha_A0,alpha_T0,vA,vT,rA,rT);

t_D = y1(2);
t_A = y2(2);
t_T = y2(3);
command_D = y1(5);
command_A = y2(5);
command_T = y2(4);

%% State Space Representations
% A pursues T and D pursues A blindly
R1_dot = vA*cos(alpha_A - theta_AD) - vD*cos(alpha_D - theta_AD);
theta_AD_dot = 1/R1*(vA*sin(alpha_A - theta_AD) - vD*sin(alpha_D - theta_AD));

if t <= t_D
    alpha_D_dot = command_D*aD/vD; % CONTROL INPUT
else
    alpha_D_dot = 0; % CONTROL INPUT
end
if t <= t_A
    alpha_A_dot = command_A*aA/vA; % CONTROL INPUT
else
    alpha_A_dot = 0; % CONTROL INPUT
end
if t <= t_T
    alpha_T_dot = command_T*aT/vT; % CONTROL INPUT
else
    alpha_T_dot = 0; % CONTROL INPUT
end
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