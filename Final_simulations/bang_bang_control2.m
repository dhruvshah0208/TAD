function u = bang_bang_control2(alpha_A,theta_AD)
% This function calculates the greedy control input that drives the system
% towards the direction of max ascent of LOS difference.
%% Decode inputs
constants
%% Bang - Bang Control

x = alpha_A - theta_AD;

if x > 0
    u = -1;
else
    u = 1;
end
