function [T, V] = eval_energy(q_, dq_)
syms q1 q2 q3 dq1 dq2 dq3
q = [q1;q2;q3];
dq = [dq1; dq2;dq3];
[m1, m2, m3, l1, l2, l3, g] = set_parameters();
x1 = -l1/2*sin(-q(1, 1));
z1 = l1/2*cos(-q(1, 1));
x2 = -l1*sin(-q(1, 1))-l2/2*sin(q(2, 1));
z2 = l1*cos(-q(1, 1))-l2/2*cos(q(2, 1));
x3 = -l1*sin(-q(1, 1))+l3/2*sin(q(3, 1));
z3 = l1*cos(-q(1, 1))+l3/2*cos(q(3, 1));

% velocities of masses m1, m2, m3
dx1 = diff(x1,q(1, 1))*dq(1, 1)+diff(x1,q(2, 1))*dq(2, 1)+diff(x1,q(3, 1))*dq(3, 1);
dz1 = diff(z1,q(1, 1))*dq(1, 1)+diff(z1,q(2, 1))*dq(2, 1)+diff(z1,q(3, 1))*dq(3, 1);
dx2 = diff(x2,q(1, 1))*dq(1, 1)+diff(x2,q(2, 1))*dq(2, 1)+diff(x2,q(3, 1))*dq(3, 1);
dz2 = diff(z2,q(1, 1))*dq(1, 1)+diff(z2,q(2, 1))*dq(2, 1)+diff(z2,q(3, 1))*dq(3, 1);
dx3 = diff(x3,q(1, 1))*dq(1, 1)+diff(x3,q(2, 1))*dq(2, 1)+diff(x3,q(3, 1))*dq(3, 1);
dz3 = diff(z3,q(1, 1))*dq(1, 1)+diff(z3,q(2, 1))*dq(2, 1)+diff(z3,q(3, 1))*dq(3, 1);

% T1, T2, T3: kinetic energies of m1, m2, m3
T1 = 1/2*m1*(dx1^2+dz1^2);
T2 = 1/2*m2*(dx2^2+dz2^2);
T3 = 1/2*m3*(dx3^2+dz3^2); 

% V1, V2, V3: potential energies of m1, m2, m3
V1 = m1*g*z1;
V2 = m2*g*z2;
V3 = m3*g*z3;

T = T1+T2+T3; % total kinetic energy 
V = V1+V2+V3; % total potential energy 

T = simplify(T, 'steps', 50);
V = simplify(V, 'steps', 50);
T = subs(T, {q1 q2 q3 dq1 dq2 dq3}, {q_(1) q_(2) q_(3) dq_(1) dq_(2) dq_(3)});
V = subs(V, {q1 q2 q3 dq1 dq2 dq3}, {q_(1) q_(2) q_(3) dq_(1) dq_(2) dq_(3)});

end