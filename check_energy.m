clear;
clc;
q_m = [pi/6, -pi/6, pi/10]';
dq_m = [1, 0.2, 0]';
[T_m, V_m] = eval_energy(q_m, dq_m);
q_p=[0 1 0;1 0 0;0 0 1]*q_m;
A_p = eval_A_p(q_p);
A_m = eval_A_m(q_m);
dq_p=A_p\A_m*dq_m;
[T_p, V_p] = eval_energy(q_p, dq_p);
energy_difference=eval((V_p+T_p)-(V_m+T_m))
