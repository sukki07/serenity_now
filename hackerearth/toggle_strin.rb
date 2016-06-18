def convert(c)
	if (c >= 'a' and c <='z')
		return c.upcase
	else 
		return c.downcase
	end
end

=begin
while(line=$stdin.gets)
	line = line.chomp
	converted_arr = []
	line.each_char do |c|
		convert_char = convert(c)
		converted_arr.push convert_char
	end
	puts converted_arr.join
end
=end

input = $stdin.read
array = input.split("\n")
string = array[0]
converted_arr = []
string.each_char do |c|
	converted_arr.push convert(c)
end
puts converted_arr.join

