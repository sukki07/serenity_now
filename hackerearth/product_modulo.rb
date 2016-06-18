def get_line_by_line_input_from_stdin
	line = $stdin.gets()
	line = line.chomp
	size = line.to_i
	string_with_spaces = $stdin.gets()
	array_of_numbers = string_with_spaces.split(" ")
	array_of_numbers = array_of_numbers.map{|i| i.to_i}
	result = 1
	array_of_numbers.each do |num|
		result = (result * num) % ((10**9) + 7)
	end
	puts result


end
get_line_by_line_input_from_stdin
