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

def perm_wrapper(array)
	start = 0
	last = array.size - 1
	puts do_perm(array,start,last)
end
perm_wrapper(['s','u','k','k','i'])
