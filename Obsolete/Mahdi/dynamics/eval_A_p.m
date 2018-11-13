function A_p = eval_A_p(q_p)


q1_p = q_p(1);
q2_p = q_p(2);
q3_p = q_p(3);

[m1, m2, m3, l1, l2, l3, g] = set_parameters();
m=m1;


t2 = l1.^2;
t3 = q1_p-q2_p;
t4 = cos(t3);
t5 = q1_p-q3_p;
t6 = cos(t5);
A_p = reshape([m.*t2.*(-5.0./4.0)-m3.*t2+(l1.*l2.*m.*t4)./2.0-(l1.*l3.*m3.*t6)./2.0,0.0,0.0,l2.*m.*(l2-l1.*t4.*2.0).*(-1.0./4.0),l2.^2.*m.*(-1.0./4.0),0.0,l3.*m3.*(l3+l1.*t6.*2.0).*(-1.0./4.0),0.0,l3.^2.*m3.*(-1.0./4.0)],[3,3]);

end