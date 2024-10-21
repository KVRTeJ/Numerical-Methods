clc
clear all

yAxis = [1.000 0.195 -0.332 0.849 0.182];
xAxis = [0.000 1.500 3.100 3.700 4.500];
xPoint = -0.137;
xRange = linspace(-1.000, 5.000, 10000);


[interpolationPoint, splitDifference] = calculateNewtonFormula(xAxis, yAxis, xPoint);
lastSplitDifference = splitDifference(1, length(xAxis) - 1);
composition = 1;
for i = 1:1:length(xAxis)
    composition = composition * (xPoint - xAxis(i));
end
residualMember = lastSplitDifference * composition;
methodError = abs(residualMember);

fprintf("Значение многочлена Ньютона в точке -0.137: %0.4f\n", interpolationPoint);
fprintf("Погрешность метода в точке -0.137: %f\n", methodError);

compositionInRange = linspace(1, 1, length(xRange));
methodErrorInRange = linspace(0, 0, length(xRange));
for j = 1:1:length(compositionInRange)
    for i = 1:1:length(xAxis)
        compositionInRange(j) = compositionInRange(j) * (xRange(j) - xAxis(i));
    end
    methodErrorInRange(j) = abs(lastSplitDifference) * abs(compositionInRange(j));
end

[temp, phi] = calculateLagrangia(xAxis, yAxis, xPoint);
absoluteError = 0;
for i = 1:1:(length(xAxis) - 1)
    absoluteError = absoluteError + abs(splitDifference(1, i));
end
absoluteError = absoluteError + abs(yAxis(1));

absoluteError = absoluteError * 0.0005;
relativeError = linspace(0, 0, length(xRange));

trueFunction = cos(xRange .* log(xRange + 1));

newtonFormula = linspace(0, 0, length(xRange));
for i = 1:1:length(xRange)
    newtonFormula(i) = calculateNewtonFormula(xAxis, yAxis, xRange(i));
    relativeError(i) = absoluteError / abs(newtonFormula(i));
end

figure
    tiledlayout(2, 1);
    xlabel("abscyssa");
    ylabel("ordinate");
    mainTitle = nexttile;
    plot(xRange, trueFunction, LineStyle="--", LineWidth=2, Color="blue");
    title(mainTitle, "Функции");
    grid on;
    hold on;

    plot(mainTitle, xRange, newtonFormula, LineStyle="-", LineWidth=1.5, Color="red");
    ylim([-3 3]);
    hold on;

    plot(mainTitle, xAxis, yAxis, "ko", LineWidth=2, MarkerSize=7);
    hold on;

    plot(mainTitle, xPoint, interpolationPoint, "k*", LineWidth=1, MarkerSize=10);
    hold on;

    plot(mainTitle, xRange, methodErrorInRange, Color="magenta");
    hold on;

    plot(mainTitle, xRange, relativeError, Color="#A2142F");
    hold on;

    legend("Истинная функция", ...
        "Многочлен Ньютона", ...
        "Узлы интерполирования", ...
        "Точка экстраполирования", ...
        "Погрешность метода", ...
        "Относительная погрешность");

    relativeErrorTitle = nexttile;
    plot(relativeErrorTitle, xRange, relativeError, Color="#A2142F");
    title(relativeErrorTitle, "Относительная погрешность");
    ylim([0 0.003]);
    hold on;
