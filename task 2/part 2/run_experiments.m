% Save this file as run_experiments.m
function run_experiments()
    functions = [1, 2, 3];
    dimensions = [2, 10];
    runs = 15;
    
    for func_num = functions
        for D = dimensions
            ga_results = zeros(runs, 1);
            pso_results = zeros(runs, 1);
            sa_results = zeros(runs, 1);
            
            for run = 1:runs
                [~, ga_results(run)] = run_ga(func_num, D);
                [~, pso_results(run)] = run_pso(func_num, D);
                [~, sa_results(run)] = run_sa(func_num, D);
            end
            
            fprintf('Function %d, Dimension %d:\n', func_num, D);
            fprintf('GA: Mean = %f, Std = %f, Best = %f, Worst = %f\n', mean(ga_results), std(ga_results), min(ga_results), max(ga_results));
            fprintf('PSO: Mean = %f, Std = %f, Best = %f, Worst = %f\n', mean(pso_results), std(pso_results), min(pso_results), max(pso_results));
            fprintf('SA: Mean = %f, Std = %f, Best = %f, Worst = %f\n', mean(sa_results), std(sa_results), min(sa_results), max(sa_results));
        end
    end
end
