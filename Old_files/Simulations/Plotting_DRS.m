%% Constants

%Purser Constants (Taken for a car)
vp = 25; %m/s 
ap = 10; %m/s^2
rp = vp^2/ap;
kp = vp/rp;

%Evader Constants (Taken for a car)
eta_v = 0.8;
eta_a = 0.5;
ve = eta_v*vp; %m/s 
ae = eta_a*ap; %m/s^2
re = ve^2/ae;
ke = ve/re;

% States
% R = 10;
% alpha = pi/6;
% theta = pi/6;
%% Expressions

t1_p  = (1/kp) .* linspace(0,2*pi,100);
t1_e  = (1/ke) .* linspace(0,2*pi,100);
T_e  =  2*pi* 3/ke;
T_p  =  T_e;

% Create Arrays
% Pursers DRS
x1_p = vp/kp .* sin(kp*t1_p) + vp.*cos(kp*t1_p).*(T_p - t1_p);
y1_p = vp/kp .* (1 - cos(kp*t1_p)) + vp.*sin(kp*t1_p).*(T_p - t1_p);
x2_p = x1_p;
y2_p = -1.*y1_p;

% Evaders DRS

x1_e1 = ve/ke .* sin(ke*t1_e) + ve.*cos(ke*t1_e).*(T_e - t1_e);
y1_e1 = ve/ke .* (1 - cos(ke*t1_e)) + ve.*sin(ke*t1_e).*(T_e - t1_e);
x2_e1 = x1_e1;
y2_e1 = -1.*y1_e1;

x1_e = R*cos(alpha) + x1_e1*cos(theta) - y1_e1*sin(theta);
y1_e = R*sin(alpha) + x1_e1*sin(theta) + y1_e1*cos(theta);
x2_e = R*cos(alpha) + x2_e1*cos(theta) - y2_e1*sin(theta);
y2_e = R*sin(alpha) + x2_e1*sin(theta) + y2_e1*cos(theta);

% Final Arrays
xp = [x1_p,x2_p];
yp = [y1_p,y2_p];
xe = [x1_e,x2_e];
ye = [y1_e,y2_e];


% hold on
% grid on
% plot(xp,yp)
% plot(xe,ye)
% hold off

%% Generate output matrix which is a 3D matrix
R = linspace(1,2000,100000);
theta = linspace(0,2*pi,100);
alpha = linspace(0,2*pi,100);
[~,size_R] = size(R_array);
[~,size_theta] = size(theta_array);
[~,size_alpha] = size(alpha_array);
for i = 1:size_R 
    for j = 1:size_alpha
        for k = 1:size_theta
            T(i,j,k) = expand_engulf(R(i),alpha(j),theta(k)); 
        end
    end
end


    










