clc;
clear all;

% x1 = 0.08x1 -0.03x2–0.04x4 -1.2
% x2 = 0.51x1 +0.27x2–0.08x4 +0.81 
% x3 = 0.33x1 -0.37x3 +0.21x4 -0.92 
% x4 = 0.11x1 +0.03x3 +0.58x4 +0.17

accuracy = 1 * 10 ^ -5;

B = [
    0.08 -0.03 0 -0.04;
    0.51 0.27 0 -0.08;
    0.33 0 -0.37 0.21;
    0.11 0 0.03 0.58;
    ]

b = [-1.2; 0.81; -0.92; 0.17];

init = [0; 0; 0; 0];

fprintf("Проверка сходимости метода простых итераций: \n");
fprintf("Необходимое и достаточное условие: все собственные значения матрицы B удовлетворяют условию:|lambda_i| < 1:\n")
[values, ~] = leverrierMethod(B);
disp(abs(values));

checkSufficientCondition(B);
[result, steps] = simpleIterations(B, b, init, accuracy);
fprintf("Результат метода простых итераций: ");
disp(result');
fprintf("Количетсво итераций: %d\n", steps);
check = -0.92 * result(1) - 0.03 * result(2) - 0.04 * result(4) - 1.2;
fprintf("Проверим,g подстановкой в одно из исходных уравнений системы(первое): %.4f\n", check);
