clc; 
clear all;

% sin(y) + 2x = 2
% cos(x - 1) + 4y = 1,5

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


disp(x);
disp(y);
disp(steps);

res = secondFun(x, y);
disp(res);

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






