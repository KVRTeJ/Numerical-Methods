function [result, trueDegree] = newtonFormEquidistantNodes(abscissaAxis, ordinateAxis, x, abscissaStep)
    lengthAbscissaAxis = length(abscissaAxis);
    lengthOrdinateAxis = length(ordinateAxis);

    if lengthOrdinateAxis ~= lengthAbscissaAxis
        error("the size of abscissa axis is not equal to the size of ordinate axis");
        return
    end

    errorEqual = power(10, -2);

    finalDifferences = zeros(lengthOrdinateAxis, lengthAbscissaAxis);

    for i = 1:1:lengthOrdinateAxis
        finalDifferences(1, i) = ordinateAxis(i);
    end

    for i = 2:1:lengthOrdinateAxis
        for j = lengthOrdinateAxis - i + 1:-1:1
            finalDifferences(i, j) = finalDifferences(i - 1, j + 1) - finalDifferences(i - 1, j);
        end
    end

    % disp(finalDifferences)

    maxInRow = max(finalDifferences', [], 1);
    trueDegree = 0;
    for i = 2:1:lengthOrdinateAxis
        if (maxInRow(i) < power(2, i - 1) * 0.0005) && (maxInRow(i - 1) >= power(2, i - 2) * 0.0005)
            trueDegree = i - 1;
        end
    end

    for i = trueDegree:1:lengthOrdinateAxis
        for j = 1:1:lengthOrdinateAxis
            finalDifferences(i, j) = 0;
        end
    end

    % disp(finalDifferences)

    temp = (x - abscissaAxis(lengthOrdinateAxis)) / abscissaStep;
    result = finalDifferences(1, lengthOrdinateAxis) + finalDifferences(2, lengthOrdinateAxis - 1) * temp / 1 + ... 
        finalDifferences(3, lengthOrdinateAxis - 2) * (temp * (temp + 1)) / 2 + finalDifferences(4, lengthOrdinateAxis - 3) * (temp * (temp + 1) * (temp + 2)) / 6;
    
end