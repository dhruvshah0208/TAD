%% This script will calculate all the derivatives required
%Old h function
% Lf_2_h = ((vA*cos(alpha_A - theta_TA) - vT*cos(alpha_T - theta_TA))*((abs(R1)*a^2*ALPHA^2*BETA)/((abs(R1)^2*a^2*ALPHA^2 + abs(R2)^2*b^2*BETA^2)^(1/2)*(abs(R1)*ALPHA + abs(R2)*BETA)^2) - (2*ALPHA*BETA*(abs(R1)^2*a^2*ALPHA^2 + abs(R2)^2*b^2*BETA^2)^(1/2))/(abs(R1)*ALPHA + abs(R2)*BETA)^3 + (abs(R2)*ALPHA*b^2*BETA^2)/((abs(R1)^2*a^2*ALPHA^2 + abs(R2)^2*b^2*BETA^2)^(1/2)*(abs(R1)*ALPHA + abs(R2)*BETA)^2) + (abs(R1)*abs(R2)*a^2*ALPHA^2*b^2*BETA^2)/((abs(R1)^2*a^2*ALPHA^2 + abs(R2)^2*b^2*BETA^2)^(3/2)*(abs(R1)*ALPHA + abs(R2)*BETA))) + (vA*cos(alpha_A - theta_AD) - vD*cos(alpha_D - theta_AD))*((2*ALPHA^2*(abs(R1)^2*a^2*ALPHA^2 + abs(R2)^2*b^2*BETA^2)^(1/2))/(abs(R1)*ALPHA + abs(R2)*BETA)^3 + (a^2*ALPHA^2)/((abs(R1)^2*a^2*ALPHA^2 + abs(R2)^2*b^2*BETA^2)^(1/2)*(abs(R1)*ALPHA + abs(R2)*BETA)) - (abs(R1)^2*a^4*ALPHA^4)/((abs(R1)^2*a^2*ALPHA^2 + abs(R2)^2*b^2*BETA^2)^(3/2)*(abs(R1)*ALPHA + abs(R2)*BETA)) - (2*abs(R1)*a^2*ALPHA^3)/((abs(R1)^2*a^2*ALPHA^2 + abs(R2)^2*b^2*BETA^2)^(1/2)*(abs(R1)*ALPHA + abs(R2)*BETA)^2)))*(vA*cos(alpha_A - theta_AD) - vD*cos(alpha_D - theta_AD)) + ((vA*cos(alpha_A - theta_AD) - vD*cos(alpha_D - theta_AD))*((abs(R1)*a^2*ALPHA^2*BETA)/((abs(R1)^2*a^2*ALPHA^2 + abs(R2)^2*b^2*BETA^2)^(1/2)*(abs(R1)*ALPHA + abs(R2)*BETA)^2) - (2*ALPHA*BETA*(abs(R1)^2*a^2*ALPHA^2 + abs(R2)^2*b^2*BETA^2)^(1/2))/(abs(R1)*ALPHA + abs(R2)*BETA)^3 + (abs(R2)*ALPHA*b^2*BETA^2)/((abs(R1)^2*a^2*ALPHA^2 + abs(R2)^2*b^2*BETA^2)^(1/2)*(abs(R1)*ALPHA + abs(R2)*BETA)^2) + (abs(R1)*abs(R2)*a^2*ALPHA^2*b^2*BETA^2)/((abs(R1)^2*a^2*ALPHA^2 + abs(R2)^2*b^2*BETA^2)^(3/2)*(abs(R1)*ALPHA + abs(R2)*BETA))) + (vA*cos(alpha_A - theta_TA) - vT*cos(alpha_T - theta_TA))*((2*BETA^2*(abs(R1)^2*a^2*ALPHA^2 + abs(R2)^2*b^2*BETA^2)^(1/2))/(abs(R1)*ALPHA + abs(R2)*BETA)^3 + (b^2*BETA^2)/((abs(R1)^2*a^2*ALPHA^2 + abs(R2)^2*b^2*BETA^2)^(1/2)*(abs(R1)*ALPHA + abs(R2)*BETA)) - (abs(R2)^2*b^4*BETA^4)/((abs(R1)^2*a^2*ALPHA^2 + abs(R2)^2*b^2*BETA^2)^(3/2)*(abs(R1)*ALPHA + abs(R2)*BETA)) - (2*abs(R2)*b^2*BETA^3)/((abs(R1)^2*a^2*ALPHA^2 + abs(R2)^2*b^2*BETA^2)^(1/2)*(abs(R1)*ALPHA + abs(R2)*BETA)^2)))*(vA*cos(alpha_A - theta_TA) - vT*cos(alpha_T - theta_TA)) - ((vA*sin(alpha_A - theta_AD) - vD*sin(alpha_D - theta_AD))^2*((ALPHA*(abs(R1)^2*a^2*ALPHA^2 + abs(R2)^2*b^2*BETA^2)^(1/2))/(abs(R1)*ALPHA + abs(R2)*BETA)^2 - (abs(R1)*a^2*ALPHA^2)/((abs(R1)^2*a^2*ALPHA^2 + abs(R2)^2*b^2*BETA^2)^(1/2)*(abs(R1)*ALPHA + abs(R2)*BETA))))/abs(R1) - ((vA*sin(alpha_A - theta_TA) - vT*sin(alpha_T - theta_TA))^2*((BETA*(abs(R1)^2*a^2*ALPHA^2 + abs(R2)^2*b^2*BETA^2)^(1/2))/(abs(R1)*ALPHA + abs(R2)*BETA)^2 - (abs(R2)*b^2*BETA^2)/((abs(R1)^2*a^2*ALPHA^2 + abs(R2)^2*b^2*BETA^2)^(1/2)*(abs(R1)*ALPHA + abs(R2)*BETA))))/abs(R2);
% psi_A = vA*sin(alpha_A - theta_AD)*((ALPHA*(abs(R1)^2*a^2*ALPHA^2 + abs(R2)^2*b^2*BETA^2)^(1/2))/(abs(R1)*ALPHA + abs(R2)*BETA)^2 - (abs(R1)*a^2*ALPHA^2)/((abs(R1)^2*a^2*ALPHA^2 + abs(R2)^2*b^2*BETA^2)^(1/2)*(abs(R1)*ALPHA + abs(R2)*BETA))) - vA*sin(alpha_A - theta_TA)*((BETA*(abs(R1)^2*a^2*ALPHA^2 + abs(R2)^2*b^2*BETA^2)^(1/2))/(abs(R1)*ALPHA + abs(R2)*BETA)^2 - (abs(R2)*b^2*BETA^2)/((abs(R1)^2*a^2*ALPHA^2 + abs(R2)^2*b^2*BETA^2)^(1/2)*(abs(R1)*ALPHA + abs(R2)*BETA))); 
% psi_D = -vD*sin(alpha_D - theta_AD)*((ALPHA*(abs(R1)^2*a^2*ALPHA^2 + abs(R2)^2*b^2*BETA^2)^(1/2))/(abs(R1)*ALPHA + abs(R2)*BETA)^2 - (abs(R1)*a^2*ALPHA^2)/((abs(R1)^2*a^2*ALPHA^2 + abs(R2)^2*b^2*BETA^2)^(1/2)*(abs(R1)*ALPHA + abs(R2)*BETA))); 
% psi_T = vT*sin(alpha_T - theta_TA)*((BETA*(abs(R1)^2*a^2*ALPHA^2 + abs(R2)^2*b^2*BETA^2)^(1/2))/(abs(R1)*ALPHA + abs(R2)*BETA)^2 - (abs(R2)*b^2*BETA^2)/((abs(R1)^2*a^2*ALPHA^2 + abs(R2)^2*b^2*BETA^2)^(1/2)*(abs(R1)*ALPHA + abs(R2)*BETA)));  

% New h function
Lf_2_h = ((vA*cos(alpha_A - theta_AD) - vD*cos(alpha_D - theta_AD))*((3*abs(R1)^2*b*k2*exp(k2/(abs(R1)^2 + abs(R2)^2)^(1/2)))/(abs(R1)^2 + abs(R2)^2)^(5/2) - (b*k2*exp(k2/(abs(R1)^2 + abs(R2)^2)^(1/2)))/(abs(R1)^2 + abs(R2)^2)^(3/2) + (abs(R1)^2*b*k2^2*exp(k2/(abs(R1)^2 + abs(R2)^2)^(1/2)))/(abs(R1)^2 + abs(R2)^2)^3 - (2*abs(R2)^3*a*k1*exp(k1*atan(abs(R2)/abs(R1))))/(abs(R1)^5*(abs(R2)^2/abs(R1)^2 + 1)^2) + (abs(R2)^2*a*k1^2*exp(k1*atan(abs(R2)/abs(R1))))/(abs(R1)^4*(abs(R2)^2/abs(R1)^2 + 1)^2) + (2*abs(R2)*a*k1*exp(k1*atan(abs(R2)/abs(R1))))/(abs(R1)^3*(abs(R2)^2/abs(R1)^2 + 1))) - (vA*cos(alpha_A - theta_TA) - vT*cos(alpha_T - theta_TA))*((2*abs(R2)^2*a*k1*exp(k1*atan(abs(R2)/abs(R1))))/(abs(R1)^4*(abs(R2)^2/abs(R1)^2 + 1)^2) - (abs(R2)*a*k1^2*exp(k1*atan(abs(R2)/abs(R1))))/(abs(R1)^3*(abs(R2)^2/abs(R1)^2 + 1)^2) - (a*k1*exp(k1*atan(abs(R2)/abs(R1))))/(abs(R1)^2*(abs(R2)^2/abs(R1)^2 + 1)) + (3*abs(R1)*abs(R2)*b*k2*exp(k2/(abs(R1)^2 + abs(R2)^2)^(1/2)))/(abs(R1)^2 + abs(R2)^2)^(5/2) + (abs(R1)*abs(R2)*b*k2^2*exp(k2/(abs(R1)^2 + abs(R2)^2)^(1/2)))/(abs(R1)^2 + abs(R2)^2)^3))*(vA*cos(alpha_A - theta_AD) - vD*cos(alpha_D - theta_AD)) + ((vA*cos(alpha_A - theta_TA) - vT*cos(alpha_T - theta_TA))*((3*abs(R2)^2*b*k2*exp(k2/(abs(R1)^2 + abs(R2)^2)^(1/2)))/(abs(R1)^2 + abs(R2)^2)^(5/2) - (b*k2*exp(k2/(abs(R1)^2 + abs(R2)^2)^(1/2)))/(abs(R1)^2 + abs(R2)^2)^(3/2) + (abs(R2)^2*b*k2^2*exp(k2/(abs(R1)^2 + abs(R2)^2)^(1/2)))/(abs(R1)^2 + abs(R2)^2)^3 + (a*k1^2*exp(k1*atan(abs(R2)/abs(R1))))/(abs(R1)^2*(abs(R2)^2/abs(R1)^2 + 1)^2) - (2*abs(R2)*a*k1*exp(k1*atan(abs(R2)/abs(R1))))/(abs(R1)^3*(abs(R2)^2/abs(R1)^2 + 1)^2)) - (vA*cos(alpha_A - theta_AD) - vD*cos(alpha_D - theta_AD))*((2*abs(R2)^2*a*k1*exp(k1*atan(abs(R2)/abs(R1))))/(abs(R1)^4*(abs(R2)^2/abs(R1)^2 + 1)^2) - (abs(R2)*a*k1^2*exp(k1*atan(abs(R2)/abs(R1))))/(abs(R1)^3*(abs(R2)^2/abs(R1)^2 + 1)^2) - (a*k1*exp(k1*atan(abs(R2)/abs(R1))))/(abs(R1)^2*(abs(R2)^2/abs(R1)^2 + 1)) + (3*abs(R1)*abs(R2)*b*k2*exp(k2/(abs(R1)^2 + abs(R2)^2)^(1/2)))/(abs(R1)^2 + abs(R2)^2)^(5/2) + (abs(R1)*abs(R2)*b*k2^2*exp(k2/(abs(R1)^2 + abs(R2)^2)^(1/2)))/(abs(R1)^2 + abs(R2)^2)^3))*(vA*cos(alpha_A - theta_TA) - vT*cos(alpha_T - theta_TA)) + ((vA*sin(alpha_A - theta_TA) - vT*sin(alpha_T - theta_TA))^2*((a*k1*exp(k1*atan(abs(R2)/abs(R1))))/(abs(R1)*(abs(R2)^2/abs(R1)^2 + 1)) - (abs(R2)*b*k2*exp(k2/(abs(R1)^2 + abs(R2)^2)^(1/2)))/(abs(R1)^2 + abs(R2)^2)^(3/2)))/abs(R2) - ((vA*sin(alpha_A - theta_AD) - vD*sin(alpha_D - theta_AD))^2*((abs(R1)*b*k2*exp(k2/(abs(R1)^2 + abs(R2)^2)^(1/2)))/(abs(R1)^2 + abs(R2)^2)^(3/2) + (abs(R2)*a*k1*exp(k1*atan(abs(R2)/abs(R1))))/(abs(R1)^2*(abs(R2)^2/abs(R1)^2 + 1))))/abs(R1);
psi_A = vA*sin(alpha_A - theta_TA)*((a*k1*exp(k1*atan(abs(R2)/abs(R1))))/(abs(R1)*(abs(R2)^2/abs(R1)^2 + 1)) - (abs(R2)*b*k2*exp(k2/(abs(R1)^2 + abs(R2)^2)^(1/2)))/(abs(R1)^2 + abs(R2)^2)^(3/2)) + vA*sin(alpha_A - theta_AD)*((abs(R1)*b*k2*exp(k2/(abs(R1)^2 + abs(R2)^2)^(1/2)))/(abs(R1)^2 + abs(R2)^2)^(3/2) + (abs(R2)*a*k1*exp(k1*atan(abs(R2)/abs(R1))))/(abs(R1)^2*(abs(R2)^2/abs(R1)^2 + 1)));
psi_D = -vD*sin(alpha_D - theta_AD)*((abs(R1)*b*k2*exp(k2/(abs(R1)^2 + abs(R2)^2)^(1/2)))/(abs(R1)^2 + abs(R2)^2)^(3/2) + (abs(R2)*a*k1*exp(k1*atan(abs(R2)/abs(R1))))/(abs(R1)^2*(abs(R2)^2/abs(R1)^2 + 1)));
psi_T = -vT*sin(alpha_T - theta_TA)*((a*k1*exp(k1*atan(abs(R2)/abs(R1))))/(abs(R1)*(abs(R2)^2/abs(R1)^2 + 1)) - (abs(R2)*b*k2*exp(k2/(abs(R1)^2 + abs(R2)^2)^(1/2)))/(abs(R1)^2 + abs(R2)^2)^(3/2));
Lf_h = - ((abs(R1)*b*k2*exp(k2/(abs(R1)^2 + abs(R2)^2)^(1/2)))/(abs(R1)^2 + abs(R2)^2)^(3/2) + (abs(R2)*a*k1*exp(k1*atan(abs(R2)/abs(R1))))/(abs(R1)^2*(abs(R2)^2/abs(R1)^2 + 1)))*(vA*cos(alpha_A - theta_AD) - vD*cos(alpha_D - theta_AD)) - ((a*k1*exp(k1*atan(abs(R2)/abs(R1))))/(abs(R1)*(abs(R2)^2/abs(R1)^2 + 1)) - (abs(R2)*b*k2*exp(k2/(abs(R1)^2 + abs(R2)^2)^(1/2)))/(abs(R1)^2 + abs(R2)^2)^(3/2))*(vA*cos(alpha_A - theta_TA) - vT*cos(alpha_T - theta_TA));
  

uT = 0;
N = 4;
epsilon = 3;


R1_dot = vA*cos(alpha_A - theta_AD) - vD*cos(alpha_D - theta_AD);
theta_AD_dot = 1/abs(R1)*(vA*sin(alpha_A - theta_AD) - vD*sin(alpha_D - theta_AD));
theta_TA_dot = 1/abs(R2)*(vT*sin(alpha_T - theta_TA) - vA*sin(alpha_A - theta_TA));
uD = N/kD * theta_AD_dot; % PPN Guidance

% if(N*kD*theta_AD_dot <= 1 && N*kD*theta_AD_dot >= -1)
%     uD = N/kD * theta_AD_dot; % PPN Guidance
% 
% elseif(N*kD*theta_AD_dot > 1)
%     uD = 1;
%     
% elseif(N*kD*theta_AD_dot < -1)
%     uD = -1;
% end 

% uD = 0;
% uA = (-epsilon - (Lf_2_h + kD*uD*psi_D + kT*uT*psi_T)) / (kA*psi_A);
if(Lf_h <= 0)
    if(psi_A > 0)
        uA = -1;
    else
        uA = 1;
    end
else
    if(N*kA*theta_TA_dot <= 1 && N*kA*theta_TA_dot >= -1)
        uA = N*kA*theta_TA_dot; % Pure Pursuit 
    elseif(N*kA*theta_TA_dot > 1)
        uA = 1;
    elseif(N*kA*theta_TA_dot < -1)
        uA = -1;
    end 
end

alpha_D_dot = uD*aD/vD; 
alpha_A_dot = uA*aA/vA; 
alpha_T_dot = uT*aT/vT; 
R2_dot = vT*cos(alpha_T - theta_TA) - vA*cos(alpha_A - theta_TA);
x_D_dot = vD*cos(alpha_D);
y_D_dot = vD*sin(alpha_D);


