
exp_size = 10000;
% comment

bernoulli = true;
normal = true;
uniform = false;


tic
for func_num = 1:10
    
    fprintf('\n\n\n##### Tests for Function %u #####', func_num);
    
    % Bernoulli
    if bernoulli
        fprintf('\n\nBernoulli distribution');
        for theta = [0, 0.001, 0.01, 0.1, 0.25, 0.3, 0.5, 0.7, 0.75, 0.9, 0.99, 0.999, 1]
            for k = [100, 1000, 10000]
                linweis_hits = 0;
                avg_a = 0;
                avg_b = 0;
                for i = 1:exp_size
                    sample = sample_bernoulli(k, theta);
                    [a b] = ci(sample, func_num);
                    avg_a = avg_a + a/exp_size;
                    avg_b = avg_b + b/exp_size;
                    if theta >= a && theta <= b
                        linweis_hits = linweis_hits + 1;
                    end
                end
                fprintf('\ntheta=%.4f   Hits=%.4f   avg_a=%.4f   avg_b=%.4f   k=%u', theta, linweis_hits/exp_size, avg_a, avg_b, k );
            end
            fprintf('\n');
        end
    end
    
    if normal
        % Normal
        fprintf('\n\nNormal distribution');

        % https://keisan.casio.com/exec/system/1180573188
        mus     = [0.5, 0.50, 0.10, 0.90, 4.0];
        sigmas  = [0.1, 0.02, 0.02, 0.02, 0.1];
 
        for i=1:length(mus)
            mu = mus(i);
            sigma = sigmas(i);
            for k = [100, 1000, 10000]            
                linweis_hits = 0;
                avg_a = 0;
                avg_b = 0;
                for i = 1:exp_size
                    sample = sample_normal(k, sigma, mu);
                    [a b] = ci(sample, func_num);
                    avg_a = avg_a + a/exp_size;
                    avg_b = avg_b + b/exp_size;
                    if mu >= a && mu <= b
                        linweis_hits = linweis_hits + 1;
                    end
                end
                fprintf('\nmu=%.4f   sigma=%.4f   Hits=%.4f   avg_a=%.4f   avg_b=%.4f   k=%u', mu, sigma, linweis_hits/exp_size, avg_a, avg_b, k );
            end            
            fprintf('\n');
        end
    end
    
    % Uniform
    if uniform
        fprintf('\n\nUniform distribution');
        sample = sample_uniform(k, 0, 1);
    end
end

fprintf('\n\n\nDone!\n');
toc
