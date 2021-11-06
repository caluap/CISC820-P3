
exp_size = 10000;

for func_num = 1:10
    
    fprintf('\n\n\n##### This if Function %u #####', func_num);
    
    % Bernoulli
    fprintf('\n\nBernoulli distribution');
    for theta = [0.01, 0.1, 0.3, 0.5, 0.7, 0.9, 0.99, 0.999]
        for k = [10, 100, 1000, 10000]
            linweis_hits = 0;
            for i = 1:exp_size
                sample = sample_bernoulli(k, theta);
                [a b] = ci(sample, func_num);
                if theta >= a && theta <= b
                    linweis_hits = linweis_hits + 1;
                end
            end
            fprintf('\ntheta=%g \t Hits=%g \t k=%u', theta, linweis_hits/exp_size, k );
        end
        fprintf('\n');
    end
    
    % Normal
    %fprint('\n\nNormal distribution');
    %sample = sample_normal(k, 0.1, 0.5);
    
    % Uniform
    %fprintf('\n\nUniform distribution');
    %sample = sample_uniform(k, 0, 1);
end
