function A_m = Am_tmp(l1,l2,l3,m,m3,q1_m,q2_m,q3_m)
%AM_TMP
%    A_M = AM_TMP(L1,L2,L3,M,M3,Q1_M,Q2_M,Q3_M)

%    This function was generated by the Symbolic Math Toolbox version 8.2.
%    05-Nov-2018 19:25:29

t2 = cos(q1_m);
t3 = sin(q1_m);
t4 = sin(q2_m);
t5 = l2.*t4;
t6 = l1.*t3;
t7 = l1.*t2;
t8 = cos(q2_m);
t9 = (l2.*t8)./2.0;
t10 = t5-t6-t7+t9;
t11 = cos(q3_m);
t12 = (l3.*t11)./2.0;
t13 = -t5+t6+t7+t12;
t14 = sin(q3_m);
t15 = (l3.*t14)./2.0;
t16 = t5+t15;
A_m = reshape([-m3.*(l1.*t2.*t13+l1.*t3.*t16)-m.*((l1.*t2.*(-t5+t6+(l1.*t2)./2.0))./2.0+(l1.*t3.*(t5-(l1.*t3)./2.0))./2.0)+m.*(l1.*t2.*t10-(l1.*l2.*t3.*t4)./2.0),l1.^2.*m.*(-1.0./4.0),0.0,(l2.^2.*m.*t4.^2)./4.0-(l2.*m.*t8.*t10)./2.0,0.0,0.0,l3.*m3.*t11.*t13.*(-1.0./2.0)-(l3.*m3.*t14.*t16)./2.0,0.0,l3.^2.*m3.*(-1.0./4.0)],[3,3]);
