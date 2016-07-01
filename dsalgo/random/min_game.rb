def func(n)
	if 	($valid_set.has_key?(n-2) and $valid_set.has_key?(n-3) and $valid_set.has_key?(n-4)) or 
		($valid_set.has_key?(n-3)  and $valid_set.has_key?(n-4) and $valid_set.has_key?(n-5)) or 
		($valid_set.has_key?(n-4) and $valid_set.has_key?(n-5) and $valid_set.has_key?(n-6))
		$valid_set[n] = true
	end
end

def can_win_nim(n)
	$valid_set = {}
	$valid_set[1] = true
	$valid_set[2] = true
	$valid_set[3] = true
	$valid_set[5] = true
	$valid_set[6] = true
	$valid_set[7] = true
	if n <= 7
		return $valid_set.has_key?(n)
	else
		for i in 8..n
			puts i
			func(i)
		end
		return $valid_set.has_key?(n)
	end
end
n = 1348820612
puts can_win_nim(n)
