class Mutador
end

class Singular < Mutador
	def withFixnum(z)
		a = z.to_s.chars.map{|i| i.to_i}
		b = a.pop
		x = a.reduce(:+) {|i| x = x + i}
		return x * b if x != nil
		return b
	end

	def withString(z)
		a = []
		z.chars.each{|i| if ["s","i","n","g","u","l","a","r"].include?(i) then a.push(i.upcase) else a.push(i) end}
		return a.join
	end

	def withArray(z)
		return z.flatten.join(" ")
	end
end

class Uniforme < Mutador
	def withFixnum(z)
		a = z.to_s.chars.map{|i| i.to_i}
		b = a.pop
		a.each {|i| b = b + i}
		return (b.to_f / (a.size + 1)).round
	end

	def withString(z)
		a = []
		z.chars.each_index{|i| if i.odd? then a.push(z[i].upcase) else a.push(z[i].downcase) end}
		return a.join
	end

	def withArray(z)
		a = []
		z.each {|i| a.push(i.mutar(Uniforme))}
		return a
	end	
end

class Oscuro < Mutador
	def withFixnum(z)
		a = z.to_s.chars.map{|i| i.to_i}
		b = []
		a.each_index {|i| b.push(a[i]) if i.even?}
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
		a = []
		z.each_index {|i| if r.include?(i) then a.push(z[i].mutar(Oscuro)) else a.push(z[i]) end}
		return a
	end
end

class Fixnum
	def mutar(x)
		a = x.new
		return a.withFixnum(self)
	end
end

class String
	def mutar(x)
		a = x.new
		return a.withString(self)
	end
end

class Array
	def mutar(x)
		a = x.new
		return a.withArray(self)
	end
end
