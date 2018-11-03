%%
% This function is used to help answer the questions in impact_map.mlx
clc;
clear; 

ts = 0.001;

%arbitrary initial conditions:
q = [0,0,0]';
dq = [1,.2,0]';
figure();

l1=0.5;
l2=0.5;
l3=0.5;

num_steps = 100;

for i=1:num_steps
    figure(1);
    clf;
    
    q1 = q(1,1);
    q2 = q(2,1);
    q3 = q(3,1);

    x1 = -(l1*sin(q1))/2;
    z1 = (l1*cos(q1))/2;
    x2 = - l1*sin(q1) - (l2*sin(q2))/2;
    z2 = l1*cos(q1) - (l2*cos(q2))/2;
    x3 = (l3*sin(q3))/2 - l1*sin(q1);
    z3 = l1*cos(q1) + (l3*cos(q3))/2;
    x_h = -l1*sin(q1);
    z_h = l1*cos(q1);
    x_t = l3*sin(q3) - l1*sin(q1);
    z_t = l1*cos(q1) + l3*cos(q3);
    x_swf = - l1*sin(q1) - l2*sin(q2);
    z_swf = l1*cos(q1) - l2*cos(q2);
        
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
    drawnow;        
    
    [qp,dqp] = impact(q,dq);
    [Tm,Vm] = eval_energy(q,dq);
    [Tp,Vp] = eval_energy(qp,dqp);
    
    energy_before(i) = Tm+Vm;
    energy_after(i) = Tp+Vp;
    energy_loss(i) = energy_before(i)-energy_after(i);
    
    q=q+pi/4/num_steps;
        
end

figure(2);
subplot(2,1,1);
t=1:num_steps;
plot(t,energy_before);
hold on;
plot(t,energy_after);
title('Energy Before and After Impact');
xlabel('Sample Number');
ylabel('Total Energy, [J]');
legend('Before','After');

subplot(2,1,2);
plot(t,energy_loss);

title('Energy Loss Due to Impact');
xlabel('Sample Number');
ylabel('Total Energy, [J]');

