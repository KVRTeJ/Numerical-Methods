function [result, count]= calculateByWeightFunction(accuracy, nodesCount)
    result = 0;
    oldResult = 1;
    count = nodesCount;
    while abs(result - oldResult) > accuracy
        oldResult = result;
        result = 0;

        nodes = zeros(1, count);
        coefs = zeros(1, count);
        for i = 1:1:count
            nodes(i) = cos((i * pi) / (count + 1));
            coefs(i) = (pi / (count + 1)) * power(sin((i * pi) / (count + 1)), 2);
        end
    
        
        for i = 1:1:count
            result = result + nodes(i)^2 * log(nodes(i) + 2) * coefs(i);
        end

        count = count + 1;
    end
end