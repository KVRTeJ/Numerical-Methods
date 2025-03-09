function x = squareRootMethod(A, f)
	n = size(A, 1);

	D = zeros(n);
	S = zeros(n);
	
    % стр 239 или стр 47 (5.9)
	D(1, 1) = sign(A(1, 1)); 
	S(1, 1) = sqrt(abs(A(1, 1))); 
	S(1, 2 : n) = A(1, 2 : n) / (D(1, 1) * S(1, 1));
	
	for i = 2 : n
		p = 1 : i - 1;
		temp = A(i, i) - sum(abs(S(p, i)) .^ 2 .* diag(D(p, p)));
		
		D(i, i) = sign(temp);
		S(i, i) = sqrt(abs(temp));
		
		for j = i + 1 : n
			p = 1 : i - 1;
			
			S(i, j) = (A(i, j) - sum(conj(S(p, i)) .* diag(D(p, p)) .* S(p, j))) / (D(i, i) * S(i, i));
		end
	end
	
    % (5.3)
	B = (S') * D; 

	% вектор y (5.5)
	y = zeros(n, 1);
	
	y(1) = f(1) / B(1, 1);
	
	for k = 2 : n
		p = 1 : k - 1;
		
		y(k) = (f(k) - sum(B(k, p) * y(p))) / B(k, k);
	end
	
	% вектор x (5.7)
	x = zeros(n, 1);
	
	x(n) = y(n) / S(n, n);
	
	for k = n - 1 : -1 : 1
		p = k + 1 : n;
		
		x(k) = (y(k) - sum(S(k, p) * x(p))) / S(k, k);
	end
end