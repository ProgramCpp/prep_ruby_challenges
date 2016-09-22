def next_friend(friend, count_of_friends, is_forward)
	if is_forward
		friend +=  1
		friend = 1 if friend > count_of_friends
	else
		friend -= 1
		friend = count_of_friends if friend == 0
	end
	return friend
end

def count_game_begin(count_of_friends, max_count)
	friend = 0
	is_forward = true	

	1.upto(max_count) do |n|
		friend = next_friend(friend, count_of_friends, is_forward)
		
		puts "#{friend} says #{n}" 
		is_forward = !is_forward if n%7 == 0

		friend = next_friend(friend, count_of_friends, is_forward) if n%11 == 0 
	end
end

#test
#count_game_begin(10, 100)