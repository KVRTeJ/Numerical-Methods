clear all
clc

x = [0 0.5 1];
y = [1.5 1.1 1.7];

temp = calculateNewtonDiff(x, y, 1);
disp(temp)

% yAxis = [1.000 0.195 -0.332 0.849 0.182];
% xAxis = [0.000 1.500 3.100 3.700 4.500];
% xPoint = -0.137;
% xRange = linspace(xAxis(1), xAxis(length(xAxis)), 10000);
% trueFunction = cos(xRange .* log(xRange + 1));
% 
% yAxisDiff = zeros(1, length(yAxis));
% for i = 1:1:length(yAxisDiff)
%     yAxisDiff(i) = - (log(xAxis(i) + 1) + xAxis(i) / (xAxis(i) + 1) ) * sin(xAxis(i) * log(xAxis(i) + 1));
% end
% 
% fprintf("y' ->");
% for i = 1:1:length(yAxis)
%         fprintf(" %f", yAxisDiff(i));
% end
% fprintf("\n");
% 
% 
% 
% temp = calculateNewtonDiff(xAxis, yAxis, 3.7);
% disp(temp)
% 
% 
% figure
%     plot(xAxis, yAxis)
%     hold on
% 
%     plot(xRange, yRange, LineWidth=1.5)