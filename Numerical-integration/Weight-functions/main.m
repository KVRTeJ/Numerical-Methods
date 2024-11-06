clc 
clear all

interval = [-1 1];
accuracy = 0.0005;

value = calculateByGauss(-1, 1, accuracy, 7);
fprintf("\nЗначение интеграла вычесленное с помощью медота Гаусса: %f\n", value);
value = calculateByChebyshev(-1, 1, accuracy, 7);
fprintf("Значение интеграла вычесленное с помощью метода Чебышева: %f\n", value);
fprintf("\n")
[temp, n] = calculateByWeightFunction(accuracy, 7);
fprintf("Значение интеграла вычесленное с помощью частного случая квадратурной формулы(p(x) = sqrt(1 - x^2)): %f\n", temp);
fprintf("Количество узлов: %d\n", n);

