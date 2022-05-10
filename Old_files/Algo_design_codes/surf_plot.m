%% Plotting a surface h(x)
[R1,R2] = meshgrid(0.1:0.5:20,0.1:0.5:20);
a = 5;
b = 1;
alpha = 1;
beta = 2;
h = ((a^2*alpha^2*R1.^2 +b^2*beta^2*R2.^2 ).^0.5)./(alpha*R1 + beta*R2);
surf(R1,R2,h)