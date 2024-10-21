function [result, gramMatrix] = temp(abscissaAxis, ordinateAxis, x, degree)
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

    min = abscissaAxis(1);
    max = abscissaAxis(lengthAbscissaAxis);
    newAbscissaAxis = linspace(0, 0, lengthAbscissaAxis);
    for i = 1:1:lengthAbscissaAxis
        newAbscissaAxis(i) = 2 * ( (abscissaAxis(i) - min) / (max - min) ) - 1;
    end

    newX = ( 2* (x - min) / (max - min) ) - 1;

    resOrthogonalPolynomial = ones(1, degree);
    resOrthogonalPolynomial(1, 2) = newX;
    for i = 3:1:degree
                resOrthogonalPolynomial(1, i) = ...
                    ( ((2*(i - 2) + 1) * newX * resOrthogonalPolynomial(1, i - 1)) + ...
                    ((i - 2) * resOrthogonalPolynomial(1, i - 2)) ) / (i - 1);

    end


    orthogonalPolynomial = ones(lengthOrdinateAxis, degree);
    for i = 1:1:lengthOrdinateAxis
        orthogonalPolynomial(i, 2) = newAbscissaAxis(i);
    end
    for i = 3:1:degree
        for j = 1:1:lengthOrdinateAxis
                orthogonalPolynomial(j, i) = ...
                    ( ((2*(i - 2) + 1) * newAbscissaAxis(j) * orthogonalPolynomial(j, i - 1)) + ...
                    ((i - 2) * orthogonalPolynomial(j, i - 2)) ) / (i - 1);
        end

    end

    % disp(orthogonalPolynomial);

    gramMatrix = zeros(degree, degree);
    for i = 1:1:degree
        for j = 1:1:degree
           for k = 1:1:lengthOrdinateAxis
               gramMatrix(j, i) = gramMatrix(j, i) + orthogonalPolynomial(k, i) * orthogonalPolynomial(k, j);
           end

        end

    end

    freeMembers = zeros(degree, 1);
    for i = 1:1:degree
        for j = 1:1:lengthOrdinateAxis
            freeMembers(i, 1) = freeMembers(i, 1) + orthogonalPolynomial(j, i) * ordinateAxis(j); 
        end
    end

    % disp(freeMembers);

    coef = gramMatrix \ freeMembers;

    result = 0;
    for i = 1:1:degree
        result = result + coef(i, 1) * resOrthogonalPolynomial(i);
    end
    
end
