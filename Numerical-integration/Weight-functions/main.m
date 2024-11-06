clc 
clear all

interval = [-1 1];
fun = myFunction(interval(1));
fun = myFunction(interval(2));
accuracy = 0.0005;

value = calculateByGauss(-1, 1, accuracy, 6);
fprintf("\n%f\n", value);
value = calculateByChebyshev(-1, 1, accuracy, 6);
fprintf("\n%f\n", value);
[temp, n] = calculateByWeightFunction(accuracy, 7);
fprintf("\n%f\n", temp);
disp(n);
