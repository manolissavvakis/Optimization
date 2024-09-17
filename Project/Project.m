clc
clear

lower = [0, 0, 0, 0, 0, 0];
upper = [100, 100, 10, 10, 100, 100];
[k_values, score] = ga(@fitness_fun, 6, [], [], [], [], lower, upper);
