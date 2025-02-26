function [result, steps] = newtonMethod(system, yakobiMatrix, initialApproximation, accuracy)
    prevResult = [0, 0];
    result = [0, 0];

    invertedYakobiMatrix = @(x, y) yakobiMatrix(x, y) ^ (-1);

    currentIVM = invertedYakobiMatrix(initialApproximation(1), initialApproximation(2));
    currentSystem = system(initialApproximation(1), initialApproximation(2));
    prevResult(1) = initialApproximation(1) - currentIVM(1, 1) * currentSystem(1) - currentIVM(1, 2) * currentSystem(2);
    prevResult(2) = initialApproximation(2) - currentIVM(2, 1) * currentSystem(1) - currentIVM(2, 2) * currentSystem(2);

    currentIVM = invertedYakobiMatrix(prevResult(1), prevResult(2));
    currentSystem = system(prevResult(1), prevResult(2));
    result(1) = prevResult(1) - currentIVM(1, 1) * currentSystem(1) - currentIVM(1, 2) * currentSystem(2);
    result(2) = prevResult(2) - currentIVM(2, 1) * currentSystem(1) - currentIVM(2, 2) * currentSystem(2);

    steps = 1;

    while(max(abs(result(1) - prevResult(1)), abs(result(2)) - prevResult(2)) >= accuracy)
        prevResult = result;

        currentIVM = invertedYakobiMatrix(prevResult(1), prevResult(2));
        currentSystem = system(prevResult(1), prevResult(2));
        result(1) = prevResult(1) - currentIVM(1, 1) * currentSystem(1) - currentIVM(1, 2) * currentSystem(2);
        result(2) = prevResult(2) - currentIVM(2, 1) * currentSystem(1) - currentIVM(2, 2) * currentSystem(2);

        steps = steps + 1;
    end
    
end