clear all
clc

y = [1.257 1.524 1.728 1.849 1.867 1.768 1.547 1.215 0.798 0.339 -0.104];
x = [1 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2.0];
z = 1.92;

xStep = 0.1;

[ordinateForZ, trueDegree] = newtonFormEquidistantNodes(x, y, z, xStep);

absoluteError = power(2, trueDegree) * 0.0005;
relativeError = absoluteError / abs(ordinateForZ);

fprintf("Абсолютная погрешность - %f\n", absoluteError);
fprintf("Относительная погрешность - %f\n", relativeError);

figure
    plot(x, y, 'ro');
    hold on;

    plot(z, ordinateForZ, '+', Color='black');
    hold on;