function v = variance(x)
    m = avg(x);
    v = sum((x - m).^2) / (length(x) - 1)
end