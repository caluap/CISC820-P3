function ci = confidence_interval(n, alpha, avgX)
    epsilon = sqrt( log(2/alpha) / (2*n) );
    ci = [avgX - epsilon, avgX + epsilon];
end