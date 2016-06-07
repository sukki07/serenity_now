require './min_heap.rb'
heap = MinHeap.new
i = 10
while i > 0
	heap.insert i
	i-=1
end

heap.see_heap
