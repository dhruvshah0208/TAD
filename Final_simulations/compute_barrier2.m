function y = compute_barrier2(x)
constants %Load constants

[tv,y] = ode45('system_dynamics',[0 T/10],x);

theta_TA = y(:,2);
theta_DT = y(:,7);


safety2 = theta_TA - theta_DT;
h2 = min(safety2);

y = h2;