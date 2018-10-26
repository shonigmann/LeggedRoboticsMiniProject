%%
% Evaluate the Mass matrix given q
function M = eval_M(q)
t2 = l1.^2;
t3 = cos(q1);
t4 = cos(q2);
t5 = q1-q3;
t6 = cos(t5);
t7 = l1.*l3.*m3.*t6.*(1.0./2.0);
M = reshape([m1.*t2.*(1.0./4.0)+m3.*t2+m2.*t2.*t3.^2.*2.0,l1.*l2.*m2.*t3.*t4.*(-1.0./2.0),t7,l1.*l2.*m2.*t3.*t4.*(-1.0./2.0),l2.^2.*m2.*t4.^2.*(1.0./4.0),0.0,t7,0.0,l3.^2.*m3.*(1.0./4.0)],[3,3]);


end