%% 
% This function models the impact map; that is, it maps the generalized
% coordinates and velocites from before impact to after impact. 
% 
function [q_p, dq_p] = impact(q_m, dq_m)

q_p = [0 1 0; 1 0 0; 0 0 1]*q_m;

A_m = eval_A_m(q_m);
A_p = eval_A_p(q_p);

% A_p dq_p = A_m dq_m
% Note: To solve the equation Ax = b you could use x = A \ b to avoid taking
% inverse of A. 
dq_p=A_p\A_m*dq_m;

end