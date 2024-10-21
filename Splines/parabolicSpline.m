function result = parabolicSpline(abscissaAxis, ordinateAxis, x)
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

    coefC = zeros(1, lengthAbscissaAxis);

    coefC(length(coefC)) = ( (ordinateAxis(lengthOrdinateAxis - 1) - ordinateAxis(lengthOrdinateAxis)) / ...
        (abscissaAxis(lengthOrdinateAxis) - abscissaAxis(lengthOrdinateAxis - 1)) ) / ... 
        (abscissaAxis(lengthOrdinateAxis) - abscissaAxis(lengthOrdinateAxis - 1));

    supCoefG = 0;
    for i = lengthAbscissaAxis - 1:-1:indexTo
        supCoefG = (ordinateAxis(i + 1) - ordinateAxis(i)) / (abscissaAxis(i + 1) - abscissaAxis(i)) - ... 
            (ordinateAxis(i) - ordinateAxis(i - 1)) / (abscissaAxis(i) - abscissaAxis(i - 1));

        coefC(i) = (supCoefG - coefC(i + 1) * (abscissaAxis(i + 1) - abscissaAxis(i))) / ... 
            (abscissaAxis(i) - abscissaAxis(i - 1));
    end

    supportiveCoefH = abscissaAxis(indexTo) - abscissaAxis(indexFrom);
    coefB = (ordinateAxis(indexTo) - ordinateAxis(indexFrom)) / supportiveCoefH - ... 
        supportiveCoefH * coefC(indexTo);

    coefA = ordinateAxis(indexFrom);

    result = coefA + coefB * (x - abscissaAxis(indexFrom)) + coefC(indexTo) * power((x - abscissaAxis(indexFrom)), 2) ;

end
