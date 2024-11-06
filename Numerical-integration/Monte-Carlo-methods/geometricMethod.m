function [result, size] = geometricMethod(from, to, accuracy)
    min = myFunction(from);
    max = myFunction(to);

    size = 25000;
    alpha = 0.01;
    while 1 / (2 * sqrt(alpha * size)) > accuracy
        size = size + 10000;
    end

    xi = rand(size, 1);
    eta = rand(size, 1);

    favorableEvents = (myFunction(from + (to - from) .* xi) - min) ./ (max - min) >= eta;
    sumFavorableEvents = sum(favorableEvents);

    result = (max - min) * (to - from) * (sumFavorableEvents / size) + min * (to - from);
    
end