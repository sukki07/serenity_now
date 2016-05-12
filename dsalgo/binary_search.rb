#search in either half of array every time


#low equal to high if element present in base case
#low > high if element smaller than smallest or larger than largest
def binary_search(input_array,value)
	low = 0
	high = (input_array.size-1)
	while(low<=high) #low can't be greater than high,but must be equal at the base case
		median = (low+high)/2
		median_value = input_array[median]
		print low," ",high," ",median," ",median_value
		puts
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
input_array = [1,2,3,4,5,7,34,23,55,66,99,0,11,2,3,45]
sorted_input_array = input_array.sort
p sorted_input_array
puts binary_search(sorted_input_array,0)
