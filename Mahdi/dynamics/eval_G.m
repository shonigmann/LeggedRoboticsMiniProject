%% 
% Evaluate the gravity matrix G given q
function G = eval_G(q)
G = [g.*l1.*sin(q1).*(m1+m2.*2.0+m3.*2.0).*(-1.0./2.0);l2.*m2.*sin(q2).*(g.*2.0-l2.*cos(q2)).*(1.0./4.0);g.*l3.*m3.*sin(q3).*(-1.0./2.0)];

end