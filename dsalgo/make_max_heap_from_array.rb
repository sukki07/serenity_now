def leaf_node(array,i)
	left_child_index  = (2*i)+1
	right_child_index = (2*i)+2
	if (left_child_index > array.size  - 1 and right_child_index > array.size  - 1 )
		return true
	else
		return false
	end
end

def swap_current_with_max_child(array,i,max_child_index)
	temp = array[i]
	array[i] = array[max_child_index]
	array[max_child_index] = temp
end
			

def get_max_child_index(array,i)
	left_child_index  = (2*i)+1
	right_child_index = (2*i)+2
	if right_child_index <= array.size - 1
		if array[left_child_index] >= array[right_child_index]
			return left_child_index
		else
			return right_child_index
		end
	else
		puts "right child of #{i} out of bound"
		return left_child_index
	end

end

def is_max_heap(array,i)
	left_child_index  = (2*i)+1
	right_child_index = (2*i)+2
	if right_child_index <= array.size - 1
		if (array[i] >= array[left_child_index] and array[i] >= array[right_child_index])
			return true
		else
			return false
		end
	else
		puts "right child of #{i} out of bound"
		if array[i] >= array[left_child_index]
			return true
		else
			return false
		end
	end
end

#Only tough part is to check indices for right are not out of bound
def max_heapify(array,i)
	puts "max_heapifying #{i}"
	if leaf_node(array,i)
		puts "ended at leaf #{i}"
	else
		if is_max_heap(array,i)
			puts "done at #{i}"
		else
			max_child_index = get_max_child_index(array,i)
			swap_current_with_max_child(array,i,max_child_index)
			max_heapify(array,max_child_index)
		end
	end
end

#max_heapify(array,2)

def build_max_heap(array)
	i = (array.size)/2
	while(i>=0)
		if leaf_node(array,i)
		else
			max_heapify(array,i)
		end
		i-=1
	end
end
array = [1,2,3,4,5,6,7,8,10,11,12,13,14,15,16,17]
build_max_heap(array)
p array
