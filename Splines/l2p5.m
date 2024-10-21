clc
clear all

yAxis = [1.000 0.195 -0.332 0.849 0.182];
xAxis = [0.000 1.500 3.100 3.700 4.500];
xRange = linspace(xAxis(1), xAxis(length(xAxis)), 10000);
trueFunction = cos(xRange .* log(xRange + 1));

linearSplineFunc = zeros(1, length(xRange));
parabolicSplineFunc = zeros(1, length(xRange));
cubicSplineFunc = zeros(1, length(xRange));
hermitovSplineFunc = zeros(1, length(xRange));

yAxisDiff = zeros(1, length(yAxis));
for i = 1:1:length(yAxisDiff)
    yAxisDiff(i) = - (log(xAxis(i) + 1) + xAxis(i) / (xAxis(i) + 1) ) * sin(xAxis(i) * log(xAxis(i) + 1));
end

fprintf("y' ->");
for i = 1:1:length(yAxis)
        fprintf(" %f", yAxisDiff(i));
end
fprintf("\n");


for i = 1:1:length(xRange)
    linearSplineFunc(i) = linearSpline(xAxis, yAxis, xRange(i));
    parabolicSplineFunc(i) = parabolicSpline(xAxis, yAxis, xRange(i));
    cubicSplineFunc(i) = cubicSpline(xAxis, yAxis, xRange(i));
    hermitovSplineFunc(i) = hermitovSpline(xAxis, yAxis, yAxisDiff, xRange(i));
end

figure("Name", "Сплайны", "NumberTitle", "off")
    plot(xRange, linearSplineFunc, Color="#0072BD", LineWidth=2);
    grid on;
    hold on;

    plot(xRange, parabolicSplineFunc, LineStyle=":", Color="#D95319", LineWidth=2);
    hold on;

    plot(xRange, cubicSplineFunc, LineStyle="-", Color="#EDB120", LineWidth=2);
    hold on;

    plot(xRange, hermitovSplineFunc, LineStyle="-", Color="#77AC30", LineWidth=2);
    hold on;

    plot(xRange ,trueFunction, LineStyle="--", LineWidth=2, Color="black");
    hold on;

    plot(xAxis, yAxis, "o", Color="black", LineWidth=2, MarkerSize=7.5)
    hold on;

    legend("Линейный сплайн", ...
        "Параболический сплайн", ...
        "Кубический сплайн", ...
        "Эрмитов сплайн", ...
        "Истинная функция", ...
        "Исходные данные", ...
        "Box", "off")


