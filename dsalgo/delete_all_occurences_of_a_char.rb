input_arr = ['a','2','h','w','h','c','w','d','d','c','b']
#input_arr = ['a','a','a','a','a','a','a','a','a','a','a']
char = 'd'
#one function which takes a array which has char to be removed and shifts the index post that char
#one function to loop , which calls above function whenever a match is found



def shift_function(input_arr,index)
	counter = index
	while(counter < input_arr.size)
		if counter.eql?(input_arr.size-1)
			input_arr[counter] = "NULL"
		else
		input_arr[counter] = input_arr[counter+1]
		end
		counter+=1
	end
end
index = 0
while index < input_arr.size
	if input_arr[index].eql?char
		#this is O n2 solution in worst case , i.e all elements are to be deleted
		shift_function(input_arr,index)
		next #for continuous elements
	end
	index+=1
end
#puts input_arr

input_arr = ['d','a','2','d','h','w','h','c','w','r','g','4','d','d','yu']
#maintain two indexes , source and destination , advance both and copy if normal element , advance only source if element to be deleted

source_index = 0
dest_index = 0
char = 'd'

#Order n solution for every case
while(source_index<input_arr.size)
	if input_arr[source_index].eql?char
		input_arr[source_index] = "NULL"
		source_index+=1
	else
		input_arr[dest_index] = input_arr[source_index] 
		input_arr[source_index] = "NULL"
		dest_index+=1
		source_index+=1
	end
end
puts input_arr
