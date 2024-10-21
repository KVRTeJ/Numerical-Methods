clc
clear all

yAxis = [1.000 0.195 -0.332 0.849 0.182];
xAxis = [0.000 1.500 3.100 3.700 4.500];
xPoint = -0.137;

xRange = linspace(-1.000, 6.000, 10000);
degree = 4;
trueFunction = cos(xPoint * log(xPoint + 1));

[~, gramMatrix] = calculateByAlgebraicPolynomials(xAxis, yAxis, xAxis(1), degree);
fprintf("Матрица Грамма алгебраического полинома:\n");
disp(gramMatrix);

[~, gramMatrix] = calculateByOrthogonalPolynomial(xAxis, yAxis, xAxis(1), degree);
fprintf("Матрица Грамма ортогонального полинома Чебышева:\n");
disp(gramMatrix);

[~, gramMatrix] = calculateByOrthogonalPolynomialLegandra(xAxis, yAxis, xAxis(1), degree);
fprintf("Матрица Грамма ортогонального полинома Лежандра:\n");
disp(gramMatrix);

[~, gramMatrix] = calculateByOrthogonalPolynomialDisVar(xAxis, yAxis, xAxis(1), degree);
fprintf("Матрица Грамма ортогонального полинома Чебышева дискретной переменной:\n");
disp(gramMatrix);

fprintf("0) Истинная функция - %f", trueFunction);

foo = calculateByAlgebraicPolynomials(xAxis, yAxis, xPoint, degree);
fprintf("\n");
fprintf("1) Алгебраический полином - %f", foo);

foo = calculateByOrthogonalPolynomial(xAxis, yAxis, xPoint, degree);
fprintf("\n");
fprintf("2) Ортогональный полином Чебышева - %f", foo);

foo = calculateByOrthogonalPolynomialLegandra(xAxis, yAxis, xPoint, degree);
fprintf("\n");
fprintf("3) Ортогональный полином Лежандра - %f", foo);

foo = calculateByOrthogonalPolynomialDisVar(xAxis, yAxis, xPoint, degree);
fprintf("\n");
fprintf("4) Ортогональный полином Чебышева дискретной переменной - %f", foo);

fprintf("\n");

approximatingAlgFunctionDegree4 = linspace(1, 1, length(xRange));
approximatingAlgFunctionDegree5 = linspace(1, 1, length(xRange));

approximatingOrtFunctionDegree4 = linspace(1, 1, length(xRange));
approximatingOrtLegFunctionDegree4 = linspace(1, 1, length(xRange));

approximatingOrtFunDisVar = linspace(1, 1, length(xRange));

lagrangePolynom = linspace(1, 1, length(xRange));
lenthXAxis = length(xAxis);
for i = 1:1:length(xRange)
    approximatingAlgFunctionDegree4(i) = calculateByAlgebraicPolynomials(xAxis, yAxis, xRange(i), degree);
    approximatingAlgFunctionDegree5(i) = calculateByAlgebraicPolynomials(xAxis, yAxis, xRange(i), lenthXAxis);

    approximatingOrtFunctionDegree4(i) = calculateByOrthogonalPolynomial(xAxis, yAxis, xRange(i), degree);
    approximatingOrtLegFunctionDegree4(i) = calculateByOrthogonalPolynomialLegandra(xAxis, yAxis, xRange(i), degree); %calByOrtPolLeg

    approximatingOrtFunDisVar(i) = calculateByOrthogonalPolynomialDisVar(xAxis, yAxis, xRange(i), degree);
    lagrangePolynom(i) = calculateLagrangia(xAxis, yAxis, xRange(i));
end
trueFunction = cos(xRange .* log(xRange + 1));


figure("Name", "Апроксимация алгебраичекими полиномами", "NumberTitle", "off")
    tiledlayout(2, 1);
    xlabel("abscyssa");
    ylabel("ordinate");
    mainTitle = nexttile;
    plot(xRange, trueFunction, LineStyle="--", LineWidth=2, Color="blue");
    title(mainTitle, "Степень равна 4");
    ylim([-3 3]);
    grid on;
    hold on;

    plot(mainTitle, xRange, approximatingAlgFunctionDegree4, LineStyle="-", LineWidth=2, Color="#A2142F");
    hold on;

    plot(mainTitle, xAxis, yAxis, "ko", LineWidth=2, MarkerSize=7);
    hold on;

    legend("Истинная функция", ...
        "Апроксимирующая функция", ...
        "Точки x и y");


    appFuncDeg5 = nexttile;
    plot(appFuncDeg5, xRange, lagrangePolynom, LineStyle="-", LineWidth=2, Color="red");
    title(appFuncDeg5, "Степень равна количеству точек")
    ylim([-3 3]);
    grid on;
    hold on;

    plot(appFuncDeg5, xRange, approximatingAlgFunctionDegree5, LineStyle="--", LineWidth=2, Color="black");
    hold on;

    plot(appFuncDeg5, xAxis, yAxis, "ko", LineWidth=2, MarkerSize=7);
    hold on;

    legend("Многочлен Лагранжа", ...
        "Апроксимирующая функция", ...
        "Точки x и y");

figure("Name", "Апроксимация ортогональными полиномами", "NumberTitle", "off")
    tiledlayout(2, 1);
    xlabel("abscyssa");
    ylabel("ordinate");
    mainTitle = nexttile;
    plot(xRange, trueFunction, LineStyle="--", LineWidth=2, Color="blue");
    title(mainTitle, "Ортогональный полином Чебышева");
    ylim([-3 3]);
    grid on;
    hold on;

    plot(mainTitle, xRange, approximatingOrtFunctionDegree4, LineStyle="-", LineWidth=2, Color="#A2142F");
    hold on;

    plot(mainTitle, xAxis, yAxis, "ko", LineWidth=2, MarkerSize=7);
    hold on;

    legend("Истинная функция", ...
        "Апроксимирующая функция", ...
        "Точки x и y");

    legGrap = nexttile;
    plot(legGrap, xRange, trueFunction, LineStyle="--", LineWidth=2, Color="blue");
    title(legGrap, "Ортогональный полином Лежандра");
    ylim([-3 3]);
    grid on;
    hold on;

    plot(legGrap, xRange, approximatingOrtLegFunctionDegree4, LineStyle="-", LineWidth=2, Color="#A2142F");
    hold on;

    plot(legGrap, xAxis, yAxis, "ko", LineWidth=2, MarkerSize=7);
    hold on;

    legend("Истинная функция", ...
        "Апроксимирующая функция", ...
        "Точки x и y");

figure("Name", "Апроксимация ортогональным полиномом дискретной переменной", "NumberTitle", "off")
    tiledlayout(2, 1);
    xlabel("abscyssa");
    ylabel("ordinate");
    mainTitle = nexttile;
    plot(xRange, trueFunction, LineStyle="--", LineWidth=2, Color="blue");
    title(mainTitle, "Ортогональный полином дискретной переменной");
    ylim([-3 3]);
    grid on;
    hold on;

    plot(mainTitle, xRange, approximatingOrtFunDisVar, LineStyle="-", LineWidth=2, Color="#A2142F");
    hold on;

    plot(mainTitle, xAxis, yAxis, "ko", LineWidth=2, MarkerSize=7);
    hold on;

    legend("Истинная функция", ...
        "Апроксимирующая функция", ...
        "Точки x и y");
