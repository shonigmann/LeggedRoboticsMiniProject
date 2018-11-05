function A_p = eval_A_p(q_p)


q1_p = q_p(1);
q2_p = q_p(2);
q3_p = q_p(3);

[m1, m2, m3, l1, l2, l3, g] = set_parameters();
m=m1;

t2 = l1.^2;
t3 = q1_p-q3_p;
t4 = cos(t3);
t5 = sin(q1_p);
t6 = sin(q2_p);
t7 = l1.*l2.*m.*t5.*t6.*(1.0./4.0);
t8 = cos(q1_p);
t9 = cos(q2_p);
t10 = l1.*l2.*m.*t8.*t9.*(1.0./4.0);
A_p = reshape([t7-m.*t2.*(3.0./4.0)-m3.*t2-l1.*l3.*m3.*t4.*(1.0./2.0),-t7,0.0,t10,-t10,0.0,l3.*m3.*(l3+l1.*t4.*2.0).*(-1.0./4.0),0.0,l3.^2.*m3.*(-1.0./4.0)],[3,3]);

end

