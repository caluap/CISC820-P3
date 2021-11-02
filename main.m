% mean([1,1,1,1,1,2])

low_b = -sqrt(3);
up_b = sqrt(3);

x = (up_b - low_b) .* rand(100000,1) + low_b;


% y = unknown_transformation(x);
% variance(x)

confidence_interval( length(x), .05, avg(x) )