function [result, m] = calculateByChebyshev(from, to, accuracy, valueCount)
    nodesValueCount6 = [-0.8662468 -0.4225186 -0.26663540 0.26663540 0.4225186 0.8662468];

    nodesValueCount7 = [-0.8838617 -0.5296567 -0.3239118 0.0000000 0.3239118 0.5296567 0.8838617];

    m = 1;
    result = 0; 
    oldResult = 1;
    while abs(result - oldResult) > accuracy
        oldResult = result;
        result = 0;

        m = m + 1;
       
        for j = 1:1:m
            sum = 0;
            for i = 1:1:valueCount
                if valueCount == 6
                    sum = sum + myFunction(from + (to - from) / (2 * m) * (nodesValueCount6(i) + 2 * j - 1));
                else
                    sum = sum + myFunction(from + (to - from) / (2 * m) * (nodesValueCount7(i) + 2 * j - 1));
                end
            end
            result = result + sum;
        end
        result = result * (to - from) / (valueCount * m);
    end
    
end