%% Analysis of h
% This file will be used for analyzing the behaviour of various output functions
a = 1;
b = 1;
k1 = 1;
k2 = 1;

syms R1 R2
theta = atan(R2/R1);
r = (R1^2 + R2^2)^0.5;
% h = ((a*alpha*R1)^2 + (b*beta*R2)^2)^0.5 / (alpha*R1 + beta*R2);
h = a*exp(k1*theta) + b*exp(k2/r);
fsurf(h,[0 50 0 50]) % Remember this command for plotting 3d plots of symbolic functions


%% Partials of h
% syms a b k1 k2
% 
% syms R1 R2
% theta = atan(R2/R1);
% r = (R1^2 + R2^2)^0.5;
% h = a*exp(k1*theta) + b*exp(k2/r);
% 
% %System Dynamics
% syms vA vD vT alpha_A alpha_D alpha_T uA uD uT theta_TA theta_AD aA aD aT
% R1_dot = vA*cos(alpha_A - theta_AD) - vD*cos(alpha_D - theta_AD);
% theta_AD_dot = 1/R1*(vA*sin(alpha_A - theta_AD) - vD*sin(alpha_D - theta_AD));
% alpha_D_dot = uD*aD/vD; 
% alpha_A_dot = uA*aA/vA; 
% alpha_T_dot = uT*aT/vT; 
% R2_dot = vT*cos(alpha_T - theta_TA) - vA*cos(alpha_A - theta_TA);
% theta_TA_dot = 1/R2*(vT*sin(alpha_T - theta_TA) - vA*sin(alpha_A - theta_TA));
% 
% %Calculate all partials of h
% dh_dR1 = diff(h,R1,1);
% dh_dR2 = diff(h,R2,1);
% d2h_dR12 = diff(h,R1,2);
% d2h_dR22 = diff(h,R2,2);
% d2h_dR1R2 = diff(dh_dR1,R2,1);
% 
% Lf_h = dh_dR1*R1_dot + dh_dR2*R2_dot;
% 
% psi_A = diff(Lf_h,alpha_A,1); % Ignore the constant here for now
% psi_D = diff(Lf_h,alpha_D,1); % Ignore the constant here for now
% psi_T = diff(Lf_h,alpha_T,1); % Ignore the constant here for now
% 
% Lf2_h = diff(Lf_h,R1,1)*R1_dot + diff(Lf_h,R2,1)*R2_dot + diff(Lf_h,theta_AD,1)*theta_AD_dot + diff(Lf_h,theta_TA,1)*theta_TA_dot;
% 

