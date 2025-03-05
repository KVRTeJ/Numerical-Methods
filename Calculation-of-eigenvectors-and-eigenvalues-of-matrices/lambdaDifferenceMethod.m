function [ lambda2, vector ] = lambdaDifferenceMethod(A, lambda1, degree)
	n = size(A, 1);
	
	y0 = rand(n, 1);
	
	yk1 = A ^ (degree - 1) * y0;
	yk2 = A ^ degree * y0;
	yk3 = A ^ (degree + 1) * y0;
	
	lambda2 = (yk3(1) - lambda1 * yk2(1)) / (yk2(1) - lambda1 * yk1(1));
	
	vector = norm(yk3 - lambda1 * yk2);
end

function A = norm(A)
	n = size(A, 2);
	
	for i = 1 : n
		[ ~, ~, v ] = find(round(A(:, i), 6), 1, "last");
		
		A(:, i) = A(:, i) ./ v;
	end
end