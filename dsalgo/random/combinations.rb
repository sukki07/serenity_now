def print_combination(array_of_char,index_array)
	index_array.each do |index|
		print array_of_char[index]
	end
	puts
end
def select_char(array_of_char,si,ei,count_of_depth,index_array)
	if  count_of_depth == 0
		$count += 1
		print_combination(array_of_char,index_array)
	else
		for i in si..ei
			index_array.push i
			select_char(array_of_char,i+1,ei+1,count_of_depth - 1,index_array)
			index_array.pop
		end
	end
end
def combination_wrapper(array_of_char,count_of_depth)
	last_index = (array_of_char.size - 1) - (count_of_depth - 1)
	index_array = []
	select_char(array_of_char,0,last_index,count_of_depth,index_array)
end
$count = 0
input_array = ['a','b','c','d','e','f','g']
combination_wrapper(input_array,6)
puts $count
