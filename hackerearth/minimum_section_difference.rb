def process
	count = gets.chomp.to_i
	i = 1
	number_array = []
	while i <= count
		num = gets.chomp.to_i
		number_array.push num
		i+=1
	end
	number_array = number_array.sort 
	number_array.each do |number|
		if number%2 ==0
			sec1 = number/2
			sec2 = number/2

		else
			sec1 = number/2
			sec2 = sec1+1
		end
		array = []
		array.push sec1
		array.push sec2
		puts array.join(" ")
	end
end
process
