# Question 2 -- decodeString(s): Given an encoded string, return its corresponding decoded string.

# The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is repeated exactly k times. 
# Note: k is guaranteed to be a positive integer.

# For s = "4[ab]", the output should be decodeString(s) = "abababab"
# For s = "2[b3[a]]", the output should be decodeString(s) = "baaabaaa"

def decodeString(s)
	x = s.gsub(/(\w*)(\d)\[(\w*)\]/) {|y| scanner(y)}
	if scanner(x).empty?
		x
	else
		scanner(x)
	end
end

def scanner(z)
    arr = z.scan(/(\w*)(\d)\[(\w*)\]/)
    arr.map do |a|
	    b = a.pop
	    c = a.pop.to_i
	    a.push(b * c)
	 end
	 arr.flatten.join('')
end

p decodeString("4[ab]")
p decodeString("2[b3[a]]")
p decodeString("2[a3[b2[a]]]")
