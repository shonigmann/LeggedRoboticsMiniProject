%%
% Evaluate the Coriolis matrix C, given q, dq
function C = eval_C(q, dq)
[m1, m2, m3, l1, l2, l3, g] = set_parameters();
q1=q(1);
q2=q(2);
q3=q(3);
dq1=dq(1);
dq2=dq(2);
dq3=dq(3);

t2 = q1-q2;
t3 = sin(t2);
t4 = q1-q3;
t5 = sin(t4);
C = reshape([0.0,dq1.*l1.*l2.*m2.*t3.*(1.0./2.0),dq1.*l1.*l3.*m3.*t5.*(-1.0./2.0),dq2.*l1.*l2.*m2.*t3.*(-1.0./2.0),0.0,0.0,dq3.*l1.*l3.*m3.*t5.*(1.0./2.0),0.0,0.0],[3,3]);


end