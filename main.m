% mean([1,1,1,1,1,2])

low_b = 0; %-sqrt(3);
up_b = 1; %sqrt(3);

x = (up_b - low_b) .* rand(10000,1) + low_b;


% y = unknown_transformation(x);
% variance(x)

for k = [10, 100, 1000, 10000]
    successes = 0;
    for i=1:k
        sample = rand_sample(x, k);
        ci = confidence_interval( k, .05, avg(sample) );
        if ci(1) <= 0.5 && 0.5 <= ci(2)
            successes = successes + 1;
        end
    end
    success_rate = successes / k;
    fprintf('Success rate = %f for k = %d\n', success_rate, k);

end