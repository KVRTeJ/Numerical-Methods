clc
clear all

yAxis = [1.000 0.195 -0.332 0.849 0.182];
xAxis = [0.000 1.500 3.100 3.700 4.500];
xPoint = -0.137;
xRange = linspace(-1.000, 5.000, 10000);

[interpolationPoint, phi] = calculateLagrangia(xAxis, yAxis, xPoint);
absoluteError = 0.0005 * sum(phi, "all");

trueFunction = cos(xRange .* log(xRange + 1));

lagrangeFunction = linspace(0, 0, length(xRange));
relativeError = linspace(0, 0, length(xRange));
for i = 1:1:length(xRange)
    lagrangeFunction(i) = calculateLagrangia(xAxis, yAxis, xRange(i));
    relativeError(i) = absoluteError / abs(lagrangeFunction(i));
end

relativeErrorPoint = absoluteError / abs(calculateLagrangia(xAxis, yAxis, xPoint));
disp(relativeErrorPoint);

figure
    tiledlayout(2, 1);
    xlabel("abscyssa");
    ylabel("ordinate");
    mainTitle = nexttile;
    plot(xRange, trueFunction, LineStyle="--", LineWidth=2, Color="blue");
    title(mainTitle, "Функции");
    grid on;
    hold on;

    plot(mainTitle, xRange, lagrangeFunction, LineStyle="-", LineWidth=1.5, Color="red");
    ylim([-3 3]);
    hold on;

    plot(mainTitle, xAxis, yAxis, "ko", LineWidth=2, MarkerSize=7);
    hold on;

    plot(mainTitle, xPoint, interpolationPoint, "k*", LineWidth=1, MarkerSize=10);
    hold on;

    plot(mainTitle, xRange, relativeError, Color="magenta");
    hold on;

    legend("Истинная функция", ...
        "Многочлен Лагранжа", ...
        "Узлы интерполирования", ...
        "Точка экстраполирования", ...
        "Отностиельная погрешность");



    relativeErrorTitle = nexttile;
    plot(relativeErrorTitle, xRange, relativeError, Color="magenta");
    title(relativeErrorTitle, "Относительная погрешность");
    ylim([0 0.003]);
    hold on;



