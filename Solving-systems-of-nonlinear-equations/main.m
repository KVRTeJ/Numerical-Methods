clc; 
clear all;

% sin(y) + 2x = 2
% cos(x - 1) + 4y = 1,5

syms x  y;
firstFun = sin(y) + 2 * x;
secondFun = cos(x - 1) + 4 * y;
accuracy = 0.5 * 10^(-4);

xRange = -pi:pi/100:pi;
% canonForm1 = -asin(2 - 2 * xRange);
% canonForm2 = (1.5 / -4*cos(xRange - 1));

canonForm1 = (2 - sin(xRange)) / 2;
canonForm2 = acos(0.7 - 3 * xRange);


figure
    plot(xRange, canonForm1,...
        'Color', '#D95319',...
        'LineStyle', '-',...
        'LineWidth', 2,...
        'Marker','.',...
        'MarkerSize', 2);
        hold on;

    plot(xRange, canonForm2,...
        'Color', '#7E2F8E',...
        'LineStyle', '-',...
        'LineWidth', 2,...
        'Marker','.',...
        'MarkerSize', 2);
        hold on;

    ylim([-1 1]);
    xlim([-2, 2]);
    title('Графический метод');






