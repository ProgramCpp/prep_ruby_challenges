def combinations (first, second)
	res = []
	first.each do |f|
		second.each do |s|
			res << f + s
		end
	end
	return res
end

#test
#puts combinations(["on","in"],["to","rope"])