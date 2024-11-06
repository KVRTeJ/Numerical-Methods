function result = simplestMethod(from, to, accuracy)

    n = 1000;

    epsilon = from + (to - from) * rand(n, 1);
    eta = myFunction(epsilon);

    integralValue = (to - from) / n * sum(eta)

end