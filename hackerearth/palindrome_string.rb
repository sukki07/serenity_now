def get_line_by_line_input_from_stdin
	while(line = $stdin.gets())
		test_palindrome(line.chomp)
	end
end

def test_palindrome(line)
	flag = true
	left = 0
	right = (line.length - 1)
	while(left<=right)
		if line[left]==line[right]
			left+=1
			right-=1
		else
			flag = false
			break
		end
	end
	if flag
		print "YES"
	else
		print "NO"
	end
end
get_line_by_line_input_from_stdin
