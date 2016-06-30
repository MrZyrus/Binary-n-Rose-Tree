#05-38040 José Cipagauta
#06-39883 Nicolas Mañan

module DFS
	def dfs	#dfs method, traverses the tree using Depth First Search
		q = [self]	#Using an array, the methods pop and push from ruby treat it as a stack
		while not q.empty? do
			r = q.pop
			r.each {|i| q.push(i)}
			yield r
		end
	end

	def fold(x)	#Traverses the array using dfs and applies the function passed by the implicit block
		self.dfs {|i| x = yield(i,x)}
		return x	#Returns a single value, of having applied the block with all the nodes in the tree
	end
end
