function [result, steps] = newtonMethod(system, yakobiMatrix, initialApproximation, accuracy)
    prevResult = initialApproximation - yakobiMatrix(res_p) ^ (-1) * system(initialApproximation); 

    result = prevResult -  yakobiMatrix(prevResult) ^ (-1) * system(prevResult); 
end