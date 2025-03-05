function [values, vectors] = danilevskyMethod(A) 
    n = size(A, 1); 
	
	F = A; % матрица Фробениуса
	S = eye(n); %матрица с единицами на диагонали
	
	for k = n : -1 : 2
		if F(1, n) == 0
			% нерегулярный случай
			j = find(F(1 : k - 1, n), 1); % индекс первого отличного от нуля элемента в последнем столбце
			
			if isempty(j)
				% блочная матрица
				[BValues, ~] = danilevskyMethod(F(1 : k - 1, 1 : k - 1));
				[AValues, ~] = danilevskyMethod(F(k : n, k : n));
				
				% собственные значения
				values = [ BValues; AValues ];
				
				% собственные векторы
				vectors = zeros(n);
				
				for i = 1 : n
					vectors(:, i) = solveNorm(A - values(i) .* eye(n));
				end

				return
			else
				% меняем местами строки и столбцы
				F([1 j], :) = F([j 1], :);
				F(:, [1 j]) = F(:, [j 1]);
			end
		end
		
		% преобразование подобия 
		M = [ [ zeros(1, n - 1); eye(n - 1) ], F(:, n)];
		
		F = M \ F * M; % стр. 249 inv(M) * F * M.

		S = S * M;
	end

	% собственные значения
	P = [ 1; -F(n : -1 : 1, n) ];
	
	values = roots(P);
	
	% собственные векторы
	vectors = nan(n);
	
	for j = 1 : n
		vectors(j, :) = sum(values' .^ reshape(n - j : -1 : 0, [], 1) .* P(1 : n - j + 1), 1);
	end

	vectors = norm(S * vectors);
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