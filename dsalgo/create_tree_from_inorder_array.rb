require './btnode.rb'

def move_right(subtree_node,subtree_node_index,begin_subtree_index,end_subtree_index)
	right_subtree_begin  = subtree_node_index + 1
	right_subtree_end = end_subtree_index
	right_child_index = (right_subtree_begin  + right_subtree_end)/2
	right_node = Btnode.new($inorder_array[right_child_index])
	subtree_node.right = right_node
	func(right_node,right_child_index,right_subtree_begin,right_subtree_end)
end

def move_left(subtree_node,subtree_node_index,begin_subtree_index,end_subtree_index)
	left_subtree_begin =  begin_subtree_index
	left_subtree_end = subtree_node_index - 1
	left_child_index =  (left_subtree_begin + left_subtree_end )/2
	left_node = Btnode.new($inorder_array[left_child_index])
	subtree_node.left =  left_node
	func(left_node,left_child_index,left_subtree_begin,left_subtree_end)
end


def func(subtree_node,subtree_node_index,begin_subtree_index,end_subtree_index)
	if begin_subtree_index == end_subtree_index
	elsif begin_subtree_index == subtree_node_index
		move_right(subtree_node,subtree_node_index,begin_subtree_index,end_subtree_index)
	elsif end_subtree_index == subtree_node_index
		move_left(subtree_node,subtree_node_index,begin_subtree_index,end_subtree_index)
	else
		move_left(subtree_node,subtree_node_index,begin_subtree_index,end_subtree_index)
		move_right(subtree_node,subtree_node_index,begin_subtree_index,end_subtree_index)
	end
end

def inorder(node)
	if node == nil
	else
		inorder(node.left)
		print node.data
		inorder(node.right)
	end
end

def preorder(node)
	if node == nil
	else
		print node.data
		inorder(node.left)
		inorder(node.right)
	end
end

def level_order(queue,depth)
	level_nodes = []
	justify = 100 - (2**(depth))
	while(not queue.empty?)
		node = queue.pop
		level_nodes.unshift node
	end
	print " "*justify
	level_nodes.each do |node| 
		print node.data
		print " "
	end
	level_nodes.each do |node|
		if node.data == "X"
			next
		end
		if node.left
			queue.push node.left  
		else
			nil_node = Btnode.new("X")
			queue.push nil_node 
		end
		if node.right
			queue.push node.right  
		else
			nil_node = Btnode.new("X")
			queue.push nil_node 
		end
	end
end
def level_order_w(node)
	queue = []
	queue.push node
	depth = 0
	while (not queue.empty?)
		puts
		level_order(queue,depth)
		depth+=1
	end
end

def lo(node)
	queue = []
	queue.push node
	while(not queue.empty?)
		node = queue.shift
		puts node.data
		if node.data == "X"
			next
		end
		if node.left
			queue.push node.left  
		else
			nil_node = Btnode.new("X")
			queue.push nil_node 
		end
		if node.right
			queue.push node.right  
		else
			nil_node = Btnode.new("X")
			queue.push nil_node 
		end
	end
end

$inorder_array = "abcdefghijklmno".split("")
mid = (0 + $inorder_array.size - 1)/2
value = $inorder_array[mid]
root = Btnode.new(value)
func(root,mid,0,($inorder_array.size - 1))
inorder(root)
puts
preorder(root)
puts
level_order_w(root)
puts
#lo(root)
