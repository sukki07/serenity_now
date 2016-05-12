require './lfnode.rb'
#uses child first traversal
def append_child_list_to_parent(head,parent) #a bit complex
	current = head 
	while(current!=nil)
		if(current.child)
			append_child_list_to_parent(current.child,current)
		elsif current.next.equal?nil #last element of this list
			if(parent)
				current.next = parent.next
				parent.next = parent.child
				parent.child = nil #took too much long time
				break
			end
		end
		current = current.next
	end
end


def get_tail_for_child_list(head)
	current=head
	while(current.next!=nil)
		current = current.next
	end
	return current
end

def append_child_list_to_tail(head,tail)
	current = head
	while(current!=nil)
		if(current.child)
			tail.next = current.child
			current.child.prev = tail
			tail = get_tail_for_child_list(current.child) #important
		end
		current = current.next
	end
end


def unflatten_list_with_child_links(head)
	current = head 
	while(current!=nil)
		if(current.child)
			current.child.prev.next = nil #Break the chain
			unflatten_list_with_child_links(current.child)
		end
		current = current.next
	end

end

def print_list(head)
	current = head
	while(current!=nil)
		print current.data
		print " "
		current = current.next
	end
end

def print_node(node)
	print node.data
	print " "
end

def print_list_depth_first(head)
	current = head
	while(current!=nil)
		print_node(current)
		if(current.child)
			print_list_depth_first(current.child)
		end
		current = current.next
	end
end

lfnode10 = LFNode.new(10)
lfnode20 = LFNode.new(20)
lfnode30 = LFNode.new(30)
lfnode31 = LFNode.new(31)
lfnode32 = LFNode.new(32)
lfnode11 = LFNode.new(11)
lfnode22 = LFNode.new(22)
lfnode33 = LFNode.new(33)

lfnode10.child = lfnode20
lfnode20.child = lfnode30

lfnode30.next = lfnode31
lfnode31.prev = lfnode30

lfnode31.next = lfnode32
lfnode32.prev = lfnode31

lfnode10.next = lfnode11
lfnode11.prev = lfnode10

lfnode11.child = lfnode22
lfnode22.child = lfnode33

#append_child_list_to_parent(lfnode10,nil) #non unflattable
print_list_depth_first(lfnode10)
append_child_list_to_tail(lfnode10,lfnode11) #unflattable
#print_list(lfnode10) 
#unflatten_list_with_child_links(lfnode10)
puts
#print_list(lfnode10)
puts
print_list_depth_first(lfnode10)
