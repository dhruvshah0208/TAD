function y = f(x,u)
    x1_dot = 2*x(2)*sin(x(1));
    x2_dot = x(1) + 4*u;
    y = [x1_dot ; x2_dot];
end