clc; clear; close all;

% Defining the problem
problem = ypea_problem();
problem.vars = ypea_var('x', 'real', 'lower_bound', -10, 'upper_bound', 10);
f = @(x) polyval([1 7 6 -4 -3 2],x); 
cost = @(x) (0 - f(x)).^2;
problem.obj_func = @(sol) cost(sol.x);

% Genetic Algorithm
alg = ypea_ga();
alg.max_iter = 1000; % Maximum Number of Iterations
alg.pop_size = 100; % Population Size
alg.crossover_prob = 0.0; % Crossover Probability
alg.crossover_inflation = 0.4; % Crossover Inflation Factor
alg.mutation_prob = 1.0; % Mutation Probability
alg.mutation_rate = 0.1; % Mutation Rate
alg.mutation_step_size = 3.3; % Mutation Step Size
alg.mutation_step_size_damp = 0.99; % Mutation Step Size Damp
alg.selection = 'roulettewheel'; % Selection Method
alg.selection_pressure = 5; % Selection Pressure

% find solution
best_sol = alg.solve(problem);

% Defining the problem
% f = @(x) x.^5 + 7*x.^4 + 6*x.^3 - 4*x.^2 - 3*x + 2; % polynomial
% cost = @(x) sum((0 - f(x)).^2); % cost function

% matlab toolbox genetic algorithm
% [bestx, fval] = ga(cost, 5);