require_relative 'nodos.rb'
require_relative 'mod_bfs.rb'
require_relative 'mod_fold.rb'

class Tree
	include BFS
	include DFS

	@value

	def getter
		return @value
	end

	def setter(x)
		@value = x
	end

	def mutar(x)
		self.setter(self.getter.mutar(x))
	end
end

class ArbolBinario < Tree
	@left
	@right

	def initialize(x, l = nil, r = nil)
		@value = x
		@left = l
		@right = r
	end

	def each
		yield @left if @left
		yield @right if @right
	end
end

class ArbolRosa < Tree
	@childs

	def initialize(x, c = nil)
		@value = x
		@childs = c
	end

	def each
		@childs.each {|i| yield i} if @childs
	end
end