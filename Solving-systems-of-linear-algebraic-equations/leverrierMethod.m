function [ values, vectors ] = leverrierMethod(A)
	n = size(A, 1);

	S = nan(n, 1);
	P = nan(n, 1);

	for k = 1 : n
		S(k) = trace(A ^ k);
	end

	P(1) = S(1);

	for k = 2 : n
		P(k) = (1 / k) * (S(k) - sum(S(k - 1 : -1 : 1) .* P(1 : k - 1))); % 3.2
	end

	values = roots([ 1; -P ]);

	vectors = nan(n);

	for i = 1 : n
		vectors(:, i) = solveNorm(A - values(i) .* eye(n));
	end
end

function result = solveNorm(A)
	result = [ -A(:, 1 : end - 1) \ A(:, end); 1 ];
end