function y = safety_loop(input)
u_nominal = input(1);
h = input(2);
Lfh = input(3);
Lgh = input(4);
K = 1; % Can try other positive values as well
alpha_h = K*h; % This is the extended class kappa function.
F = (-alpha_h - Lfh) / Lgh;
if Lgh == 0
    u = u_nominal;
elseif Lgh > 0
        if u_nominal >= F
            u = u_nominal;
        else
            u = min(1,F);
        end
elseif Lgh < 0
    if u_nominal <= F
        u = u_nominal;
    else
        u = min(1,F);
    end
end
if u > 0
    y = min(1,u);
else
    y = max(u,-1);
end
