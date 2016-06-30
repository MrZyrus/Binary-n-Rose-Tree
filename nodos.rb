class Mutador
end

class Singular < Mutador
	def withFixnum(z)
		a = z.to_s.chars.map {|i| i.to_i}
		b = a.pop
		x = a.reduce(:+)
		return x * b if x != nil
		return b
	end

	def withString(z)
		a = z.chars.each.map {|i| if ["s","i","n","g","u","l","a","r"].include?(i) then i.upcase else i end}
		return a.join
	end

	def withArray(z)
		return z.flatten.join(" ")
	end
end

class Uniforme < Mutador
	def withFixnum(z)
		a = z.to_s.chars.map {|i| i.to_i}
		return (a.reduce(:+).to_f / a.size).round
	end

	def withString(z)
		a = z.chars.each_index.map {|i| if i.odd? then z[i].upcase else z[i].downcase end}
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

class Fixnum
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
