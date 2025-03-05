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

disp("Метод Данилевского, нерегулярный случай");
[ values, vectors ] = danilevskyMethod(B);
disp("  Собственные значения:")
disp(values');
disp("  Собственные векторы:")
disp(vectors);
disp("  Проверка:")
disp(B * vectors);
disp(vectors * diag(values))

disp("Метод Данилевского, регулярный случай");
[ values, vectors ] = danilevskyMethod(A);
disp("  Собственные значения:")
disp(values');
disp("  Собственные векторы:")
disp(vectors);
disp("  Проверка:")
disp(A * vectors);
disp(vectors * diag(values));

disp("Метод Фаддеева");
[ values, vectors ] = faddeevMethod(A);
disp("  Собственные значения:")
disp(values');
disp("  Собственные векторы:")
disp(vectors);

disp("Метод Крылова");
[ values, vectors ] = krylovMethod(A);
disp("  Собственные значения:")
disp(values');
disp("  Собственные векторы:")
disp(vectors)

disp("Метод Леверье");
[ values, vectors ] = leverrierMethod(A);
disp("  Собственные значения:")
disp(values');
disp("  Собственные векторы:")
disp(vectors);