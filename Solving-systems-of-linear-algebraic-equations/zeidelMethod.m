function [result, k] = zeidelMethod(B, b, result, eps)
	n = size(B, 1);
	
	H = tril(B, -1);
	F = triu(B);
	
	t = inv(eye(n) - H);
	
	prevResult = nan(n, 1);
	
	k = 0;
	
	while any(isnan(prevResult)) || max(abs(result - prevResult)) > eps
		prevResult = result;
		
		result = t * F * prevResult + t * b;
		
		k = k + 1;
    end

end