

def find_index_of_smallest_from_start_index(array,start_index)
	smallest = array[start_index]
	smallest_index = start_index
	for i in start_index..(array.size - 1)
		if array[i] < smallest
			smallest = array[i]
			smallest_index = i
		end
	end
	return smallest_index
end

def swap(array,start_index,index_of_smallest_value)
	temp = array[start_index]
	array[start_index] = array[index_of_smallest_value] 
	array[index_of_smallest_value]  = temp
end
		
def sel_sort_r(array,start_index)
	if (start_index == array.size - 1 )
		return
	else
		index_of_smallest_value = find_index_of_smallest_from_start_index(array,start_index)
		swap(array,start_index,index_of_smallest_value)
		sel_sort_r(array,start_index+1)
	end
end

def sel_sort_i(array)
	for i in 0..(array.size - 1 )
		index_of_smallest_value = find_index_of_smallest_from_start_index(array,i)
		swap(array,i,index_of_smallest_value)
	end
end

s = "suryakant"
array = s.split("")
#sel_sort_r(array,0)
sel_sort_i(array)
p array
