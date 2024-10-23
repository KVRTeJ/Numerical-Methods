function [result, splitDifference] = calculateNewtonDiff(abscissaAxis, ordinateAxis, x)
    lengthAbscissaAxis = length(abscissaAxis);
    lengthOrdinateAxis = length(ordinateAxis);

    if lengthOrdinateAxis ~= lengthAbscissaAxis
        error("the size of abscissa axis is not equal to the size of ordinate axis");
        return
    end

    matrixSize = lengthOrdinateAxis - 1;
    splitDifference = zeros(matrixSize, matrixSize);
    for j = matrixSize:-1:1
        splitDifference(j, 1) = (ordinateAxis(j + 1) - ordinateAxis(j)) / ...
            (abscissaAxis(j + 1) - abscissaAxis(j));
    end

    for i = 2:1:matrixSize
        start = lengthOrdinateAxis - i;
        for j = start:-1:1
            splitDifference(j, i) = (splitDifference(j + 1, i - 1) - splitDifference(j, i -1)) / ...
                (abscissaAxis(j + i) - abscissaAxis(j));
            start = start - 1;
        end
    end

    disp(splitDifference)


end