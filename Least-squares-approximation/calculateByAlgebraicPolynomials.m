function [result, gramMatrix] = calculateByAlgebraicPolynomials(abscissaAxis, ordinateAxis, x, degree)
    lengthAbscissaAxis = length(abscissaAxis);
    lengthOrdinateAxis = length(ordinateAxis);

    if lengthOrdinateAxis ~= lengthAbscissaAxis
        error("the size of abscissa axis is not equal to the size of ordinate axis");
        return
    end

    if degree < 0 
        error("invalid value degree. . .");
        return
    end

    if degree > lengthOrdinateAxis 
        error("invalid value degree. . .");
        return
    end

    gramMatrix = zeros(degree, degree);
    gramMatrix(1, 1) = lengthOrdinateAxis;

    sum = 0;
    for i = 1:1:degree
        for j = 1:1:degree
            if (i == 1) && (j == 1)
                continue;
            end

            for k = 1:1:lengthOrdinateAxis
                sum = sum + power(abscissaAxis(k), ((i - 1) + (j - 1)));
            end

            gramMatrix(j, i) = sum;
            sum = 0;
        end

    end

    freeMembers = zeros(degree, 1);
    sum = 0;
    for i = 1:1:degree
        for j = 1:1:lengthOrdinateAxis
        sum = sum + (ordinateAxis(j) * power(abscissaAxis(j), (i - 1)));
        end

        freeMembers(i, 1) = sum;
        sum = 0;
    end
    
    coef = gramMatrix \ freeMembers;

    result = 0;
    for i = 1:1:degree
        result = result + coef(i, 1) * power(x, (i - 1));
    end

end
