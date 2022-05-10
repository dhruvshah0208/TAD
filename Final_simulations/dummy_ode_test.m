%% Load Constants
initial_states = [1 1];
%% Simulate ODE

[tv,y] = ode45('dummy_ode',[0 3],initial_states);

%% Assign outputs

x1 = y(:,1);
x2 = y(:,2);

y = x1 + x2.*cos(x1);

%% Plot outputs
hold on
plot(x1);
plot(x2);
plot(y);

hold off