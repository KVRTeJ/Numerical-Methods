clc 
clear all

interval = [-1 1];
fun = myFunction(interval);
accuracy = 0.0005;

calculateIntegralValueBySimpson(interval(1), interval(2), accuracy);

x = 0;
fun = calculateIntegralValueBySimpson(x);
disp(fun)
x = 1;
fun = x^2 * log(x + 2);
disp(fun)



