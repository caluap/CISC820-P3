function ci = confidence_interval(n, alpha, avgX)
    epsilon = sqrt( 1 / (2*n) * reallog(2/alpha) );
    ci = [avgX - epsilon, avgX + epsilon];
end