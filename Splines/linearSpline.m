function result = linearSpline(abscissaAxis, ordinateAxis, x)
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

    coefA = ordinateAxis(indexFrom);
    coefB = (ordinateAxis(indexTo) - ordinateAxis(indexFrom)) / (abscissaAxis(indexTo) - abscissaAxis(indexFrom));

    result = coefA + coefB * (x - abscissaAxis(indexFrom));

end
