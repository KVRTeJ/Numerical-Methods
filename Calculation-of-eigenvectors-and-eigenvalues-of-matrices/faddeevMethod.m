function [ values, vectors ] = faddeevMethod(A)
	n = size(A, 1);
	
	I = eye(n);
	P = nan(n, 1);
	B = nan(n, n, n); % rows, columns, depth
	
	A_i = A;

	for i = 1 : n
		P(i) = trace(A_i) / i; % след матрицы
		B(:, :, i) = A_i - P(i) .* I;
		
		A_i = A * B(:, :, i);
	end
	
	% собственные значения
	values = roots([ 1; -P ]);
	
	% собственные векторы
	if length(values) == length(unique(values))
		vectors = norm(sum(values' .^ reshape(n - 1 : -1 : 0, 1, 1, n) .* cat(3, I, B(:, :, 1 : n - 1)), 3)); % стр. 254
	else
		vectors = nan(n);
		
		for i = 1 : n
			vectors(:, i) = solveNorm(A - values(i) .* I);
		end
	end
end

% разделить, на последнее не нулевое число
function A = norm(A)
	n = size(A, 2);
	
	for i = 1 : n
		[ ~, ~, v ] = find(round(A(:, i), 6), 1, "last");
		
		A(:, i) = A(:, i) ./ v;
	end
end

% решение Ax = 0 при x_n = 1
function result = solveNorm(A)
	result = [ -A(:, 1 : end - 1) \ A(:, end); 1 ];
end