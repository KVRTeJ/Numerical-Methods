function result = hermitovSpline(abscissaAxis, ordinateAxis, ordinateAxisDiff, x)
    lengthAbscissaAxis = length(abscissaAxis);
    lengthOrdinateAxis = length(ordinateAxis);

    if lengthOrdinateAxis ~= lengthAbscissaAxis
        error("the size of abscissa axis is not equal to the size of ordinate axis");
        return
    end

    if x > abscissaAxis(lengthAbscissaAxis)
        result = 0;
        return;
    end

    indexFrom = 1;
    indexTo = 2;

    for i = indexTo:1:lengthAbscissaAxis
        if x <= abscissaAxis(i)
            break;
        end

        indexFrom = indexTo;
        indexTo = indexTo + 1;
    end

    supportiveCoefH = abscissaAxis(indexTo) - abscissaAxis(indexTo - 1);
    coefA = ordinateAxis(indexFrom);
    coefB = ordinateAxisDiff(indexFrom);
    coefC = 1 / power(supportiveCoefH, 2) * (3 * ordinateAxis(indexTo) - 3 * ordinateAxis(indexFrom) - ...
        2 * supportiveCoefH * ordinateAxisDiff(indexFrom) - supportiveCoefH * ordinateAxisDiff(indexTo));
    coefD = 1 / power(supportiveCoefH, 3) * (2 * ordinateAxis(indexFrom) - 2 * ordinateAxis(indexTo) + ...
        supportiveCoefH * ordinateAxisDiff(indexFrom) + supportiveCoefH * ordinateAxisDiff(indexTo));
    
    result = coefA + ... 
        coefB * (x - abscissaAxis(indexFrom)) + ... 
        coefC * power((x - abscissaAxis(indexFrom)), 2) + ... 
        coefD * power((x - abscissaAxis(indexFrom)), 3);

end
