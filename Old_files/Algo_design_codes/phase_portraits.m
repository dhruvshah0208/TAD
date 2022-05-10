function phase_portraits()
close all
clc

tspan = [0 10]; % Time span
figure()
hold on
% for x10 = (-2*pi):0.5:2*pi            % Domain of the system
%     for x20 = -3:0.2:3                  % Domain of the system
%         xinitial = [x10;x20];           % Initial Conditions
%         [tout,stateout] = ode45(@system,tspan,xinitial);
%         %%%Phase Plane
%         x1 = stateout(:,1);
%         x2 = stateout(:,2);
%         plot(x1,x2)
%         drawnow
%         axis([-10 10 -10 10])
%     end
% end
x_initial = [5;-2];           % Initial Conditions
[tout,stateout] = ode45(@system,tspan,x_initial);
%%%Phase Plane
x1 = stateout(:,1);
x2 = stateout(:,2);
plot(x1,x2)
drawnow

function dstate_dt = system(t,state)

x1 = state(1);
x2 = state(2);
x1_dot = 2*x2*sin(x1);
x2_dot = x1;

dstate_dt = [x1_dot;x2_dot];

