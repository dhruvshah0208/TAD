%% Pre-processing steps
constants
sim('simulink_model')
%% Load the data

load R_TA   
load R_DT
load theta_TA
load theta_DT
load alpha_A
load alpha_D
load alpha_T
load xT
load yT

R_TA = R_TA.data;
R_DT = R_DT.data;
theta_TA = theta_TA.data;
theta_DT = theta_DT.data;
alpha_A = alpha_A.data;
alpha_D = alpha_D.data;
alpha_T = alpha_T.data;
xT = xT.data;
yT = yT.data;


xA = xT + R_TA.*cos(theta_TA);
yA = yT + R_TA.*sin(theta_TA);

xD = xT + R_DT.*cos(theta_DT);
yD = yT + R_DT.*sin(theta_DT);

% safety1 = ((xA - xD).^2 + (yA - yD).^2).^(0.5);
% safety2 = theta_TA - theta_DT;
% h1 = min(safety1);
% h2 = min(safety2);


%% Plotting and Animating
a1 = animatedline('Color','g');% D
a2 = animatedline('Color','r');% A
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

