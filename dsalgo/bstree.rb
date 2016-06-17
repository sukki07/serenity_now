require './btnode.rb'
class Bstree
	attr_accessor :root
	def add(data)
		node = Btnode.new(data)
		if not @root
			@root = node
		else
			add_node_to_subtree_of_current_node(@root,node)
		end
	end

	def add_node_to_subtree_of_current_node(current_node,node_to_be_added)
		if current_node.data == node_to_be_added.data 
			puts "not adding duplicate nodes #{node_to_be_added.data}"
		elsif node_to_be_added.data < current_node.data
			if(current_node.left)
				add_node_to_subtree_of_current_node(current_node.left,node_to_be_added)
			else
				#add here
				current_node.left = node_to_be_added
			end
		elsif node_to_be_added.data > current_node.data
			if(current_node.right)
				add_node_to_subtree_of_current_node(current_node.right,node_to_be_added)
			else
				#add here
				current_node.right = node_to_be_added
			end
		end
	end


	def print_node(node)
		print node.data,"->"
	end

	def print_inorder(node)
		if(node)
			print_node(node)
			print_inorder(node.left)
			print_inorder(node.right)
		else
			print "end"
		end
	end
	def print_breadthfirst_wrapper
		bfarray = []
		bfarray.push @root
		print_breadthfirst(bfarray)
	end

	def print_breadthfirst(bfarray)
		if bfarray.empty?
		else
			node = bfarray.shift
			print_node(node)
			if node.left
				bfarray.push node.left
			end
			if node.right
				bfarray.push node.right
			end
			print_breadthfirst(bfarray)
			
		end
	end

end

bstree = Bstree.new
bstree.add(4)
bstree.add(3)
bstree.add(1)
bstree.add(5)
bstree.add(6)
bstree.add(61)
bstree.add(34)
bstree.add(23)
bstree.add(64)
bstree.add(69)
#bstree.print_inorder(bstree.root)
puts
bstree.print_breadthfirst_wrapper
