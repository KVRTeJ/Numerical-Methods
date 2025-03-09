function checkSufficientCondition(matrix)
    norm = max(sum(abs(A), 2)); % максимум сумм модулей элементов строк
	
	fprintf("  Норма = %g ", norm);
	
	if norm < 1 
		fprintf("< 1, достаточное условие выполнено.\n\n");
	else
		fprintf("≥ 1, достаточное условие не выполнено.\n\n");
	end
end