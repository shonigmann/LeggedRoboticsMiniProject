%% Solve equations of motion 
% Note: eqns.m defines the equations of motion to be solved by this script
% This function returns the time vector T, the solution Y, the event time
% TE, solution at the event time YE.
% q0, dq0 are the initial angles and angular velocities, num_steps are the
% number of steps the robot is supposed to take
% As an example you can use q0 = [pi/6; -pi/3; 0] and dq0 = [0;0;0]. 
%TE time of event--->discrete--->eg TE=[0.2,0.4,...
%T is continuous time....
function sln = solve_eqns(q0, dq0, num_steps)

% options = ...
h = 0.001; % time step
tmax = 2; % max time that we allow for a single step
tspan = 0:h:tmax; % from 0 to tmax with time step h
% q0 = [pi/6; -pi/3; 0];
% dq0 = [0;0;0];
y0 = [q0; dq0];
t0 = 0;

% we define the solution as a structure to simplify the post-analyses and
% animation, here we intialize it to null. 
sln.T = {};
sln.Y = {};
sln.TE = {};
sln.YE = {};

options = odeset('RelTol', 1e-5, 'Events', @event_func);

for i = 1:num_steps
    [T, Y, TE, YE] = ode45(@eqns,tspan,y0,options);% use ode45 to solve the equations of motion (eqns.m)
    sln.T{i} = T+t0;
    sln.Y{i} = Y;
    sln.TE{i} = TE;
    sln.YE{i} = YE;
    if T(end) == tmax
        break
    end
    
    % Impact map
    t0 = T(end);
    [q_p,dq_p] = impact(Y(end,1:3)',Y(end,4:6)'); %not sure if this is required?
    y0 = [q_p;dq_p];
end
end


