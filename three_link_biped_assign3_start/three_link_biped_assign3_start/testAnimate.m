%%Testing the animate function with different initial conditions here:
clc;
clear;
clf; 
close all;

q0 = [pi/6;-pi/3;0];
dq0 = [0;0;8];
num_steps = 10;

sln = solve_eqns(q0,dq0,num_steps);

animate(sln);

