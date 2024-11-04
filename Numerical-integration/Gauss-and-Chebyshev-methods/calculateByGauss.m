function [result, m] = calculateByGauss(from, to, accuracy, valueCount)
    coefsCount6 = [0.1713244 0.3607615 0.4679139 0.4679139 0.3607615 0.1713244];
    nodesValueCount6 = [-0.9324695 -0.6612093 -0.2386191 0.2386191 0.6612093 0.9324695];

    coefsCount7 = [0.1294849 0.2797053 0.3818300 0.4179591 0.3818300 0.2797053 0.1294849];
    nodesValueCount7 = [-0.9491079 -0.7415311 -0.4058451 0.0000000 0.4058451 0.7415311 0.9491079];

    result = 0; 
    oldResult = -1;
    while abs(result - oldResult) <= accuracy %FIXME: 

        m = m + 1;
        
        for j = 1:1:m
            sum = 0;
            for i = 1:1:valueCount
                if valueCount == 6
                    sum = sum + coefsCount6(i) * myFunction(from + (to - from) / (2 * m) * (nodesValueCount6(i) + 2 * j - 1));
                else
                    sum = sum + coefsCount7(i) * myFunction(from + (to - from) / (2 * m) * (nodesValueCount7(i) + 2 * j - 1));
                end
            end
            result = result + sum;
        end
        oldResult = result;
        result = result * (to - from) / (2 * m);
    end
    
end