function [ values, vectors ] = krylovMethod(A)
	n = size(A, 1);
	
	c = eye(n, 1);
	
	m = 0;
	
	while m < rank(c) % пока вектора линейно независисы
		m = m + 1;
		
		c = [ c, A ^ m * c(:, 1) ];
	end
	
	Q = linsolve(c(:, m : -1 : 1), c(:, m + 1));
	
	% собственные значения
	P = [ 1; -Q ];
	
	values = roots(P);
	
	% собственные векторы
	B = nan(1, m, m);
	
	for k = 1 : m
		powers = reshape(k - 1 : -1 : 0, [], 1);
        values_pow = values' .^ powers; 
        B(1, :, k) = sum(values_pow .* P(1 : k), 1); 
	end
	
 	c_reshaped = reshape(c(1 : m, m : -1 : 1), m, 1, m);
    vectors = sum(B .* c_reshaped, 3);
	
	vectors = norm(vectors);
end

% разделить, на последнее не нулевое число
function A = norm(A)
	n = size(A, 2);
	
	for i = 1 : n
		[ ~, ~, v ] = find(round(A(:, i), 6), 1, "last");
		
		A(:, i) = A(:, i) ./ v;
	end
end