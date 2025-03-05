function [ values, vectors ] = rotationMethod(A, accuracy)
	n = size(A, 1);
	
	S = eye(n);

	while sum(A(~eye(n)) .^ 2) > accuracy 
		% максимальный по модулю наддиагональный элемент
		[~, ind] = max(abs(reshape(triu(A, 1), [], 1))); % разворачиваем матрицу в массив
		[j, i] = ind2sub(n, ind); % преобразуем индекс массива в индексы матрицы

		% cos и sin, стр. 28
		d = 2 * A(i, j) / (A(i, i) - A(j, j)); % tg(2phi)
		cosPhi = sqrt(0.5 * (1 + (1 + d ^ 2) ^ (-0.5)));
		sinPhi = sqrt(0.5 * (1 - (1 + d ^ 2) ^ (-0.5))) * sign(d);

		% матрица вращений Vij, стр. 27
		V = eye(n);
		V(i, i) = cosPhi;
		V(i, j) = -sinPhi;
		V(j, i) = sinPhi;
		V(j, j) = cosPhi;

		% преобразование матрицы A
		A = V' * A * V;

		S = S * V;
	end

	% собственные значения
	values = diag(A);

	% собственные векторы
	vectors = S ./ S(n, :);
end