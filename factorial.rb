def factorial(n)
	res = 1
	(2).upto(n) do |val|
		res *= val
	end
	return res
end

#test: positive integer
#puts factorial(5)