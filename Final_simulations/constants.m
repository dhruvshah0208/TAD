%% constants
vA = 16;
vD = 15;
vT = 5;

aA = 100;
aD = 100;
aT = 75;

rA = vA^2/aA;
rD = vD^2/aD;
rT = vT^2/aT;

%% Initial Conditions (requires user input)

xD0 = 0;
yD0 = 0;

xA0 = 10;
yA0 = 10;

xT0 = -5;
yT0 = 20;

alpha_D0 = pi/6; 
alpha_A0 = pi;
alpha_T0 = 7*pi/6;

T = 1; % Time of look ahead in barrier function computation
%% Initial Conditions (Do not change)

R_TA0 = sqrt((xA0 - xT0)^2 + (yA0 - yT0)^2);
R_DT0 = sqrt((xD0 - xT0)^2 + (yD0 - yT0)^2);
theta_DT0 = atan2(yD0 - yT0,xD0 - xT0);
theta_TA0 = atan2(yA0 - yT0,xA0 - xT0);

initial_states = [R_TA0; theta_TA0; alpha_T0; alpha_A0; alpha_D0; R_DT0; theta_DT0; xT0; yT0];