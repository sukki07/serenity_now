
def merge_arrays(left_array,right_array)
	l_index = 0 
	r_index = 0 
	temp_array = []
	while (l_index < left_array.size and r_index < right_array.size )
		if left_array[l_index] <= right_array[r_index]
			temp_array.push left_array[l_index]
			l_index+=1
		else
			temp_array.push right_array[r_index]
			r_index+=1
		end
	end
	#copy remaining array
	while r_index < right_array.size
		temp_array.push right_array[r_index]
		r_index +=1
	end
	while l_index < left_array.size
		temp_array.push left_array[l_index]
		l_index +=1
	end
	return temp_array
end
def merge_sort(array,start_i,end_i)
	if start_i == end_i
		return [array[start_i]]
	else
		mid = (start_i+end_i)/2
		l_a = merge_sort(array,start_i,mid)
		r_a = merge_sort(array,mid+1,end_i)
		merged_array =  merge_arrays(l_a,r_a)
		return merged_array
	end
end
def merge(array)
	 puts merge_sort(array,0,array.size - 1)
end
array = "quickbrownfoxjumpedoveralazydog".split("")
merge(array)
