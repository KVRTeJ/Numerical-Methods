clc;
clear all;

% 2.75x1 - 0.59x2 - 0.79x3 - 0.35x4 = 7.88
% -0.59x1 + 4.85x2 + 0.71x3 + 0.81x4 = -13.84
% -0.79x1 + 0.71x2 + 3.25x3 + 0.32x4 = -18.46
% -0.35x1 + 0.81x2 + 0.32x3 + 3.33x4 = -3.57

A = [
    2.75 -0.59 -0.79 -0.35;
    -0.59 4.85 0.71 0.81;
    -0.79 0.71 3.25 0.32;
    -0.35 0.81 0.32 3.33; 
    ];

% для нерегулярного случая в методе Данилевского
B = [ 
    1, 2, 0; 
    2, 3, 0;
    3, 4, 5;
    ];

fprintf("Метод Данилевского, нерегулярный случай\n");
[ values, vectors ] = danilevskyMethod(B);
fprintf("  Собственные значения:\n")
disp(values');
fprintf("  Собственные векторы:\n")
disp(vectors);
fprintf("  Проверка:\n")
check = B * vectors - vectors * diag(values);
fprintf("Ax - lx = ");
fprintf(" %.5f ", check);
fprintf("\n\n");

fprintf("Метод Данилевского, регулярный случай\n");
[ values, vectors ] = danilevskyMethod(A);
fprintf("  Собственные значения:\n")
disp(values');
fprintf("  Собственные векторы:\n")
disp(vectors);
fprintf("  Проверка:\n")
check = A * vectors - vectors * diag(values);
fprintf("Ax - lx = ");
fprintf(" %.5f ", check);
fprintf("\n\n");

fprintf("Метод Фаддеева\n");
[ values, vectors ] = faddeevMethod(A);
fprintf("  Собственные значения:\n")
disp(values');
fprintf("  Собственные векторы:\n")
disp(vectors);
fprintf("  Проверка:\n")
check = A * vectors - vectors * diag(values);
fprintf("Ax - lx = ");
fprintf(" %.5f ", check);
fprintf("\n\n");

fprintf("Метод Крылова\n");
[ values, vectors ] = krylovMethod(A);
fprintf("  Собственные значения:\n")
disp(values');
fprintf("  Собственные векторы:\n")
disp(vectors);
fprintf("  Проверка:\n")
check = A * vectors - vectors * diag(values);
fprintf("Ax - lx = ");
fprintf(" %.5f ", check);
fprintf("\n\n");

fprintf("Метод Леверье\n");
[ values, vectors ] = leverrierMethod(A);
fprintf("  Собственные значения:\n")
disp(values');
fprintf("  Собственные векторы:\n")
disp(vectors);
fprintf("  Проверка:\n")
check = A * vectors - vectors * diag(values);
fprintf("Ax - lx = ");
fprintf(" %.5f ", check);
fprintf("\n\n");

rng(1); %seed для случайных чисел

fprintf("Степенной метод\n");
[ value1, vector ] = powerMethod(A, 50);
fprintf("  Наибольшее по модулю собственное значение:\n")
disp(value1);
fprintf("  Coбственный вектор:\n")
disp(vector);

accuracy = 0.5 * 10 ^ (-3);

fprintf("Метод вращений\n");
fprintf("Точность: %f\n", accuracy);
[ values, vectors ] = rotationMethod(A, accuracy);
fprintf("  Собственные значения:\n")
disp(values');
fprintf("  Собственные векторы:\n")
disp(vectors);
fprintf("  Проверка:\n")
check = A * vectors - vectors * diag(values);
fprintf("Ax - lx = ");
fprintf(" %.5f ", check);
fprintf("\n\n");

fprintf("Метод лямбда-разности\n");
[ value2, vector ] = lambdaDifferenceMethod(A, value1, 50);
fprintf("  Второе по модулю собственное значение:\n")
disp(value2);
fprintf(" Cобственный вектор:\n")
disp(vector);
