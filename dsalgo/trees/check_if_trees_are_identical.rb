require './create_tree_from_inorder_array.rb'
def is_identical(subtree1_node,subtree2_node)
	if $flag == false
		return false
	end
	if subtree1_node and subtree2_node
		#p subtree1_node.data
		if subtree1_node.data == subtree2_node.data
			left_subtree_value_match = is_identical(subtree1_node.left,subtree2_node.left)
			if $flag
				right_subtree_value_match = is_identical(subtree1_node.right,subtree2_node.right)
			else
				return false
			end
			sub_tree_val = left_subtree_value_match && right_subtree_value_match
			$flag = sub_tree_val
		else
		        $flag = false #imp
			return false
		end
	elsif not subtree1_node and not subtree2_node
		return true #both are nil
	else
		$flag = false #imp
		return false #one is nil other is not
	end

end
array = "abcdefghijklmno".split("")
root1 = input_array_for_tree_creation(array)
Bstree.new.level_order_w(root1)
array = "abcdefghijklmno".split("")
root2 = input_array_for_tree_creation(array)
Bstree.new.level_order_w(root2)
$flag = true
puts is_identical(root1,root2)
