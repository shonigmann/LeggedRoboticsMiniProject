%%
% This function is used to help answer the questions in impact_map.mlx
ts = 0.001;

%arbitrary initial conditions:
q = [pi/6,-pi/3,pi/6]';
dq = [-.2,2,0]';
figure();
for i=0:2000
    clf;
    
    l1=0.5;
    l2=0.5;
    l3=0.5;
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
        
    if mod(i,10)==0
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
    end
    G = eval_G(q);
    C = eval_C(q,dq);
    M = eval_M(q);
    if -q2>=q1
        [q,dq] = impact(q,dq);
    end
    q = q+dq*ts;
    ddq = M\(-G-C*dq);
    dq = dq+ddq*ts;
    
    
end