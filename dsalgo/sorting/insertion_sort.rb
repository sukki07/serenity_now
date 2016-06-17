def find_where_the_value_under_question_should_be_inserted(index_under_question,value_under_question,array)
	for i in 0..(index_under_question - 1)
		if value_under_question < array[i]
			return i
		elsif value_under_question == array[i] #for inplace sorting
			return i + 1
		elsif value_under_question > array[i] and value_under_question < array[i+1]
			return i + 1
		end
	end
	return index_under_question #took long time to think
end

def move_values_from_index_to_be_to_index_under_question(index_to_be_inserted,index_under_question,array)
	current_index = index_under_question
	temp = array[index_under_question]
	while current_index > index_to_be_inserted
		array[current_index]  = array[current_index-1] 
		current_index -=1
	end
	array[index_to_be_inserted] = temp 
end


def insertion_sort(array)
	for index_under_question in 0..(array.size - 1)
		value_under_question = array[index_under_question]
		index_to_be_inserted = find_where_the_value_under_question_should_be_inserted(index_under_question,value_under_question,array)
		move_values_from_index_to_be_to_index_under_question(index_to_be_inserted,index_under_question,array)
	end
end

s = "a quick brown fox jumped over a lazy dog "
array = s.split("")
puts array.join
insertion_sort(array)
puts array.join
