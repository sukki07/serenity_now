require './btnode.rb'
require './bstree.rb'
input_array = []
def add_to_bst(array)
	array.each do |data|
		btnode = Btnode.new(data)
		tree.attach_node_to_tree(btnode)
	end
end

