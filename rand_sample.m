function x = rand_sample(original_x, n)
    indices = randperm(length(original_x), n);
    x = original_x(indices);
end