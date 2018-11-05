%%
% This function takes the configuration of the 3-link model and plots the 
% 3-link model. 
% q = [q1, q2 ,q3] the generalized coordinates. Try different angles to see
% if your formulas for x1, z1, etc. makes sense. Example: q = [-pi/6, pi/6,
% pi/8]
%%
function visualize(q)

%    [~, ~, ~, l1, l2, l3, ~] = set_parameters;
l1=0.5;
l2=0.5;
l3=0.5;
q1 = q(1,1);
q2 = q(2,1);
q3 = q(3,1);

x1 = l1/2*sin(q1);
z1 = l1/2*cos(q1);
x2 = 2*x1-l2/2*sin(q2);
z2 = 2*z1-l2/2*cos(q2);
x3 = 2*x1+l3/2*sin(q3);
z3 = 2*z1+l3/2*cos(q3);

x_h = 2*x1;
z_h = 2*z1;
x_swf = x_h-l2*sin(q2);
z_swf = z_h-l2*cos(q2);
x_t = x_h+l3*sin(q3);
z_t = z_h+l3*cos(q3);
    
    %% 
    % Here plot a schematic of the configuration of three link biped at the
    % generalized coordinate q = [q1, q2, q3]:
    close all
    lw = 2;
    % links
    % link1
    plot([0, x_h], [0, z_h], 'linewidth', lw); 
    hold on
    % link2
    plot([x_h, x_swf], [z_h, z_swf], 'linewidth', lw); 
    % link3
    axis 'square'
    xlim([-1, 1]);
    ylim([0, 1.2]);
    plot([x_h, x3+(x3-x_h)], [z_h, z3+(z3-z_h)], 'linewidth', lw); 
    % point masses
    mz = 40;
    % m1
    plot(x1, z1, '.', 'markersize', mz); 
    
    % m2
    plot(x2, z2, '.', 'markersize', mz); 
    
    % m3
    plot(x3, z3, '.', 'markersize', mz); 
end
