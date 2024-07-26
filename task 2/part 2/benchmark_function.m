% Save this file as benchmark_function.m
function f = benchmark_function(x, func_num)
    switch func_num
        case 1
            f = sum(x.^2); % Example: Sphere function
        case 2
            f = sum(abs(x)) + prod(abs(x)); % Example: Schwefel's Problem 2.22
        case 3
            f = sum(x.^2 - 10*cos(2*pi*x) + 10); % Example: Rastrigin function
        otherwise
            error('Function number not recognized');
    end
end
