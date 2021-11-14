% NOVA School of Science and Technology
% Department of Electrical and Computer Engineering
% IEEC course, fall 2021
% Bruno Guerreiro (bj.guerreiro@fct.unl.pt)

% Summary: simulate simple dynamic system model of a drone

% Model and simulation parameters
Tend = 30;
dT = 0.1;
N = round(Tend/dT)+1;
g = 9.8;
m = 4;

% initial conditions
p0 = [0;0;1];
v0 = [0;0;0];
nx = 6;
nu = 3;
x = zeros(nx,N+1);
lbd = zeros(3,N+1);
u = zeros(nu,N);
x(:,1) = [p0;v0];
x_ref = [[0;0;1;0;0;0]*ones(1,1/dT+1),...
         [0.5;0;2;0;0;0]*ones(1,(Tend-1)/dT)];
t = 0:dT:Tend;

for k = 1:N,
    
    % get state vector and plot it
    p = x(1:3,k);
    v = x(4:6,k);
    p_ref = x_ref(1:3,k);
    
    % nonlinear controller
    u(:,k) = -diag([kp/2,kp/2,kp])*(p-p_ref) + ...
             -diag([kv/2,kv/2,kv])*v + [0;0;m*g];
    
    % simplified nonlinear model of a drone
    dot_p = v;
    dot_v = -[0;0;g] + 1/m*u(:,k) - 0.1*v.*abs(v);
    dot_x = [dot_p;dot_v];
    
    % discretized system using forward Euler integration
    x(:,k+1) = x(:,k) + dT*dot_x;
    
    % auxiliary drone attitude computation from input
    f_des = 1/m*u(:,k);
    zB = f_des/norm(f_des);
    xC = [1;0;0];
    yB = cross(zB,xC);
    xB = cross(yB,zB);
    R = [xB,yB,zB];
    lbd_full(:,k) = R2Euler(R);
    
end
% auxiliary drone final attitude computation
lbd_full(:,k+1) = lbd_full(:,k);

% show results plot
show_data;
