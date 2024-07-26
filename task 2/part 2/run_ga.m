% Save this file as run_ga.m
function [best_solution, best_score] = run_ga(func_num, D)
    options = optimoptions('ga', 'MaxGenerations', 100, 'PopulationSize', 50);
    [best_solution, best_score] = ga(@(x)benchmark_function(x, func_num), D, [], [], [], [], -100*ones(1,D), 100*ones(1,D), [], options);
end
