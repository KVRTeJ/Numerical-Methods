clc;
clear all;

% Проверка точного решения

syms x;
polynom = 2.5*x^3 + 0.3*x^2 - 2 * x - 1;
coefs = [2.5, 0.3, -2, 1];

rootsValues = roots(coefs);
fprintf('Точное решение:\n');
disp(rootsValues);