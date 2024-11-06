function [integralValue, size] = simplestMethod(from, to, accuracy)

    size = 1000;

    epsilon = from + (to - from) * rand(size, 1);
    eta = myFunction(epsilon);

    integralValue = (to - from) / size * sum(eta);
    dispersion = (to - from) ^ 2 / size * sum(eta.^2) - integralValue ^ 2;

    sizeStep = 1000;
    oldIntegralValue = 0;
    while 3 * sqrt(dispersion / size) > accuracy
        epsilon = from + (to - from) * rand(sizeStep, 1);
        eta = myFunction(epsilon);

        oldIntegralValue = integralValue;
        integralValue = 1 / (size + sizeStep) * (size * integralValue + (to - from) * sum(eta))
        dispersion = 1 / (size + sizeStep) * (size * dispersion + size * oldIntegralValue^2 + (to - from)^2 * sum(eta.^2)) - integralValue ^ 2;

        size = size + sizeStep;
    end
end