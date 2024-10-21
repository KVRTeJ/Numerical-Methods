clc
clear all

yAxis = [1.000 0.195 -0.332 0.849 0.182];
xAxis = [0.000 1.500 3.100 3.700 4.500];
xPoint = -0.137;
xRange = linspace(-1.000, 5.000, 10000);

interpolationPointByAitken = calculateAitkenScheme(xAxis, yAxis, xPoint);
interpolationPointByLagrange = calculateAitkenScheme(xAxis, yAxis, xPoint);

absoluteError = 0.0005;
relativeError = linspace(0, 0, length(xRange));

trueFunction = cos(xRange .* log(xRange + 1));

aitkenFunction = linspace(0, 0, length(xRange));
for i = 1:1:length(xRange)
    aitkenFunction(i) = calculateAitkenScheme(xAxis, yAxis, xRange(i));
    relativeError(i) = absoluteError / abs(aitkenFunction(i));
end

fprintf("Схема Эйткена -> %f = %f <- Аналитическое выражение многочлена Лагранжа \n", interpolationPointByAitken, interpolationPointByLagrange);

