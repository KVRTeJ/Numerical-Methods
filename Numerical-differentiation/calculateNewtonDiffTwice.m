function result = calculateNewtonDiffTwice(abscissaAxis, ordinateAxis, x)
    splitDifference = getSplitDifference(abscissaAxis, ordinateAxis);

    coef = zeros(1, length(ordinateAxis) - 1 );
    for i = 1:1:length(coef)
        coef(i) = (x - abscissaAxis(i));
    end
    
end