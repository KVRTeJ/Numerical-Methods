function [ lambda, vector ] = powerMethod(A, degree)
	n = size(A, 1);
	
	y0 = rand(n, 1);
	
	yk1 = A ^ degree * y0; 
	yk2 = A ^ (degree + 1) * y0;
	
	lambda = sum(yk2 .* yk1) / sum(yk1 .* yk1); 
	vector = norm(yk1);
end


function A = norm(A)
	n = size(A, 2);
	
	for i = 1 : n
		[ ~, ~, v ] = find(round(A(:, i), 6), 1, "last");
		
		A(:, i) = A(:, i) ./ v;
	end
end