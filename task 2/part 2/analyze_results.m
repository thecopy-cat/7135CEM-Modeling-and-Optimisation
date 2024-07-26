function analyze_results(results)
    for i = 1:length(results)
        for j = 1:length(results(i).dims)
            ga_res = results(i).dims(j).ga;
            pso_res = results(i).dims(j).pso;
            sa_res = results(i).dims(j).sa;
            
            fprintf('Function %d, Dimension %d\n', i, j);
            fprintf('GA: Mean = %.4f, Std = %.4f, Best = %.4f, Worst = %.4f\n', ...
                mean(ga_res), std(ga_res), min(ga_res), max(ga_res));
            fprintf('PSO: Mean = %.4f, Std = %.4f, Best = %.4f, Worst = %.4f\n', ...
                mean(pso_res), std(pso_res), min(pso_res), max(pso_res));
            fprintf('SA: Mean = %.4f, Std = %.4f, Best = %.4f, Worst = %.4f\n', ...
                mean(sa_res), std(sa_res), min(sa_res), max(sa_res));
            fprintf('\n');
        end
    end
end
