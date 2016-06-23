require './create_tree_from_inorder_array.rb'
require './bstree.rb'
#array = "abcdefghijklmn".split("")
#root = input_array_for_tree_creation(array)
n1  = Btnode.new(1)
n2 = Btnode.new(2)
n3 = Btnode.new(3)
n4 = Btnode.new(4)
n5 = Btnode.new(5)
n6 = Btnode.new(6)

n1.left = n2
n2.left = n3
n2.right = n4
n3.left = n5
n4.right = n6
Bstree.new.level_order_w(n1)


def diameter(node)
	if node == nil
		return 0
	else
		left_subtree_height = diameter(node.left)
		right_subtree_height = diameter(node.right)
		max_of_l_and_r =  [left_subtree_height,right_subtree_height].max
		diameter_of_tree_at_current_node = left_subtree_height + right_subtree_height + 1
		if diameter_of_tree_at_current_node > $global_diameter
			$global_diameter = diameter_of_tree_at_current_node
			puts "diameter at #{node.data} is #{diameter_of_tree_at_current_node}"
		end
		return max_of_l_and_r + 1
	end
end
$global_diameter = 0
diameter(n1)

