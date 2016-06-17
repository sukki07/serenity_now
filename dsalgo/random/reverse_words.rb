

def copy_word_to_array(orig_arr,starting_index_of_word,ending_index_of_word)
	word = orig_arr[starting_index_of_word..ending_index_of_word]
	p word
end


#takes o(n) space
def reverse_words_with_temp_buffer
	string = "  hello,  hi.. i...  .lskdjf masdjfl;ksadhf ,,kk    how are    you   "
	orig_arr = []
	for i in 0...string.size do 
		orig_arr.push string[i]
	end
	index = (orig_arr.size - 1 )
	#one function loops from end and determines index of words
	#other function maintains separate array and copies words from those index

	found_word_flag = false
	ending_index_of_word = nil
	starting_index_of_word = nil
	while(index >= 0)
		if(orig_arr[index].eql?" ")
			if(found_word_flag)
				copy_word_to_array(orig_arr,index,index) #to copy space
				starting_index_of_word = index+1 
				copy_word_to_array(orig_arr,starting_index_of_word,ending_index_of_word)
				found_word_flag = false
			else
				copy_word_to_array(orig_arr,index,index) #to copy space
			end
		elsif index.eql?0 #took long time,when word doesn't end by space
			if(found_word_flag)
				starting_index_of_word = index
				copy_word_to_array(orig_arr,starting_index_of_word,ending_index_of_word)
				found_word_flag = false
			else

			end
		else
			if(found_word_flag) #took long time

			else
				ending_index_of_word = index 
				found_word_flag = true
			end
		end
		index-=1
	end
end

#reverse_words_with_temp_buffer
def reverse_array_in_place(array,start_index,end_index)
	while(end_index > start_index)
		temp = array[end_index]
		array[end_index] = array[start_index]
		array[start_index] = temp
		end_index-=1
		start_index+=1
	end
end

def reverse_words_without_buffer(string)
	orig_arr = string.split("")
	reverse_array_in_place(orig_arr,0,orig_arr.length-1)
	return orig_arr.join

end
string = "  hello,  hi.. i...  .lskdjf masdjfl;ksadhf ,,kk    how are    you   "
string1 = reverse_words_without_buffer(string)
puts string1
