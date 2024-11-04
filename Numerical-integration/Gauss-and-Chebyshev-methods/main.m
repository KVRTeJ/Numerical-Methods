clc 
clear all

interval = [-1 1];
fun = myFunction(interval);
accuracy = 0.0005;

temp = calculateByGauss(interval(1), interval(2), accuracy, 6);
disp(temp) 
