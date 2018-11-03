function A_p = eval_A_p(q_p)


q1_p = q_p(1);
q2_p = q_p(2);
q3_p = q_p(3);
% dq1_p = dq_p(1);
% dq2_p = dq_p(2);
% dq3_p = dq_p(3);

[m1, m2, m3, l1, l2, l3, g] = set_parameters();
m=m1;
t2 = l1.^2;
t3 = q1_p-q2_p;
t4 = cos(t3);
t5 = (l1.*l2.*m.*t4)./2.0;
t6 = q1_p-q3_p;
t7 = cos(t6);
t8 = l2.^2;
t9 = l3.^2;
A_p = reshape([t5-m.*t2.*(5.0./4.0)-m3.*t2-(l1.*l3.*m3.*t7)./2.0,0.0,0.0,t5-(m.*t8)./4.0,m.*t8.*(-1.0./4.0),0.0,m3.*t9.*(-1.0./4.0)-(l1.*l3.*m3.*t7)./2.0,0.0,m3.*t9.*(-1.0./4.0)],[3,3]);

end