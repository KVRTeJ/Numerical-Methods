clc 
clear all

interval = [-1 1];
fun = myFunction(interval);
accuracy = 0.0005;

[result, temp] = calculateIntegralValueBySimpson(interval(1), interval(2), accuracy);
fprintf("Значение интегралла:");
disp(result)
fprintf("Количество узлов:");
disp(temp)



