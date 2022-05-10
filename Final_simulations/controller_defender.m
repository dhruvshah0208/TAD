function y = controller_defender(x)
% The defender is implementing PN guidance
constants
R_TA = x(1);
theta_TA = x(2);
alpha_A = x(4);
alpha_D = x(5);
R_DT = x(6);
theta_DT = x(7);
xT = x(8);
yT = x(9);

xA = xT + R_TA.*cos(theta_TA);
yA = yT + R_TA.*sin(theta_TA);

xD = xT + R_DT.*cos(theta_DT);
yD = yT + R_DT.*sin(theta_DT);

theta_AD = atan2(yA - yD,xA - xD);
R_AD = sqrt((xA - xD)^2 + (yA - yD)^2);
theta_AD_dot = 1/R_AD*(vA*sin(alpha_A - theta_AD) - vD*sin(alpha_D - theta_AD));
N = 4;
uD = N*theta_AD_dot*vD/aD;

if uD > 0
    y = min(uD,1);
else
    y = max(uD,-1);
end