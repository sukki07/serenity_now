class MinHeap
	def initialize
		@heap_array = []
	end
	def insert(number)
		@heap_array.push number
		inserted_index = (@heap_array.size - 1 )
		parent_of_inserted_index = get_parent(inserted_index) 
		if heap_property_satisfied_at(parent_of_inserted_index)
		else
			bubble_up_from(inserted_index)
		end
	end

	def extract_min
	end

	def see_heap
		p @heap_array
	end

	private

	def heap_property_satisfied_at(index)
		left_child_index = get_left_child_of(index)
		right_child_index = get_right_child_of(index)
		last_index = @heap_array.size - 1 
		p "checking heap at #{@heap_array[index]} at index #{index}"
		if left_child_index <= last_index and right_child_index <= last_index
			min_child_index = (@heap_array[left_child_index] <= @heap_array[right_child_index]) ? left_child_index : right_child_index
			if @heap_array[index] <= @heap_array[min_child_index]
				return true
			else
				return false
			end
		elsif left_child_index <= last_index and right_child_index > last_index
			if @heap_array[index] <= @heap_array[left_child_index]
				return true
			else
				return false
			end
		elsif left_child_index > last_index and right_child_index > last_index
			return true
		end
	end

	def get_right_child_of(index)
		return 2*index + 2
	end

	def get_left_child_of(index)
		return 2*index + 1 
	end

	def get_parent(index)
		if index > 0
			return (index - 1 )/2
		else
			return 0
		end
	end

	def swap(index1,index2)
		temp = @heap_array[index1]
		@heap_array[index1]  = @heap_array[index2]
		@heap_array[index2] = temp
	end

	def bubble_up_from(index)
		parent = get_parent(index)
		swap(parent,index)
		if heap_property_satisfied_at(get_parent(parent))
			p "hs at #{parent}"
		else
			bubble_up_from(parent)
		end
	end

	def hepify_from(index)
	end
end
