# Question 1 -- sortByStrings(s,t): Sort the letters in the string s by the order they occur in the string t.
# You can assume t will not have repetitive characters.
# For s = "weather" and t = "therapyw", the output should be sortByString(s, t) = "theeraw".
# For s = "good" and t = "odg", the output should be sortByString(s, t) = "oodg".

def sortByStrings(s,t)
	# split the string into an array of chars
	o = s.split('').sort_by do |x|
	# split out the characters and map them using a custom index
		x.split('').map do |y|
	# use the custom index t to sort it
			t.index(y)
		end
	end
	# join the individual array of letters into a string
	o.join('')
end

p sortByStrings("weather","therapyw")
