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
    ];

b = [-1.2; 0.81; -0.92; 0.17];

init = b;
init2 = [10; 10; 10; 10];
rng(3);
initRand = randi([-50 50], 4, 1);

fprintf("  Метод простых итераций: \n")

fprintf("Проверка сходимости метода: \n");
fprintf("Необходимое и достаточное условие: все собственные значения матрицы B удовлетворяют условию:|lambda_i| < 1:\n")
[values, ~] = leverrierMethod(B);
disp(abs(values));
checkSufficientCondition(B);

[result, steps] = simpleIterations(B, b, init, accuracy);
fprintf("Начальное приближение: ");
disp(init')
fprintf("Результат метода простых итераций: ");
disp(result');
fprintf("Количетсво итераций: %d\n", steps);
check = -0.92 * result(1) - 0.03 * result(2) - 0.04 * result(4) - 1.2;
fprintf("Проверим, подстановкой в одно из исходных уравнений системы(первое): %.4f\n\n\n", check);

[result, steps] = simpleIterations(B, b, init2, accuracy);
fprintf("Начальное приближение: ");
disp(init2')
fprintf("Результат метода простых итераций: ");
disp(result');
fprintf("Количетсво итераций: %d\n", steps);
check = -0.92 * result(1) - 0.03 * result(2) - 0.04 * result(4) - 1.2;
fprintf("Проверим, подстановкой в одно из исходных уравнений системы(первое): %.4f\n\n\n", check);

[result, steps] = simpleIterations(B, b, initRand, accuracy);
fprintf("Начальное приближение: ");
disp(initRand')
fprintf("Результат метода простых итераций: ");
disp(result');
fprintf("Количетсво итераций: %d\n", steps);
check = -0.92 * result(1) - 0.03 * result(2) - 0.04 * result(4) - 1.2;
fprintf("Проверим, подстановкой в одно из исходных уравнений системы(первое): %.4f\n\n\n", check);


fprintf("\n\n\n");


checkSufficientCondition(B);
[result, steps] = zeidelMethod(B, b, init, accuracy);
fprintf("Начальное приближение: ");
disp(init')
fprintf("Результат метода простых итераций: ");
disp(result');
fprintf("Количетсво итераций: %d\n", steps);
check = -0.92 * result(1) - 0.03 * result(2) - 0.04 * result(4) - 1.2;
fprintf("Проверим, подстановкой в одно из исходных уравнений системы(первое): %.4f\n\n\n", check);

[result, steps] = zeidelMethod(B, b, init2, accuracy);
fprintf("Начальное приближение: ");
disp(init2')
fprintf("Результат метода простых итераций: ");
disp(result');
fprintf("Количетсво итераций: %d\n", steps);
check = -0.92 * result(1) - 0.03 * result(2) - 0.04 * result(4) - 1.2;
fprintf("Проверим, подстановкой в одно из исходных уравнений системы(первое): %.4f\n\n\n", check);

[result, steps] = zeidelMethod(B, b, initRand, accuracy);
fprintf("Начальное приближение: ");
disp(initRand')
fprintf("Результат метода простых итераций: ");
disp(result');
fprintf("Количетсво итераций: %d\n", steps);
check = -0.92 * result(1) - 0.03 * result(2) - 0.04 * result(4) - 1.2;
fprintf("Проверим, подстановкой в одно из исходных уравнений системы(первое): %.4f\n\n\n", check);


% 1.48x1 +0.75x2 -1.23x3 = 0.83 
% 0.75x1 -0.96x2 +1.64x3 = -1.12 
% -1.23x1 +1.64x2 -0.55x3 = 0.47

A = [
    1.48 0.75 -1.23;
    0.75 -0.96 1.64;
    -1.23 1.64 -0.55
    ];

f = [0.83; -1.12; 0.47];

fprintf("  Метод квадратного корня\n");

fprintf("Докажем, что матрица А эрмитова: \n");
fprintf("A: \n");
disp(A);
fprintf("A*: \n");
disp(A');
checkErmit = A - A';
fprintf("A - A* = \n");
disp(checkErmit);
result = squareRootMethod(A, f);
fprintf("Результат x =");
disp(result');

check = A * result - f;
fprintf("Проверим, подставив результат в уравнение Ax-f:\n");
for i = 1:1:size(check)
    fprintf("%.4f ", check(i));
end
fprintf("\n");
