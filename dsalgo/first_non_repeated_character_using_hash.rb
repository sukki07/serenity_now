array = ['a','b','x','d','a','b','c','d','c']
hash = Hash.new(0)
array.each do |ele|
	hash[ele]+=1
end

fnrc = nil
array.each do |ele|
	if hash[ele].eql?1
		fnrc = ele
		break
	end
end
puts fnrc
