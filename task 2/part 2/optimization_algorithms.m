%Genetic Algorithm (GA)
function [best_sol, best_val] = run_ga(fun, nvar, lb, ub)
    options = optimoptions('ga', 'MaxGenerations', 100, 'PopulationSize', 50);
    [best_sol, best_val] = ga(fun, nvar, [], [], [], [], lb, ub, [], options);
end

%Particle Swarm Optimization (PSO)
function [best_sol, best_val] = run_pso(fun, nvar, lb, ub)
    options = optimoptions('particleswarm', 'SwarmSize', 50, 'MaxIterations', 100);
    [best_sol, best_val] = particleswarm(fun, nvar, lb, ub, options);
end

%Simulated Annealing (SA)
function [best_sol, best_val] = run_sa(fun, nvar, lb, ub)
    options = optimoptions('simulannealbnd', 'MaxIterations', 100);
    [best_sol, best_val] = simulannealbnd(fun, lb, ub, options);
end
