function [result, gramMatrix] = calculateByOrthogonalPolynomialDisVar(abscissaAxis, ordinateAxis, x, degree)
    lengthAbscissaAxis = length(abscissaAxis);
    lengthOrdinateAxis = length(ordinateAxis);

    if lengthOrdinateAxis ~= lengthAbscissaAxis
        error("the size of abscissa axis is not equal to the size of ordinate axis");
        return
    end

    if degree <= 0 
        error("invalid value degree. . .");
        return
    end

    if degree > lengthOrdinateAxis 
        error("invalid value degree. . .");
        return
    end

    orthogonalPolynomial = ones(lengthOrdinateAxis, degree);

    a11 = 1 / (lengthAbscissaAxis + 1) * sum(abscissaAxis, "all");

    for i = 1:1:lengthAbscissaAxis
        orthogonalPolynomial(i, 2) = abscissaAxis(i) - a11;
    end

    firstUnknownCoef = zeros(1, degree);
    secondUnknownCoef = zeros(1, degree);

    numer = 0;
    denumer = 0;
    denumer2 = 0;
    for i = 3:1:degree
        for j = 1:1:lengthAbscissaAxis
            for k = 1:1:lengthAbscissaAxis
                numer = numer + abscissaAxis(k) * power(orthogonalPolynomial(k, (i - 1) ), 2);
                denumer = denumer + power(orthogonalPolynomial(k, (i - 1) ), 2);
                denumer2 = denumer2 + power(orthogonalPolynomial(k, (i - 2) ), 2);
            end
    
            firstUnknownCoef(j) = numer / denumer;
            secondUnknownCoef(j) = denumer / denumer2;

            numer = 0;
            denumer = 0;
            denumer2 = 0;

            orthogonalPolynomial(j, i) = ( (abscissaAxis(j) - firstUnknownCoef(j)) * orthogonalPolynomial(j, i - 1) ) - ...
                (secondUnknownCoef(j) * orthogonalPolynomial(j, i - 2));
        end

    end

    % disp(firstUnknownCoef)
    % disp(secondUnknownCoef)
    % disp(orthogonalPolynomial)

    resOrthogonalPolynomial = ones(1, degree);
    resOrthogonalPolynomial(2) = x - a11;
    for i = 3:1:degree
        resOrthogonalPolynomial(i) = ( (x - firstUnknownCoef(1, i)) * resOrthogonalPolynomial(i - 1) ) - ...
                (secondUnknownCoef(1, i) * resOrthogonalPolynomial(i - 2));
    end


    % disp(orthogonalPolynomial);

    gramMatrix = zeros(degree, degree);
    for i = 1:1:degree
           for k = 1:1:lengthOrdinateAxis
               gramMatrix(i, i) = gramMatrix(i, i) + orthogonalPolynomial(k, i) * orthogonalPolynomial(k, i);
           end
    end

    freeMembers = zeros(degree, 1);
    for i = 1:1:degree
        for j = 1:1:lengthOrdinateAxis
            freeMembers(i, 1) = freeMembers(i, 1) + orthogonalPolynomial(j, i) * ordinateAxis(j) ;
        end
    end

    % disp(freeMembers);

    coef = ones(1, degree);
    for i = 1:1:degree
        for j = 1:1:lengthAbscissaAxis
            numer = numer + ordinateAxis(j) * orthogonalPolynomial(j, i);
            denumer = denumer + power(orthogonalPolynomial(j, i), 2);
        end

        coef(i) = numer / denumer;
        numer = 0;
        denumer = 0;

    end

    % coef = gramMatrix \ freeMembers;

    result = 0;
    for i = 1:1:degree
        result = result + coef(i) * resOrthogonalPolynomial(1, i);
    end


end