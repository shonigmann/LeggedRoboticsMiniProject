%%
% Evaluate the Coriolis matrix C, given q, dq
function C = eval_C(q, dq)
t2 = cos(q2);
t3 = cos(q1);
t4 = q1-q3;
t5 = sin(t4);
C = reshape([-dq1.*l1.^2.*m2.*sin(q1.*2.0),l1.*l2.*m2.*t2.*(t3-dq1.*sin(q1)).*(-1.0./2.0),dq1.*l1.*l3.*m3.*t5.*(-1.0./2.0),l1.*l2.*m2.*t3.*(t2+dq2.*sin(q2)).*(1.0./2.0),dq2.*l2.^2.*m2.*sin(q2.*2.0).*(-1.0./8.0),0.0,dq3.*l1.*l3.*m3.*t5.*(1.0./2.0),0.0,0.0],[3,3]);


end