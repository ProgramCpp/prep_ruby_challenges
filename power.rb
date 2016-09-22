def power(base, exp)
	res = 1
	exp.times do
		res *= base
	end
	return res
end

#test : positive integers
#puts power(2, 4)