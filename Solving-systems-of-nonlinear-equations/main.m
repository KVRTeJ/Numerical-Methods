clc; 
clear all;

% sin(y) + 2x = 2
% cos(x - 1) + 4y = 1,5

fprintf("Исходная функция: \n")
fprintf("sin(y) + 2 * x - 2 = 0\n");
fprintf("cos(x - 1) + 4 * y - 1.5 = 0\n\n");

firstFun = @(x, y) sin(y) + 2 * x - 2;
secondFun = @(x, y) cos(x - 1) + 4 * y - 1.5;
accuracy = 0.5 * 10^(-5);

xRange = -pi:pi/100:pi;
forInitialApproximation = -asin(2 - 2 * xRange);
forInitialApproximation2 = (1.5/4 * (-cos(xRange - 1)/4));

initialApproximation = [0.95 -0.09];

canonForm1 = @(x, y) 1 - sin(y) /2;
canonForm2 = @(x, y) (1.5 - cos(x - 1)) / 4;

    [x, y, steps] = simpleIterations(canonForm1, canonForm2, initialApproximation, accuracy);
    fprintf("Метод простых итераций\n");
    fprintf("Начальное приближение (0,95;-0,09)\n");
    fprintf("Точность %f\n", accuracy);
    fprintf("Количетсво итераций - %d\n", steps);
    
    res1 = firstFun(x, y);
    res2 = secondFun(x, y);
    fprintf("Результат: (%f;%f)\n", x, y);
    
    fprintf("Проверка: \n");
    fprintf("sin(%f) + 2 * %f - 2 = %f\n", y, x, res1);
    fprintf("cos(%f - 1) + 4 * %f - 1.5 = %f\n\n", x, y, res2);



figure
    plot(xRange, forInitialApproximation,...
        'Color', '#D95319',...
        'LineStyle', '-',...
        'LineWidth', 2,...
        'Marker','.',...
        'MarkerSize', 2);
        hold on;

    plot(xRange, forInitialApproximation2,...
        'Color', '#7E2F8E',...
        'LineStyle', '-',...
        'LineWidth', 2,...
        'Marker','.',...
        'MarkerSize', 2);
        hold on;

        plot(0.95, -0.09, ...
            'MarkerSize', 10,...
            'Marker','*',...
            'Color', 'k');

    % ylim([-1 1]);
    xlim([-1, 1]);
    title('Графический метод');






