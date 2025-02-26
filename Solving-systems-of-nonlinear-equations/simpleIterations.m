function [x, y, steps] = simpleIterations(canonForm1, canonForm2, initialApproximation, accuracy)
    prevX = canonForm1(initialApproximation(1), initialApproximation(2));
    prevY = canonForm2(initialApproximation(1), initialApproximation(2));

    x = canonForm1(prevX, prevY);
    y = canonForm2(prevX, prevY);

    steps = 1;
    while(max(abs(x - prevX), abs(y - prevY)) >= accuracy)
        prevX = x;
        prevY = y;
        x = canonForm1(prevX, prevY);
        y = canonForm2(prevX, prevY);
        steps = steps + 1;
    end
end