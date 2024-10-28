function [result, nodeCount] = calculateIntegralValueBySimpson(from, to, accuracy)
    x = 0;
    result = myFunction(x); %this function can be passed through arguments if there is a Symbolic Math Toolbox
    segmentCount = 2;

    leftHandSide = myFunction(from);
    rightHandSide = myFunction(to);
    coef = 0; % (b - a) / (3 * m)
    sumEven = 0;
    sumOdd = 0;
    for i = 2:1:segmentCount
        step = (to - from) / segmentCount;

        %TODO: loop for sum odd
        for j = (from + step * 2):(step * 2):(to - step)
            sumOdd = sumOdd + myFunction(j);
        end
        %TODO: loop for sum even
        for j = (from + step):(step * 2):(to - step * 2)
            sumEven = sumEven + myFunction(j);
        end
        
        coef = (to - from) / (3 * segmentCount);
        result = coef * (leftHandSide + rightHandSide + sumEven + sumOdd);
        nodeCount = segmentCount + 1;
    end
end