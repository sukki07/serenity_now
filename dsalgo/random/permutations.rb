def add_previous_element(array_of_perms,element)
	new_perm_array = []
	array_of_perms.each do |perm_array|
		for i in 0..perm_array.size
			new_perm = perm_array.dup.insert(i,element)
			new_perm_array.push new_perm
		end
	end
	return new_perm_array
end

def do_perm(array,start,last)
	if start==last
		return [array[start]]
	else
		array_of_perms = do_perm(array,start+1,last)
		array_of_new_perms =  add_previous_element(array_of_perms,array[start])
		return array_of_new_perms
	end
end


def print_permutation(array,already_selected_index_array)
	already_selected_index_array.each do |index|
		print array[index]
	end
	puts
end

#generic approach
def select_char(array,already_selected_index_array)
	if array.size == already_selected_index_array.size
		print_permutation(array,already_selected_index_array)
	else
		full_index_array = (0..(array.size - 1)).to_a
		available_indexes = full_index_array - already_selected_index_array
		available_indexes.each do |index|
			already_selected_index_array.push index
			select_char(array,already_selected_index_array)
			already_selected_index_array.pop
		end
	end
end

def perm_wrapper(array)
	start = 0
	last = array.size - 1
	#memory intensive non generic method 
	#puts do_perm(array,start,last)

	#generic method  slightly better
	already_selected_index_array = []
	select_char(array,already_selected_index_array)
end
perm_wrapper(['a','b','c'])
