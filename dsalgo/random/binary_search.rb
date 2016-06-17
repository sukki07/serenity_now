#search in either half of array every time


#low equal to high if element present in base case
#low > high if element smaller than smallest or larger than largest
def binary_search_iterative(input_array,value)
	low = 0
	high = (input_array.size-1)
	while(low<=high) #low can't be greater than high,but must be equal at the base case
		median = (low+high)/2
		median_value = input_array[median]
		if median_value==value
			return true
		elsif median_value < value
			low = median+1
		elsif median_value > value
			high = median-1
		end
	end
	if(low>high) #Good condition
		return false
	end
end


def binary_search_recursive(array,low,high,svalue)
	if low > high
		#Base case for recursion
		return false 
	end
	median_index = (low+high)/2
	median_value = array[median_index]
	if svalue == median_value
		return true
	elsif  svalue > median_value 
		low = median_index + 1
		return binary_search_recursive(array,low,high,svalue)
	elsif svalue < median_value
		high = median_index - 1 
		return binary_search_recursive(array,low,high,svalue)
	end
end

def binary_search_wrapper(sorted_input_array,search_value)
	low = 0
	high = (sorted_input_array.size - 1)
	puts binary_search_recursive(sorted_input_array,low,high,search_value)
	puts binary_search_iterative(sorted_input_array,search_value)

end
input_array = [1,2,3,4,5,7,34,23,55,66,99,0,11,2,3,45]
sorted_input_array = input_array.sort
search_value = 11
binary_search_wrapper(sorted_input_array,search_value)
search_value = 345
binary_search_wrapper(sorted_input_array,search_value)
