function y = compute_barrier1(x)
constants %Load constants

[tv,y] = ode45('system_dynamics',[0 T/10],x);

R_TA = y(:,1);
theta_TA = y(:,2);

R_DT = y(:,6);
theta_DT = y(:,7);
xT = y(:,8);
yT = y(:,9);

xA = xT + R_TA.*cos(theta_TA);
yA = yT + R_TA.*sin(theta_TA);

xD = xT + R_DT.*cos(theta_DT);
yD = yT + R_DT.*sin(theta_DT);

safety1 = ((xA - xD).^2 + (yA - yD).^2).^(0.5);
h1 = min(safety1);

y = h1;