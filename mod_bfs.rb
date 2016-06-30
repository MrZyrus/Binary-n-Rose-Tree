module BFS
	def bfs
		q = Queue.new
		q.push(self)
		while not q.empty? do
			r = q.pop
			r.each {|i| q.push(i)}
			yield r
		end
	end

	def recoger(&block)
		return self.bfs.map {|i| i if block.call(i)}
	end
end
