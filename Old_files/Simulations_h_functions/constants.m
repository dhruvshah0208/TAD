%% constants

vA = 17;
vD = 15;
vT = 5;

aA = 100;
aD = 100;
aT = 75;

kA = aA/vA;
kD = aD/vD;
kT = aT/vT;


% a = 1;
% b = 10;
% BETA = 1;
% ALPHA = 10;

a = 1;
b = 1;
k1 = 1;
k2 = 1;

miss_distance = 0.1;
%% Initial Conditions (requires user input)

xD0= 0;
yD0 = 0;

xA0 = 10;
yA0 = 10;

xT0 = -15;
yT0 = 20;

alpha_D0 = pi/2; 
alpha_A0 = pi;
alpha_T0 = pi/6;

%% Initial Conditions (Do not change)

R10 = sqrt((xA0 - xD0)^2 + (yA0 - yD0)^2);
R20 = sqrt((xT0 - xA0)^2 + (yA0 - yT0)^2);
theta_AD0 = atan2(yA0 - yD0,xA0 - xD0);
theta_TA0 = atan2(yT0 - yA0,xT0 - xA0);

initial_states = [R10; theta_AD0; alpha_D0; alpha_A0; alpha_T0; R20; theta_TA0; xD0; yD0];