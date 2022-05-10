%% Sim 1
% This sim is basically a test run for the framework. All TAD will be
% moving in circles

constants %Load constants

[tv,y] = ode45('system_dynamics',[0 T],initial_states);


R_TA = y(:,1);
theta_TA = y(:,2);
alpha_T = y(:,3);
alpha_A = y(:,4);
alpha_D = y(:,5);
R_DT = y(:,6);
theta_DT = y(:,7);
xT = y(:,8);
yT = y(:,9);

xA = xT + R_TA.*cos(theta_TA);
yA = yT + R_TA.*sin(theta_TA);

xD = xT + R_DT.*cos(theta_DT);
yD = yT + R_DT.*sin(theta_DT);

safety1 = ((xA - xD).^2 + (yA - yD).^2).^(0.5);
safety2 = theta_TA - theta_DT;
h1 = min(safety1);
h2 = min(safety2);


%% Plotting and Animating
% a1 = animatedline('Color','g');% D
% a2 = animatedline('Color','r');% A
% a3 = animatedline('Color','b');% T
% grid on
% hold on
% axis equal
% for k = 1:length(xD)
%     addpoints(a1,xD(k),yD(k));
%     addpoints(a2,xA(k),yA(k));
%     addpoints(a3,xT(k),yT(k));
% 
% %     drawnow 
% end
figure
plot(safety2);

figure
plot(safety1);
