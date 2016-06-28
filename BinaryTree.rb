require_relative 'BFS.rb'
require_relative 'DFS.rb'

class BinaryTree
	include BFS
	include DFS

	@get_value
	@left
	@right

	def initialize(x, l = nil, r = nil)
		@value = x
		@left = l
		@right = r
	end

	def getter()
		return @value
	end

	def setter(x)
		@value = x
	end

	def each
		yield @left if @left
		yield @right if @right
	end
end