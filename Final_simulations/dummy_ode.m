function f = dummy_ode(t,x)

x1 = x(1);
x2 = x(2);
%% Constants / Computations

%% State Space Representations

x1_dot = sin(x1) + sin(x2) + min(y(:,1));
x2_dot = sin(x1) - sin(x2);

%% Output Assignment
f(1,1) = x1_dot;
f(2,1) = x2_dot;
