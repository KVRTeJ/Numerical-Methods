function result = cubicSpline(abscissaAxis, ordinateAxis, x)
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

    runThroughCoefE = zeros(1, lengthOrdinateAxis);
    runThroughCoefN = zeros(1, lengthOrdinateAxis);

    supportiveCoefG = 0;
    supportiveCoefH = 0;
    supportiveCoefIncH = 0;
    for i = 2:1:(lengthOrdinateAxis - 1)
        supportiveCoefH = abscissaAxis(i) - abscissaAxis(i - 1);
        supportiveCoefIncH = abscissaAxis(i + 1) - abscissaAxis(i);
        runThroughCoefE(i + 1) = -supportiveCoefIncH / (supportiveCoefH * runThroughCoefE(i) + 2 * (supportiveCoefH + supportiveCoefIncH));
        supportiveCoefG = 3 * ( (ordinateAxis(i + 1) - ordinateAxis(i))/(supportiveCoefIncH) - (ordinateAxis(i) - ordinateAxis(i - 1))/(supportiveCoefH) );
        runThroughCoefN(i + 1) = (supportiveCoefG - supportiveCoefH * runThroughCoefN(i)) / ...
            ((supportiveCoefH * runThroughCoefE(i)) + (2*(supportiveCoefH + supportiveCoefIncH)));
    end

    coefC = zeros(1, lengthOrdinateAxis + 1);
    for i = lengthOrdinateAxis:-1:3
        coefC(i) = runThroughCoefE(i) * coefC(i + 1) + runThroughCoefN(i);
    end

    supportiveCoefH = abscissaAxis(indexTo) - abscissaAxis(indexTo - 1);

    coefD = (coefC(indexTo + 1) - coefC(indexTo)) / (3 * supportiveCoefH);

    coefB = (ordinateAxis(indexTo) - ordinateAxis(indexFrom)) / supportiveCoefH - ... 
        (supportiveCoefH * (coefC(indexTo + 1) + 2 * coefC(indexTo))) / 3;

    coefA = ordinateAxis(indexFrom);
    
    result = coefA + ... 
        coefB * (x - abscissaAxis(indexFrom)) + ... 
        coefC(indexTo) * power((x - abscissaAxis(indexFrom)), 2) + ... 
        coefD * power((x - abscissaAxis(indexFrom)), 3);

end
