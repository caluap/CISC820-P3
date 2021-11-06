% mean([1,1,1,1,1,2])

low_b = 0; %-sqrt(3);
up_b = 1; %sqrt(3);

x = (up_b - low_b) .* rand(10000000,1) + low_b;


% y = unknown_transformation(x);
% variance(x)
n = 10000

for k = [10, 100, 1000, 10000]
    successes = 0;
    for i=1:n
        sample = sample_bernoulli(k, 0.5);
        sample_ci = confidence_interval( k, .05, avg(sample) );
        if sample_ci(1) <= 0.5 && 0.5 <= sample_ci(2)
            successes = successes + 1;
        end
    end
    success_rate = successes / n;
    fprintf('Success rate = %f for k = %d\n', success_rate, k);

end