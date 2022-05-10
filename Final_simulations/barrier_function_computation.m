function y = barrier_function_computation(input)
constants
x = input(1:9);
u_D = input(10);
u_T = input(11);
R_TA = x(1);
theta_TA = x(2);
alpha_T = x(3);
alpha_A = x(4);
alpha_D = x(5);
R_DT = x(6);
theta_DT = x(7);

% Output h and lie_h in directions of f and g. Note: dim = 7
epsilon = 1e-3;

R_TA_dot = vA*cos(alpha_A - theta_TA) - vT*cos(alpha_T - theta_TA);
theta_TA_dot = 1/R_TA*(vA*sin(alpha_A - theta_TA) - vT*sin(alpha_T - theta_TA));
alpha_D_dot = u_D*aD/vD; 

alpha_T_dot = u_T*aT/vT; 
R_DT_dot = vD*cos(alpha_D - theta_DT) - vT*cos(alpha_T - theta_DT);
theta_DT_dot = 1/R_DT*(vD*sin(alpha_D - theta_DT) - vT*sin(alpha_T - theta_DT));
x_T_dot = vT*cos(alpha_T);
y_T_dot = vT*sin(alpha_T);

f(1) = R_TA_dot;
f(2) = theta_TA_dot;
f(3) = alpha_T_dot;
f(4) = 0;
f(5) = alpha_D_dot;
f(6) = R_DT_dot;
f(7) = theta_DT_dot;
f(8) = x_T_dot;
f(9) = y_T_dot;

g = [0 0 0 1 0 0 0 0 0];

h  = compute_barrier1(x);

lie_f_h = 1/epsilon * (compute_barrier1(x + epsilon*f') - h);
lie_g_h = 1/epsilon * (compute_barrier1(x + epsilon*g') - h);

% h  = compute_barrier2(x);
% 
% lie_f_h = 1/epsilon * (compute_barrier2(x + epsilon*f') - h);
% lie_g_h = 1/epsilon * (compute_barrier2(x + epsilon*g') - h);

y(1) = h; y(2) = lie_f_h; y(3) = lie_g_h;
