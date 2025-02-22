clc 
clear all

interval = [-1 1];
fun = myFunction(interval);
accuracy = 0.0005;

[temp, m] = calculateByGauss(interval(1), interval(2), accuracy, 6);
fprintf("\n%f\n", temp);
disp(m)

[temp, m] = calculateByChebyshev(interval(1), interval(2), accuracy, 6);
fprintf("\n%f\n", temp);
disp(m)
