require './list.rb'

def func_r(node,prev)
	if node.next == nil
		$head = node
		node.next = prev
	else
		func_r(node.next,node)
		node.next = prev
	end
end

def func_i(head)
	current = head
	prev  = nil
	while(current.next!=nil)
		ahead = current.next
		current.next = prev
		prev = current
		current = ahead 
	end
	current.next = prev
	$head = current
end

def print_list(head)
	current = head
	while(current!=nil)
		p current.data
		current = current.next
	end
end

l = List.new
head = l.create_list_of_size(5)
print_list(head)
func_r(head,nil)
print_list($head)
func_i($head)
print_list($head)



