function [result, count]= calculateByWeightFunction(accuracy, nodesCount)
    result = 0;
    oldResult = 1;
    count = nodesCount;
    while abs(result - oldResult) > accuracy
        oldResult = result;
        result = 0;

        nodes = zeros(1, count);
        for i = 1:1:count
            nodes(i) = cos(((2 * i - 1) * pi) / (2 * count));
        end
    
        
        for i = 1:1:count
            result = result + nodes(i)^2 * log(nodes(i) + 2);
        end
        result = result * (pi / count);

        count = count + 1;
    end
end