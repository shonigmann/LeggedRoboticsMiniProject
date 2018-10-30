function A_p = eval_A_p(q_p)
[m1, m2, m3, l1, l2, l3, g] = set_parameters();
m=m1;
q1_p=q_p(1);
q2_p=q_p(2);
q3_p=q_p(3);
t2 = l1.^2;
t3 = q1_p+q2_p;
t4 = cos(t3);
t5 = q2_p+q3_p;
t6 = cos(t5);
t7 = l1.*l3.*m3.*t6.*(1.0./2.0);
t8 = l2.^2;
t9 = m.*t8.*(1.0./4.0);
t13 = l1.*l2.*m.*t4.*(1.0./2.0);
t10 = t9-t13;
t11 = m.*t2.*(5.0./4.0);
t12 = m3.*t2;
t14 = l3.^2;
t15 = m3.*t14.*(1.0./4.0);
t16 = t7+t15;
t17 = t7+t11+t12-t13;
t18 = dq2_p.*t17;
t19 = t18-dq1_p.*t10-dq3_p.*t16;
A_p = reshape([-dq1_p.*t10-dq3_p.*t16+dq2_p.*(t7+t11+t12-l1.*l2.*m.*t4.*(1.0./2.0)),-dq1_p.*t9,-dq3_p.*t15,t19,-dq1_p.*t9,-dq3_p.*t15,t19,-dq1_p.*t9,-dq3_p.*t15],[3,3]);

end