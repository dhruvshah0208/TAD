constants()

%% Natural Response
% n = 0;x_prev = [x1_initial ; x2_initial];
% X = x1_initial;
% Y = x2_initial;
% while (n < time_span)
%     x_next = x_prev + 2*delta*f(x_prev,0);
%     x_next(1) = X1(floor(abs(x_next(1)-x1_min)/x1_step) + 1);
%     x_next(2) = X2(floor(abs(x_next(2)-x2_min)/x2_step) + 1);
%     X = [X x_next(1)];
%     Y = [Y x_next(2)];
%     x_prev = x_next;
%     n = n+delta;
% end
% plot(X,Y)

%% Matrix quantities
