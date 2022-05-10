%% Sim 1
% This sim is basically a test run for the framework. All TAD will be
% moving in circles

constants %Load constants

% [tv,y] = ode45('test_TOC',[0 3],initial_states);
[tv,y] = ode45('test_TOC_feedback',[0 3],initial_states);

R1 = y(:,1);
theta_AD = y(:,2);
alpha_D = y(:,3);
alpha_A = y(:,4);
alpha_T = y(:,5);
R2 = y(:,6);
theta_TA = y(:,7);
xD = y(:,8);
yD = y(:,9);

xA = xD + R1.*cos(theta_AD);
yA = yD + R1.*sin(theta_AD);

xT = xA + R2.*cos(theta_TA);
yT = yA + R2.*sin(theta_TA);

%% Plotting and Animating
a1 = animatedline('Color','r');% D
a2 = animatedline('Color','g');% A
a3 = animatedline('Color','b');% T
grid on
hold on
axis equal
for k = 1:length(xD)
    addpoints(a1,xD(k),yD(k));
    addpoints(a2,xA(k),yA(k));
    addpoints(a3,xT(k),yT(k));

    drawnow 
end
