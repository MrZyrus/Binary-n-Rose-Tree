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
		a = []
		self.bfs {|i| a.push(i) if block.call(i)}
		return a
	end
end
