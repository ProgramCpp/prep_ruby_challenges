def uniques(uniq)
	uniq.each_with_index do |v, i|
		for j in (i+1).upto(uniq.length - 1)
			if v == uniq[j]
				uniq.delete_at(j)
			end
		end
	end
	return uniq
end

#test 
#puts uniques([1,5,"frog", 2,1,3,"frog"])