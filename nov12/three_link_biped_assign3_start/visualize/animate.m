%%
% This function animates the solution of the equations of motion of the
% three link biped. 
% sln is the solution computed by solve_eqns.m
%%
function animate(sln)

figure();
skip = 5; 

num_steps = length(sln.Y);% total number of steps the robot has taken (find this from sln)
r0 = [0; 0];
tic();
for j = 1:num_steps
    Y = cell2mat(sln.Y(j));%
    [N, ~] = size(Y);
    for i = 1:skip:N % what does skip do? it skips animation of solution points between start and end point of each step
        q = Y(i,1:3);%
        pause(0.002);  % pause for 2 mili-seconds
        % visualize :
        visualize(q,r0);
        hold off
    end
    pause(3);
    % update r0:
    [x_swf,z_swf,~,~] = kin_swf(q);
    r0 = [x_swf;z_swf]; %new position of stance foot in gimbal frame
end
t_anim = toc();

% Real time factor is the actual duration of the simulations (get it from sln) to
% the time it takes for MATLAB to animate the simulations (get it from
% t_anim). How does 'skip' effect this value? what does a real time factor
% of 1 mean?
real_time_factor = sln.T{end}(end)/t_anim;% This is only an estimation 
fprintf('Real time factor:');
disp(real_time_factor);
end