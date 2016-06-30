#05-38040 José Cipagauta
#06-39883 Nicolas Mañan

class Mutador	#Super class
end

class Singular < Mutador
	def withFixnum(z)	#Method with fixnum
		a = z.to_s.chars.map {|i| i.to_i}
		b = a.pop
		x = a.reduce(:+)
		return x * b if x != nil
		return b
	end

	def withString(z)	#With strings
		a = z.chars.each.map {|i| if ["s","i","n","g","u","l","a","r"].include?(i) then i.upcase else i end}
		return a.join
	end

	def withArray(z)	#With arrays
		return z.flatten.join(" ")
	end
end

class Uniforme < Mutador	#All of these classes are basically the same, methods with the defined types
	def withFixnum(z)	#The actual way of mutate was as asked. Do notice all mutators return a value of the same type
		a = z.to_s.chars.map {|i| i.to_i}
		return (a.reduce(:+).to_f / a.size).round
	end

	def withString(z)
		a = z.chars.each_index.map {|i| if i.even? then z[i].upcase else z[i].downcase end}
		return a.join
	end

	def withArray(z)
		return z.each.map {|i| i.mutar(Uniforme)}
	end
end

class Oscuro < Mutador
	def withFixnum(z)
		a = z.to_s.chars.map {|i| i.to_i}
		b = a.each_index.map {|i| a[i] if i.even?}
		return b.join.to_i
	end

	def withString(z)
		a = []
		b = []
		z.chars.each_index {|i| if i.odd? then a.push(z[i]) else b.push(z[i]) end}
		return (a + b).join
	end

	def withArray(z)
		r = (0..z.size-1).to_a.sample(z.size/2)
		return z.each_index.map {|i| if r.include?(i) then z[i].mutar(Oscuro) else z[i] end}
	end
end

class Fixnum	#Extending the classes, so they can mutate, notice the value isn't actually changed though, can't change self.
	def mutar(x)
		return x.new.withFixnum(self)
	end
end

class String
	def mutar(x)
		return x.new.withString(self)
	end
end

class Array
	def mutar(x)
		return x.new.withArray(self)
	end
end
