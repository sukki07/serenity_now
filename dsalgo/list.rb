require './node.rb'
class List
	attr_accessor :head,:tail
	def initialize
		@head = nil
		@tail = nil
	end	

	def add_at_beginning(data)
		node = Node.new(data)
		if @head.eql?nil
			#List is empty
			@tail = node
		end
		node.next = @head
		@head = node
		return node
	end
	def print_list
		current_node = @head
		while(current_node!=nil)
			print current_node.data
			print " "
			current_node = current_node.next
		end
		puts
	end
	def add_at_end(data)
		node_to_be_added = Node.new(data)
		current_node = @head
		previous_node = nil
		while current_node!=nil
			previous_node = current_node
			current_node = current_node.next
		end
		if previous_node.equal?nil
			#List was empty
			@head = node_to_be_added
		else
			previous_node.next = node_to_be_added
		end
		@tail = node_to_be_added
		return node_to_be_added 
	end
	def remove_node(node)
		current = @head
		previous = nil
		if (node.equal?@head and node.equal?@tail)
			@head = nil
			@tail = nil
		end
		while(current!=nil)
			if(current.equal?node)
				if(previous.equal?nil)
					@head = current.next
					break
				elsif(current.equal?@tail)
					@tail = previous
					previous.next = current.next
					break
				else
					previous.next = current.next
					break
				end
			end
			previous = current
			current = current.next
		end
	end


	def mth_to_last(m)
		#m = 0 means last
		#m = 1 means second last
		#m = size-1 means head
		current = @head
		current_plus_m = current
		m.times do 
			if current_plus_m.next #took some time
				current_plus_m = current_plus_m.next 
			else
				raise Exception.new("List does not have #{m+1} elements")
			end
		end
		while(current_plus_m.next!=nil)
			current = current.next
			current_plus_m = current_plus_m.next 
		end
		return current
	end
end
