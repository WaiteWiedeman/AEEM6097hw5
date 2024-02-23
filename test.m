clc; clear; close all;

problem = ypea_problem();
problem.vars = ypea_var('x', 'real', 'size', 20, 'lower_bound', -10, 'upper_bound', 10);
sphere = ypea_test_function('rastrigin');
problem.obj_func = @(sol) sphere(sol.x);
alg = ypea_ga();
% Maximum Number of Iterations
alg.max_iter = 1000;

% Population Size
alg.pop_size = 100;

% Crossover Probability
alg.crossover_prob = 0.7;

% Crossover Inflation Factor
alg.crossover_inflation = 0.4;

% Mutation Probability
alg.mutation_prob = 0.3;

% Mutation Rate
alg.mutation_rate = 0.1;

% Mutation Step Size
alg.mutation_step_size = 0.5;

% Mutation Step Size Damp
alg.mutation_step_size_damp = 0.99;

% Selection Method
alg.selection = 'roulettewheel';

% Selection Pressure
alg.selection_pressure = 5;

best_sol = alg.solve(problem);
