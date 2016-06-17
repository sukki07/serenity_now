require './btnode.rb'
def find_index_of_value_in_in_array(value,begin_index,end_index)
	i = begin_index
	while i <= end_index
		if $inorder_array[i] == value 
			return i
		end
		i+=1
	end
	puts "value #{value} not found in in_array from index #{begin_index} to #{end_index}"
	return nil
end
#it worked first time without any issues , holy lord ! 

def func(node,subtree_node_index_in_array,subtree_begin_index,subtree_end_index)
	if subtree_begin_index == subtree_end_index
		#puts "leaf node begin #{subtree_begin_index} and end #{subtree_end_index}"
		#puts $inorder_array[subtree_begin_index]
	else
		$preorder_index = $preorder_index + 1
		left_subtree_node_value = $preorder_array[$preorder_index]
		left_subtree_node_index_in_array = find_index_of_value_in_in_array(left_subtree_node_value,subtree_begin_index,subtree_node_index_in_array - 1)
		left_node = Btnode.new($inorder_array[left_subtree_node_index_in_array])
		node.left = left_node
		func(left_node,left_subtree_node_index_in_array,subtree_begin_index,subtree_node_index_in_array - 1 )
		#puts "subtree node at #{$inorder_array[subtree_node_index_in_array]}"
		#puts $inorder_array[subtree_node_index_in_array]
		$preorder_index = $preorder_index + 1
		right_subtree_node_value = $preorder_array[$preorder_index]
		right_subtree_node_index_in_array = find_index_of_value_in_in_array(right_subtree_node_value,subtree_node_index_in_array + 1,subtree_end_index)
		right_node = Btnode.new($inorder_array[right_subtree_node_index_in_array]) 
		node.right = right_node
		func(right_node,right_subtree_node_index_in_array,subtree_node_index_in_array + 1,subtree_end_index)
	end
end

def in_order_traversal(node)
	if node == nil
	else
		in_order_traversal(node.left)
		puts node.data
		in_order_traversal(node.right)
	end
end

def post_order_traversal(node)
	if node == nil
	else
		post_order_traversal(node.left)
		post_order_traversal(node.right)
		puts node.data
	end
end


$preorder_index = 0

$inorder_array = "bac".split("")
$preorder_array = "abc".split("")
root = Btnode.new("a")
func(root,1,0,2)

#$inorder_array = "dbeafcg".split("")
#$preorder_array = "abdecfg".split("")
root = Btnode.new("a")
#func(root,3,0,6)

post_order_traversal(root)
