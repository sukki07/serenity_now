require './btnode.rb'
#Essence use return values to communicate information about subtrees to parent nodes 
def find_lca(node,element1,element2)
	if node == nil
		return {:element1=>false,:element2=>false}
	elsif node == element1
		return {:element1=>true,:element2=>false}
	elsif node == element2
		return {:element1=>false,:element2=>true}
	else
		left_subtree_result = find_lca(node.left,element1,element2)
		right_subtree_result = find_lca(node.right,element1,element2)
		p "#{node.data} #{left_subtree_result} #{right_subtree_result}"
		if left_subtree_result[:element1] == true and right_subtree_result[:element2] == true
			$lca_node = node
			return {:element1=>true,:element2 => true}
		elsif left_subtree_result[:element2] == true and right_subtree_result[:element1] == true
			$lca_node = node
			return {:element1=>true,:element2 => true}
		elsif left_subtree_result[:element1] == true or right_subtree_result[:element1] == true #or condition took long time
			return {:element1=>true,:element2 => false}
		elsif left_subtree_result[:element2] == true or right_subtree_result[:element2] == true
			return {:element1=>false,:element2 => true}
		else
			return {:element1=>false,:element2 => false}
		end
	end
end
n1 = Btnode.new(1)
n2 = Btnode.new(2)
n3 = Btnode.new(3)
n4 = Btnode.new(4)
n5 = Btnode.new(5)
n1.left = n2
n1.right = n3
n2.right = n4
n3.left = n5
$lca_node = nil
find_lca(n1,n4,n5)
puts $lca_node.data
