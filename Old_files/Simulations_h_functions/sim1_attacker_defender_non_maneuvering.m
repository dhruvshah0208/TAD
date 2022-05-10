%% Sim1 - Both attacker and Defender are non maneuvering

constants %Load constants

[tv,y] = ode45('attacker_policy_using_h_function',[0 7],initial_states); 

R1_output = y(:,1);
theta_AD_output = y(:,2);
alpha_D_output = y(:,3);
alpha_A_output = y(:,4);
alpha_T_output = y(:,5);
R2_output = y(:,6);
theta_TA_output = y(:,7);
xD = y(:,8);
yD = y(:,9);

xA = xD + R1_output.*cos(theta_AD_output);
yA = yD + R1_output.*sin(theta_AD_output);

xT = xA + R2_output.*cos(theta_TA_output);
yT = yA + R2_output.*sin(theta_TA_output);
% h = ((a*ALPHA*R1_output).^2 + (b*BETA*R2_output).^2).^0.5 ./ (ALPHA*R1_output + BETA*R2_output); % h tends to a as R1 tends to zero

%% h and uA
% Keep in mind to update this whenever the dynamics are changed
for i = 1:length(alpha_A_output)
    R1 = R1_output(i);
    theta_AD = theta_AD_output(i);
    alpha_D = alpha_D_output(i);
    alpha_A = alpha_A_output(i);
    alpha_T = alpha_T_output(i);
    R2 = R2_output(i);
    theta_TA = theta_TA_output(i);
    if(R2 <= miss_distance || R1 <= miss_distance)
        break;
    end

    % Careful here : Change h whenever using new h-function here
    theta = atan(R2/R1);
    r = (R1^2 + R2^2)^0.5;
    h = a*exp(k1*theta) + b*exp(k2/r);

    h_log(i) = h;
    controller_calculations; % needs all the state variables and h
    uA_log(i) = uA;
    uD_log(i) = uD;
    Lf2h_log(i) = Lf_2_h;
    psiA_log(i) = psi_A;
    psiD_log(i) = psi_D;
    psiT_log(i) = psi_T;
    h_dot(i) = Lf_h;
    h_double_dot(i) = Lf_2_h + kA*uA*psi_A + kD*uD*psi_D + kT*uT*psi_T;
    
end
%% Plotting and Animating

subplot(2,2,1)
plot(psiA_log); legend('psi_A');
subplot(2,2,2)
plot(psiD_log);legend('psi_D');
subplot(2,2,3)
plot(psiT_log);legend('psi_T');
subplot(2,2,4)
plot(Lf2h_log);legend('Lf2h');

figure
subplot(2,2,1)
plot(h_dot);legend('h_dot');
subplot(2,2,2)
plot(h_double_dot);legend('h_doubledot');
subplot(2,2,[3,4])
plot(h_log);legend('h');

figure
plot(R1_output,R2_output);legend('Trajectory');
figure
plot(uA_log);legend('u_A');


figure
a1 = animatedline('Color','r');% D
a2 = animatedline('Color','g');% A
a3 = animatedline('Color','b');% T
grid on
hold on
axis equal
for k = 1:length(xD)
    if(R2_output(k) <= miss_distance || R1_output(k) <= miss_distance)
        break;
    end
    addpoints(a1,xD(k),yD(k));
    addpoints(a2,xA(k),yA(k));
    addpoints(a3,xT(k),yT(k));
    drawnow

end

