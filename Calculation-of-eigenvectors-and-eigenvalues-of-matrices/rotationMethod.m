function [ values, vectors ] = rotationMethod(A, accuracy)
	n = size(A, 1);
	
	S = eye(n);

	while sum(A(~eye(n)) .^ 2) > accuracy 
		[~, ind] = max(abs(reshape(triu(A, 1), [], 1))); 
		[j, i] = ind2sub(n, ind);

		d = 2 * A(i, j) / (A(i, i) - A(j, j)); 
		cosPhi = sqrt(0.5 * (1 + (1 + d ^ 2) ^ (-0.5)));
		sinPhi = sqrt(0.5 * (1 - (1 + d ^ 2) ^ (-0.5))) * sign(d);

		V = eye(n);
		V(i, i) = cosPhi;
		V(i, j) = -sinPhi;
		V(j, i) = sinPhi;
		V(j, j) = cosPhi;

		A = V' * A * V;

		S = S * V;
	end

	values = diag(A);

	vectors = S ./ S(n, :);
end