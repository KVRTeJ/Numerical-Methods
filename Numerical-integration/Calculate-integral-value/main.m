clc 
clear all

interval = [-1 1];
fun = myFunction(interval);
accuracy = 0.0005;

disp(myFunction(-4/4));
disp(myFunction(-3/4));
disp(myFunction(-2/4));
disp(myFunction(-1/4));
disp(myFunction(0));
disp(myFunction(1/4));
disp(myFunction(2/4));
disp(myFunction(3/4));
disp(myFunction(1));

[result, temp] = calculateIntegralValueBySimpson(interval(1), interval(2), accuracy);
disp(result)
disp(temp)



