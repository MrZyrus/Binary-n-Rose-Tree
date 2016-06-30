module DFS
	def dfs
		q = [self]
		while not q.empty? do
			r = q.pop
			r.each {|i| q.push(i)}
			yield r
		end
	end

	def fold(x)
		self.dfs {|i| x = yield(i,x)}
		return x
	end
end
