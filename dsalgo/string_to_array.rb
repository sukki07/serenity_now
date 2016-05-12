s = "suryakant"
length = s.length
arr = []
i = 0
loop do 
	arr.push s[i]
	i+=1
	break if i == s.length
end

puts arr
puts arr.class
