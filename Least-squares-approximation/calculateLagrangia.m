function [result, phi] = calculateLagrangia(abscissaAxis, ordinateAxis, x)
    lengthAbscissaAxis = length(abscissaAxis);
    lengthOrdinateAxis = length(ordinateAxis);

    if lengthOrdinateAxis ~= lengthAbscissaAxis
        error("the size of abscissa axis is not equal to the size of ordinate axis");
        return
    end

    result = 0;

    phi = linspace(1, 1, lengthOrdinateAxis);
    for j = 1:1:lengthOrdinateAxis
        for i = 1:1:lengthOrdinateAxis
            if i == j
                continue
            end
    
            phi(j) = phi(j) * (x - abscissaAxis(i)) / ...
            (abscissaAxis(j) - abscissaAxis(i));
        end

        result = result + ordinateAxis(j) * phi(j);
    end

end

