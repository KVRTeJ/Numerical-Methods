function [result, absoluteError] = calculateNewtonDiff(abscissaAxis, ordinateAxis, x)
    splitDifference = getSplitDifference(abscissaAxis, ordinateAxis);

    coef = zeros(1, length(ordinateAxis) - 1 );
    for i = 1:1:length(coef)
        coef(i) = (x - abscissaAxis(i));
    end

    result = splitDifference(1, 1) + (coef(1) + coef(2)) * splitDifference(1, 2) + (coef(1) * coef(2) + coef(1) * coef(3) + coef(2) * coef(3)) * splitDifference(1, 3) + ...
        (coef(1) * (coef(2) * (coef(3) + coef(4)) + coef(3) * coef(4)) + coef(2) * coef(3) * coef(4)) * splitDifference(1, 4);

    absoluteError = 0.0005 * power(2, 1) + (coef(1) + coef(2)) * 0.0005 * power(2, 2) + (coef(1) * coef(2) + coef(1) * coef(3) + coef(2) * coef(3)) * 0.0005 * power(2, 3) + ...
        (coef(1) * (coef(2) * (coef(3) + coef(4)) + coef(3) * coef(4)) + coef(2) * coef(3) * coef(4)) * 0.0005 * power(2, 4);
end