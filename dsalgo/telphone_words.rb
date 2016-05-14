$hash_digits_to_charset = {}
$hash_digits_to_charset[0] = ['0']
$hash_digits_to_charset[1] = ['1']
$hash_digits_to_charset[2] = ['a','b','c']
$hash_digits_to_charset[3] = ['d','e','f']
$hash_digits_to_charset[4] = ['g','h','i']
$hash_digits_to_charset[5] = ['j','k','l']
$hash_digits_to_charset[6] = ['m','n','o']
$hash_digits_to_charset[7] = ['p','r','s']
$hash_digits_to_charset[8] = ['t','u','v']
$hash_digits_to_charset[9] = ['w','x','y']


def print_array(array)
	array.each do |char|
		print char
	end
	puts
end

def select_char(digit_array,digit_index,keyword_array)
	if digit_index > (digit_array.size - 1) 
		print_array(keyword_array)
	else
		digit = digit_array[digit_index]
		digit_charset = $hash_digits_to_charset[digit]
		digit_charset.each do |char|
			keyword_array.push char 
			select_char(digit_array,digit_index+1,keyword_array)
			keyword_array.pop
		end
	end
end

def wrapper(digit_array)
	keyword_array = []
	select_char(digit_array,0,keyword_array)
end


digit_array = [8,6,6,2,6,6,5]
wrapper(digit_array)
