function y = controller_attacker(x)
% y = 0;
constants
N = 4;
R_TA = x(1);
theta_TA = x(2);
alpha_T = x(3);
alpha_A = x(4);

theta_TA_dot = 1/R_TA*(vA*sin(alpha_A - theta_TA) - vT*sin(alpha_T - theta_TA));
uA = N*theta_TA_dot*vA/aA;

if uA > 0
    y = min(uA,1);
else
    y = max(uA,-1);
end
