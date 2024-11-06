clc 
clear all

interval = [-1 1];
accuracy = 0.005;


[result, size] = simplestMethod(interval(1), interval(2), accuracy);
fprintf("Значение интеграла при вычислении простейшим методом: %.4f\n", result);
fprintf("n = %d\n", size);

fprintf("\n")

[result, size] = geometricMethod(interval(1), interval(2), accuracy);
fprintf("Значение интеграла при вычислении геометрическим методом: %.4f\n", result);
fprintf("n = %d\n", size);

