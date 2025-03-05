function [values, vectors] = danilevskyMethod(A) 
    n = size(A, 1); 
	
	Froben = A;
	S = eye(n);
	
	for k = n : -1 : 2
		if Froben(1, n) == 0
			j = find(Froben(1 : k - 1, n), 1);
			
			if isempty(j)
				[BValues, ~] = danilevskyMethod(Froben(1 : k - 1, 1 : k - 1));
				[AValues, ~] = danilevskyMethod(Froben(k : n, k : n));
				
				values = [ BValues; AValues ];
				vectors = zeros(n);
				
				for i = 1 : n
					vectors(:, i) = solveNorm(A - values(i) .* eye(n));
				end

				return
            else
				Froben([1 j], :) = Froben([j 1], :);
				Froben(:, [1 j]) = Froben(:, [j 1]);
			end
		end
		
		M = [ [ zeros(1, n - 1); eye(n - 1) ], Froben(:, n)];
		
		Froben = M \ Froben * M;

		S = S * M;
	end

	P = [ 1; -Froben(n : -1 : 1, n) ];
	
	values = roots(P);
	
	vectors = nan(n);
	
	for j = 1 : n
		vectors(j, :) = sum(values' .^ reshape(n - j : -1 : 0, [], 1) .* P(1 : n - j + 1), 1);
	end

	vectors = norm(S * vectors);
end

function A = norm(A)
	n = size(A, 2);
	
	for i = 1 : n
		[ ~, ~, v ] = find(round(A(:, i), 6), 1, "last");
		
		A(:, i) = A(:, i) ./ v;
	end
end

function result = solveNorm(A)
	result = [ -A(:, 1 : end - 1) \ A(:, end); 1 ];
end