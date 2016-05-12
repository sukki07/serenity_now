require './list.rb'
l = List.new
l.add_at_end(5)
node_pre = l.add_at_end(6)
l.add_at_end(7)
node = l.add_at_end(8)
node.next = node_pre
head = l.head
current = head
reference_hash = {}
previous  = nil
=begin
while(current!=nil)
	if  reference_hash.has_key?current
		puts "Cycle detected at #{previous.data} to #{current.data}" 
		break
	else
		reference_hash[current] = current.data
	end
	previous = current
	current = current.next
end
=end

current = head
fast = head.next
while(fast!=current and fast!=nil)
	current =  current.next
	fast = fast.next.next
end
puts current.data


