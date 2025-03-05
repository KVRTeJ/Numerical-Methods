function [ lambda, vector ] = powerMethod(A, degree)
	n = size(A, 1);
	
	y0 = rand(n, 1);
	
	yk1 = A ^ degree * y0; % 8.1
	yk2 = A ^ (degree + 1) * y0;
	
	% собственное значение
	lambda = sum(yk2 .* yk1) / sum(yk1 .* yk1); % стр. 30, в конце
	
	% собственный вектор
	vector = norm(yk1);
end

% разделить, на последнее не нулевое число
function A = norm(A)
	n = size(A, 2);
	
	for i = 1 : n
		[ ~, ~, v ] = find(round(A(:, i), 6), 1, "last");
		
		A(:, i) = A(:, i) ./ v;
	end
end