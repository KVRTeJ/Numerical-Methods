clc 
clear all

interval = [-1 1];
fun = myFunction(interval);
accuracy = 0.0005;

fun = myFunction(-1)
fun = myFunction(0)
fun = myFunction(1)

result = calculateIntegralValueBySimpson(interval(1), interval(2), accuracy);
disp(result)



