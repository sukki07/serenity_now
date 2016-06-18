def get_line_by_line_input_from_stdin
	line = $stdin.gets()
	line = line.chomp
	l = line.split(" ")[0].to_i
	r = line.split(" ")[1].to_i
	k = line.split(" ")[2].to_i
	count = 0
	for i in l..r
		if (i%k)==0
			count+=1
		end
	end
	puts count
end
get_line_by_line_input_from_stdin
