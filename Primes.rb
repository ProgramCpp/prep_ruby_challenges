def is_prime?(num)
	(num/2).downto(2) do |n|
		return false if num%n == 0
	end
	return true
end

#test
#puts is_prime?(7)

#test
#puts is_prime?(14)