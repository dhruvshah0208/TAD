function y = safety_function(x)
constants % This initializes the values of the constants

R_TA = x(1);
theta_TA = x(2);
R_DT = x(6);
theta_DT = x(7);
xT = x(8);
yT = x(9);

xA = xT + R_TA*cos(theta_TA);
yA = yT + R_TA*sin(theta_TA);

xD = xT + R_DT*cos(theta_DT);
yD = yT + R_DT*sin(theta_DT);

y(1) = ((xA - xD)^2 + (yA - yD)^2)^(0.5);

y(2) = ((xA - xT)^2 + (yA - yT)^2)^(0.5);
