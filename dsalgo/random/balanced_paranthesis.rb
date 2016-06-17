string = "((((((())"
array = string.split("")
stack = []
offending = false
array.each_with_index do |char,index|
	if char=="("
		stack.push char
	else
		if stack.size > 0
			stack.pop
		else
			p "offending char at index #{index}"
			offending = true
			break
		end
	end
end
if offending.eql?true
	p "unbalanced"
elsif stack.empty?
	p "balanced"
else
	p "unbalanced"
end
