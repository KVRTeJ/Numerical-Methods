function [result, nodeCount] = calculateIntegralValueBySimpson(from, to, accuracy)
    result = 1; %this function can be passed through arguments if there is a Symbolic Math Toolbox
    segmentCount = 2;
    dataResult = 0;
    nodeCount = segmentCount + 1;

    sumEven = 0;
    sumOdd = 0;
    coef = 0; % (b - a) / (3 * m)
    leftHandSide = myFunction(from);
    rightHandSide = myFunction(to);
    while abs((result - dataResult) / 15) > accuracy%FIXME
        step = (to - from) / segmentCount;

        sumEven = sumEven + sumOdd;
        for i = (from + step):(2 * step):(to - step)
            sumOdd = sumOdd + myFunction(i);
        end
        
        coef = (to - from) / (3 * segmentCount);
        dataResult = result;
        result = coef * (leftHandSide + rightHandSide + 2 * sumEven + 4 * sumOdd);
        nodeCount = segmentCount;

        sumOdd = 0;
        segmentCount = segmentCount * 2
    end
end