function [result, steps] = simpleIterations(B, b, initialApproximation, accuracy)
    prevResult = nan(4, 1);
    result = initialApproximation;

    steps = 0;
    while any(isnan(prevResult)) || (max(abs(result - prevResult)) > accuracy)
        prevResult = result;
        result = B * prevResult + b;
        steps = steps + 1;
    end
end