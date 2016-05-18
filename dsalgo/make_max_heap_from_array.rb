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
def get_max_child_index2(array,i)
	left_child_index  = (2*i)+1
	right_child_index = (2*i)+2
	if right_child_index <= array.size - 1
		if array[left_child_index] >= 0 and array[right_child_index] >=0
			if array[left_child_index] >= array[right_child_index]
				return left_child_index
			else
				return right_child_index
			end
		else
			#one is -1,which?
			if array[left_child_index] == -1
				return right_child_index
			else
				return left_child_index
			end
		end
	else
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
def extract_max(array)
	max = array[0]
	bubble_up(array,0)
	return max
end

def pull_max_child_up(array,i,max_child_index)
	array[i] = array[max_child_index] 
end

#this will check till bottom even if whole tree is filled with -1
def bubble_up(array,i)
	if leaf_node(array,i)
		array[i] = -1
	else
		max_child_index = get_max_child_index2(array,i)
		pull_max_child_up(array,i,max_child_index)
		if (array[max_child_index]==-1)
			#below this all are -1 no need to check
		else
			bubble_up(array,max_child_index)
		end
	end
end

def heap_sort(array)
	loop do
		value = extract_max(array)
		break if value==-1
		puts value
	end
end
array = [1,2,3,4,5,6,7,8,10,34,2,3,33,1,2,4,55,66,77,25,67,21,48]
build_max_heap(array)
heap_sort(array)
