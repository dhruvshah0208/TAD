function y = TOC(R,theta,alpha_1,alpha_2,v1,v2,r1,r2)
%% Defining the centre cordinates of all 4 circles
x_ac1 = r1*cos(pi/2+alpha_1);
y_ac1 = r1*sin(pi/2+alpha_1);
x_c1  = r1*cos(alpha_1 - pi/2);
y_c1  = r1*sin(alpha_1 - pi/2);
x_ac2 = R*cos(theta) + r2*cos(pi/2+alpha_2);
y_ac2 = R*sin(theta) + r2*sin(pi/2+alpha_2);
x_c2  = R*cos(theta) + r2*cos(alpha_2 - pi/2);
y_c2  = R*sin(theta) + r2*sin(alpha_2 - pi/2);

%% T_cc case 
z1 = complex(x_c1,y_c1);
z2 = complex(x_c2,y_c2);
d = abs(z1 - z2);
l_DCT = (d^2 - (r1-r2)^2)^0.5;
theta_D = atan(l_DCT / abs(r1-r2));
if (r1 > r2)
    theta_D1 = theta_D;
    theta_D2 = pi - theta_D;
else
    theta_D1 = pi - theta_D;
    theta_D2 = theta_D;
end

delta_theta1 = angle(-z1) - angle(z2 - z1) - theta_D1;
if delta_theta1 < 0
    delta_theta1 = 2*pi + delta_theta1;
end
delta_theta2 = theta_D2 - (angle(z1 - z2) - angle(complex(R*cos(theta),R*sin(theta)) - z2)); 
if delta_theta2 < 0
    delta_theta2 = 2*pi + delta_theta2;
end

t1_cc = r1*delta_theta1 / v1;
t2_cc = r2*delta_theta2 / v2;

if t1_cc <= t2_cc
    T_cc = t2_cc + (l_DCT - t1_cc*v1) / (v2 - v1);
else
    T_cc = t1_cc + (l_DCT + t2_cc*v2) / (v2 - v1);
end

%% T_ac case Evader = A , Pursuer = C
z1 = complex(x_c1,y_c1);
z2 = complex(x_ac2,y_ac2);

d = abs(z1 - z2);
l_DCT = (d^2 - (r1-r2)^2)^0.5;
l_TCT = (d^2 - (r1+r2)^2)^0.5;

theta_T = atan(l_TCT / (r1+r2));

delta_theta1 = angle(-z1) - angle(z2 - z1) - theta_T;
if delta_theta1 < 0
    delta_theta1 = 2*pi + delta_theta1;
end
delta_theta2 = theta_T - (angle(complex(R*cos(theta),R*sin(theta)) - z2) - angle(z1 - z2)); 
if delta_theta2 < 0
    delta_theta2 = 2*pi + delta_theta2;
end

t1_ac = r1*delta_theta1 / v1;
t2_ac = r2*delta_theta2 / v2;

if t1_ac <= t2_ac
    T_ac = t2_ac + (l_DCT - t1_ac*v1) / (v2 - v1);
else
    T_ac = t1_ac + (l_DCT + t2_ac*v2) / (v2 - v1);
end

%% T_ca case : Evader = C , Pursuer = A
z1 = complex(x_ac1,y_ac1);
z2 = complex(x_c2,y_c2);

d = abs(z1 - z2);
l_TCT = (d^2 - (r1+r2)^2)^0.5;

theta_T = atan(l_TCT / (r1+r2));

delta_theta1 = angle(z2 - z1) - angle(-z1) - theta_T;
if delta_theta1 < 0
    delta_theta1 = 2*pi + delta_theta1;
end
delta_theta2 = theta_T - (angle(complex(R*cos(theta),R*sin(theta)) - z2) - angle(z1 - z2)); 
if delta_theta2 < 0
    delta_theta2 = 2*pi + delta_theta2;
end

t1_ca = r1*delta_theta1 / v1;
t2_ca = r2*delta_theta2 / v2;

if t1_ca <= t2_ca
    T_ca = t2_ca + (l_TCT - t1_ca*v1) / (v2 - v1);
else
    T_ca = t1_ca + (l_TCT + t2_ca*v2) / (v2 - v1);
end

%% T_aa case 
z1 = complex(x_ac1,y_ac1);
z2 = complex(x_ac2,y_ac2);
d = abs(z1 - z2);
l_DCT = (d^2 - (r1-r2)^2)^0.5;
theta_D = atan(l_DCT / abs(r1-r2));
if (r1 > r2)
    theta_D1 = theta_D;
    theta_D2 = pi - theta_D;
else
    theta_D1 = pi - theta_D;
    theta_D2 = theta_D;
end

delta_theta1 = angle(z2 - z1) - angle(-z1)  - theta_D1;
if delta_theta1 < 0
    delta_theta1 = 2*pi + delta_theta1;
end
delta_theta2 = theta_D2 - (angle(complex(R*cos(theta),R*sin(theta)) - z2) - angle(z1 - z2)); 
if delta_theta2 < 0
    delta_theta2 = 2*pi + delta_theta2;
end

t1_aa = r1*delta_theta1 / v1;
t2_aa = r2*delta_theta2 / v2;

if t1_aa <= t2_aa
    T_aa = t2_aa + (l_DCT - t1_aa*v1) / (v2 - v1);
else
    T_aa = t1_aa + (l_DCT + t2_aa*v2) / (v2 - v1);
end

%% Final Choice:

% Min Max solution i.e
T_min_max = min(max(T_cc,T_ac),max(T_ca,T_aa));
T_max_min = max(min(T_cc,T_ca),min(T_ac,T_aa));

if (T_max_min == T_cc)
    t_e = t2_cc;
    evader_command = 1; % 1 for clockwise
elseif (T_max_min == T_ac)
    t_e = t2_ac;        
    evader_command = 1; % 1 for clockwise
elseif (T_max_min == T_ca)
    t_e = t2_ca;
    evader_command = -1; % 1 for clockwise
elseif (T_max_min == T_aa)
    t_e = t2_aa;        
    evader_command = -1; % 1 for clockwise
end

if (T_min_max == T_cc)
    t_p = t1_cc;
    pursuer_command = 1; % 1 for clockwise
elseif (T_min_max == T_ac)
    t_p = t1_ac;        
    pursuer_command = -1; % -1 for anti clockwise
elseif (T_min_max == T_ca)
    t_p = t1_ca;
    pursuer_command = 1; % 1 for clockwise
elseif (T_min_max == T_aa)
    t_p = t1_aa;        
    pursuer_command = -1; % -1 for anti clockwise
end

if(evader_command == 1 && pursuer_command == 1)
    T = T_cc;
elseif(evader_command == -1 && pursuer_command == 1)
    T = T_ac;
elseif(evader_command == 1 && pursuer_command == -1)
    T = T_ca;
elseif(evader_command == -1 && pursuer_command == -1)
    T = T_aa;
end

y = [T , t_p , t_e , evader_command , pursuer_command];

