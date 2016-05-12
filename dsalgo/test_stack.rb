require './stack.rb'

s = Stack.new
loop do 
	puts "enter choice"
	input = gets.chomp
	if input.eql?"pop"
		s.pop
	elsif input.include?"push"
		data = input.split.last
		s.push data 
	elsif input.eql?"quit"
		break
	elsif input.eql?"p"
		s.print_stack
	elsif input.eql?"size"
		puts s.size
	end
end
