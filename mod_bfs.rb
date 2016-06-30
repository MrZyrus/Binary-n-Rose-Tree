module BFS
	def bfs	#bfs method, traverses the tree using Breadth First Search
		q = Queue.new	#Easy implementation using a queue
		q.push(self)	#Start with the root node
		while not q.empty? do
			r = q.pop
			r.each {|i| q.push(i)}	
			yield r
		end
	end

	def recoger(block)	#Traverses the tree using bfs then returns an array, notice block is explicit
		a = []
		self.bfs {|i| a.push(i) if block.call(i)}	#The array returned is just the nodes which obey the block sent
		return a
	end
end
