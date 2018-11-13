%% 
% This function models the impact map; that is, it maps the generalized
% coordinates and velocites from before impact to after impact. 
% 
function [q_p, dq_p] = impact(q_m, dq_m)

q_p = [0 1 0; 1 0 0; 0 0 1]*q_m;
%if 0
    A_m = eval_A_m(q_m);
    A_p = eval_A_p(q_p);
    
    %used for quick testing
% else
%     q1_p = q_p(1);
%     q2_p = q_p(2);
%     q3_p = q_p(3);
%     q1_m = q_p(1);
%     q2_m = q_p(2);
%     q3_m = q_p(3);
%     [m1, m2, m3, l1, l2, l3, g] = set_parameters();
%     m=m1;
%     A_m = Am_tmp(l1,l2,l3,m,m3,q1_m,q2_m,q3_m);
%     A_p = Ap_tmp(l1,l2,l3,m,m3,q1_p,q2_p,q3_p);
% end
% A_p dq_p = A_m dq_m
% Note: To solve the equation Ax = b you could use x = A \ b to avoid taking
% inverse of A. 
dq_p=A_p\A_m*dq_m;

end