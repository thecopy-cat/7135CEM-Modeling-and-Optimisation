% Save this file as run_pso.m
function [best_solution, best_score] = run_pso(func_num, D)
    options = optimoptions('particleswarm', 'SwarmSize', 50, 'MaxIterations', 100);
    [best_solution, best_score] = particleswarm(@(x)benchmark_function(x, func_num), D, -100*ones(1,D), 100*ones(1,D), options);
end
