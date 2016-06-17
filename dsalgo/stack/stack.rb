require './node.rb'
#push pop 

class Stack
	attr_reader :size
	def initialize
		@head = nil
		@size = 0
	end
	def push(data)
		node = Node.new(data)
		node.next = @head
		@head = node
		@size+=1
	end
	def pop
		if @head
			@head = @head.next
			@size-=1
		else
			raise Exception.new("Stack is empty")
		end
	end
	def empty?
		if @size.eql?0
			return true
		else
			return false
		end
	end
	def print_stack
		current = @head
		while(current!=nil)
			print current.data
			print "->"
			current = current.next
		end
		puts
	end
end
