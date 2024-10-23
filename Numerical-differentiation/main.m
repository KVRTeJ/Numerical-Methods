clear all
clc

yAxis = [1.000 0.195 -0.332 0.849 0.182];
xAxis = [0.000 1.500 3.100 3.700 4.500];
xPoint = -0.137;

yAxisDiff = zeros(1, length(xAxis));
yAxisDiffTwice = zeros(1, length(xAxis));
for i = 1:1:length(xAxis)
    yAxisDiff(i) = -(log(xAxis(i) + 1) + xAxis(i) / (xAxis(i) + 1) ) * sin(xAxis(i) * log(xAxis(i) + 1));
    yAxisDiffTwice(i) = -((xAxis(i)+1)*((log(xAxis(i)+1)+2)*sin(xAxis(i)*log(xAxis(i)+1))+(log(xAxis(i)+1)+xAxis(i)/(xAxis(i)+1))*((xAxis(i)+1)*log(xAxis(i)+1)+xAxis(i))*cos(xAxis(i)*log(xAxis(i)+1)))-((xAxis(i)+1)*log(xAxis(i)+1)+xAxis(i))*sin(xAxis(i)*log(xAxis(i)+1)))/(((xAxis(i)+1))^2);
end

yPointDiff = - (log(xPoint + 1) + xPoint / (xPoint + 1) ) * sin(xPoint * log(xPoint + 1));
yPointDiffInter = calculateNewtonDiff(xAxis, yAxis, xPoint);
xRange = linspace(-1.000, 5.000, 10000);

[~, absoluteError] = calculateNewtonDiff(xAxis, yAxis, xPoint);

relativeErrorFirst = zeros(1, length(xRange));
relativeErrorSecond = zeros(1, length(xRange));
yRangeTrueDiff = zeros(1, length(xRange));
yRangeInterDiff = zeros(1, length(xRange));

yRangeTrueDiffTwice = zeros(1, length(xRange));
yRangeInterDiffTwice = zeros(1, length(xRange));
for i = 1:1:length(xRange)
    yRangeTrueDiff(i) = - (log(xRange(i) + 1) + xRange(i) / (xRange(i) + 1) ) * sin(xRange(i) * log(xRange(i) + 1));
    [yRangeInterDiff(i), temp] = calculateNewtonDiff(xAxis, yAxis, xRange(i));
    relativeErrorFirst(i) = abs(absoluteError) / abs(yRangeInterDiff(i));
    

    % yRangeTrueDiffTwice(i) = - ( ((xRange(i) + 1) * ( (log(xRange(i) + 1) + 1) * sin(xRange(i) * log(xRange(i) + 1)) + ...
    %     ( log(xRange(i) + 1) + (xRange(i))/(xRange(i) + 1) ) * ((xRange(i) + 1) * log(xRange(i) + 1) + xRange(i))...
    %     * cos(xRange(i) * log(xRange(i) + 1))) - ((xRange(i) + 1) * log(xRange(i) + 1) + xRange(i)) * sin(xRange(i) * log(xRange(i) + 1))  ) ...
    %     / (power((xRange(i) + 1), 2)) );
    yRangeTrueDiffTwice(i) = -((xRange(i)+1)*((log(xRange(i)+1)+2)*sin(xRange(i)*log(xRange(i)+1))+(log(xRange(i)+1)+xRange(i)/(xRange(i)+1))*((xRange(i)+1)*log(xRange(i)+1)+xRange(i))*cos(xRange(i)*log(xRange(i)+1)))-((xRange(i)+1)*log(xRange(i)+1)+xRange(i))*sin(xRange(i)*log(xRange(i)+1)))/(((xRange(i)+1))^2);
    yRangeInterDiffTwice(i) = calculateNewtonDiffTwice(xAxis, yAxis, xRange(i));
    relativeErrorSecond(i) = abs(absoluteError) / abs(yRangeInterDiffTwice(i));
end

relativeErrorYPoint = abs(absoluteError) / abs(yPointDiffInter);
fprintf("Истинное значение первой производной: %f\n", yPointDiff);
fprintf("Численное значение первой производной: %f\n", yPointDiffInter);
fprintf("Абсолютная погрешность: %f\n", abs(absoluteError));
fprintf("Относительная погрешность в точке x = -0.137: %f\n", relativeErrorYPoint);

figure
    firstDiff = nexttile;
    plot(xRange, yRangeTrueDiff, Color="blue", LineWidth=1.2, LineStyle="--")
    title("Численное дифференцироввание первого порядка")
    hold on;
    grid on;
    ylim([-5;5])
    xlim([-1;4.5]);
    
    plot(xRange, yRangeInterDiff, Color="black", LineWidth=1.2)
    hold on;

    plot(xRange, relativeErrorFirst, Color="red");
    hold on;
    
    plot(xAxis, yAxisDiff, "ko", MarkerSize=7)
    hold on;


    secondDiff = nexttile;
    plot(xRange, yRangeTrueDiffTwice, Color="blue", LineWidth=1.2, LineStyle="--");
    title("Численное дифференцироввание второго порядка")
    hold on;
    grid on;
    ylim([-5;5])
    xlim([-1;4.5]);

    plot(xRange, yRangeInterDiffTwice, Color="black", LineWidth=1.2);
    hold on;

    plot(xRange, relativeErrorSecond, Color="red");
    hold on;

    plot(xAxis, yAxisDiffTwice, "ko", MarkerSize=7)
    hold on;


