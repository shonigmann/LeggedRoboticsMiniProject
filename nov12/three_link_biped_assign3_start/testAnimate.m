%%Testing the animate function with different initial conditions here:
clc;
clear;
clf; 
close all;

q0 = [pi/6;-pi/3;pi/10];
dq0 = [0;0;0];
num_steps = 5;

sln = solve_eqns(q0,dq0,num_steps);

animate(sln);

