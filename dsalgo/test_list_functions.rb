require './list.rb'
l = List.new
just_added_node = nil
loop do 
	puts "enter choice ab,ae,rn,head,tail,p,quit"
	input = gets.chomp
	if input.include?"ab"
		data = input.split.last
		just_added_node = l.add_at_beginning(data)
	elsif input.include?"ae"
		data = input.split.last
		just_added_node = l.add_at_end(data)
	elsif input.eql?"quit"
		break
	elsif input.eql?"p"
		l.print_list
	elsif input.eql?"head"
		puts l.head.data  if l.head
	elsif input.eql?"tail"
		puts l.tail.data  if l.tail
	elsif input.eql?"rn"
		puts "deleting #{just_added_node.data}"
		l.remove_node(just_added_node)
	elsif input.include?"mthl"
		m = input.split.last.to_i
		puts l.mth_to_last(m).data
	end
end



