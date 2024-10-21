function result = calculateAitkenScheme(abscissaAxis, ordinateAxis, x)
    lengthAbscissaAxis = length(abscissaAxis);
    lengthOrdinateAxis = length(ordinateAxis);

    if lengthOrdinateAxis ~= lengthAbscissaAxis
        error("the size of abscissa axis is not equal to the size of ordinate axis");
        return
    end

    result = 0;

    matrixSize = lengthOrdinateAxis - 1;
    polynominalSequence = zeros(matrixSize, matrixSize);
    for i = 1:1:(lengthAbscissaAxis - 1)
        polynominalSequence(i, 1) = ( (ordinateAxis(i)) * (abscissaAxis(i + 1) - x) - ... 
            (abscissaAxis(i) - x) * ordinateAxis(i + 1) ) / ...
        (abscissaAxis(i + 1) - abscissaAxis(i));
    end

    for i = 2:1:matrixSize
        start = 1;
        for j = i:1:matrixSize

            polynominalSequence(j, i) = ...
                ( (polynominalSequence((j - 1), (i - 1)) * (abscissaAxis(j + 1) - x)) - ... 
                ((abscissaAxis(start) - x) * (polynominalSequence(j, (i - 1)))) ) / ...
                (abscissaAxis(j + 1) - abscissaAxis(start));


            start = start + 1;
        end

    end

    result = polynominalSequence(matrixSize, matrixSize);
end