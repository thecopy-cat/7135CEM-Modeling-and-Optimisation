% Save this file as run_sa.m
function [best_solution, best_score] = run_sa(func_num, D)
    options = optimoptions('simulannealbnd', 'MaxIterations', 100);
    [best_solution, best_score] = simulannealbnd(@(x)benchmark_function(x, func_num), randn(1, D), -100*ones(1,D), 100*ones(1,D), options);
end
