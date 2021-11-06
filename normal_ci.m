function normal_ci(n, alpha)

    if alpha == 0.01
        ep0 = 2.58;
    elseif alpha == 0.05
        ep0 = 1.96;
    elseif alpha == 0.1
        ep0 = 1.64;
    elseif alpha == 0.25
        ep0 = 1.15;
    else
        error('Alpha must be in [0.01, 0.05, 0.1, 0.25].');
    end
    

    for k = [10, 100, 1000, 10000]
        successes = 0;
        for i=1:n
            sample = sample_bernoulli(k, 0.5);

            Xbar = avg(sample);
            sig = std(sample);
            ep = sig * ep0 / sqrt(k);
            sample_ci = [Xbar - ep, Xbar + ep];
            
            if sample_ci(1) <= 0.5 && 0.5 <= sample_ci(2)
                successes = successes + 1;
            end
        end
        success_rate = successes / n;
        fprintf('Success rate = %f for k = %d\n', success_rate, k);

    end

end