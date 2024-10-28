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

        sumOdd = sumOdd + sumEven;
        for j = (from + step):(step * 2):(to - step * 2)
            disp(j)
            sumEven = sumEven + myFunction(j);
        end
        
        coef = (to - from) / (3 * segmentCount);
        dataResult = result;
        result = coef * (leftHandSide + rightHandSide + sumEven + sumOdd);
        nodeCount = segmentCount + 1;

        sumEven = 0;
        segmentCount = segmentCount * 2
    end
end