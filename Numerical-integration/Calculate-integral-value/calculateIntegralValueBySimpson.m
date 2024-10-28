function [result, nodeCount] = calculateIntegralValueBySimpson(from, to, accuracy)
    x = 0;
    result = myFunction(x); %this function can be passed through arguments if there is a Symbolic Math Toolbox
    segmentCount = 4;

    coef = 0; % (b - a) / (3 * m)
    sumEven = 0;
    sumOdd = 0;
    for i = 2:1:segmentCount
        step = (to - from) / segmentCount;

        %TODO: loop for odd
        %TODO: loop for even

        coef = (to - from) / (3 * segmentCount);
        result = coef * (myFunction(from) + myFunction(to) + sumEven + sumOdd);
        nodeCount = segmentCount + 1;
    end
end