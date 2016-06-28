require_relative 'BFS.rb'
require_relative 'DFS.rb'

class RoseTree
	include BFS
	include DFS

	@value
	@childs

	def initialize(x, c = nil)
		@value = x
		@childs = c
	end

	def getter()
		return @value
	end

	def setter(x)
		@value = x
	end

	def each
		@childs.each {|i| yield i} if @childs
	end
end