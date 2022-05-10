% SOSDEMO2 --- Lyapunov Function Search 
% Section 4.2 of SOSTOOLS User's Manual
%% Example 1
clear; 
pvar x1 x2 x3 x4 x5 x6;
vars = [x1; x2; x3; x4; x5; x6];
dpvar e1 e2
% Constructing the vector field dx/dt = f
f = [-x1^3+4*x2^3-6*x3*x4;
     -x1-x2+x5^3;
      x1*x4-x3+x4*x6;
      x1*x3+x3*x6-x4^3;
     -2*x2^3-x5+x6;
     -3*x3*x4-x5^3-x6];

% =============================================
% First, initialize the sum of squares program
prog = sosprogram(vars,[e1; e2]);

% =============================================
% The Lyapunov function V(x):
vec = monomials(vars,[2 4]);
[prog,V] = sospolyvar(prog,vec,'wscoeff');

% =============================================
% Next, define SOSP constraints

prog = sosineq(prog,V-e1*(x1^2+x2^2+x3^2+x4^2+x5^2+x6^2)-e2*(x1^4+x2^4+x3^4+x4^4+x5^4+x6^4));
prog = sosineq(prog,e1+e2-0.1);
% Constraint 2: -dV/dx*(x3^2+1)*f >= 0
expr = -(diff(V,x1)*f(1)+diff(V,x2)*f(2)+diff(V,x3)*f(3)+diff(V,x4)*f(4)+diff(V,x5)*f(5)+diff(V,x6)*f(6));
prog = sosineq(prog,expr);

% =============================================
% And call solver
solver_opt.solver = 'sedumi';
prog = sossolve(prog,solver_opt);

% =============================================
% Finally, get solution
SOLV = sosgetsol(prog,V)

%% Example 3
% clear
% pvar x1 x2 u1 u2;
% vars = [x1; x2; u1; u2];
% dpvar a1 a2 a3 a4 a5
% % Constructing the vector field dx/dt = f
% f = [x2;
%      u1*u2-10*u1;
%      x2*u2;
%     -x2*u1];
% 
% % =============================================
% % First, initialize the sum of squares program
% prog = sosprogram(vars);
% 
% % =============================================
% % The Lyapunov function V(x):
% [prog,V] = sospolyvar(prog,[x2^2; u1^2; u2^2; u2; 1],'wscoeff');
% % =============================================
% % Next, define SOSP constraints
% % prog = soseq(prog,coeff_3+coeff_4+coeff_5);
% % prog = soseq(prog,u1^2+u2^2-1);
% 
% W = 0.1*(1-u2) + 0.1*x2^2;
% prog = sosineq(prog,V-W);
% 
% expr = -(diff(V,x1)*f(1)+diff(V,x2)*f(2)+diff(V,u1)*f(3)+diff(V,u2)*f(4));
% prog = sosineq(prog,expr);
% 
% 
% 
% % =============================================
% % And call solver
% solver_opt.solver = 'sedumi';
% prog = sossolve(prog,solver_opt);
% 
% % =============================================
% % Finally, get solution
% SOLV = sosgetsol(prog,V)

























