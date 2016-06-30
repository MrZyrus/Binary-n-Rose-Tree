#05-38040 José Cipagauta
#06-39883 Nicolas Mañan

require_relative 'nodos.rb'
require_relative 'mod_bfs.rb'
require_relative 'mod_fold.rb'

class Tree	#Super class, since all trees have common stuff, notice these aren't actually trees, they're more like nodes.
	include BFS
	include DFS

	@value

	def valor
		return @value
	end

	def setter(x)
		@value = x
	end

	def mutar(x)	#Now here, we can mutate trees, when you mutate trees, we actually change the values.
		self.setter(self.valor.mutar(x))	#So we use the setter.
	end
end

class ArbolBinario < Tree
	@left	#Binary trees only have two childs.
	@right

	def initialize(x, l = nil, r = nil)	#nil childs if no childs.
		@value = x
		@left = l
		@right = r
	end

	def each	#Just return both childs in order, left then right, only if they exist.
		yield @left if @left
		yield @right if @right
	end
end

class ArbolRosa < Tree
	@childs	#Rose trees have an array of childs, any number of them.

	def initialize(x, *c)	#No childs means empty array.
		@value = x
		@childs = c
	end

	def each	#This one is simpler, just return the elements of the array.
		@childs.each {|i| yield i} if @childs
	end
end
