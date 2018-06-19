# Question 3 -- changePossibilities(amount,amount): Your quirky boss collects rare, old coins. 
# They found out you're a programmer and asked you to solve something they've been wondering for a long time. 

# Write a function that, given an amount of money and an array of coin denominations, computes the number of ways to make the amount of money with coins of the available denominations. 

# Example: for amount=4 (4¢) and denominations=[1,2,3] (1¢, 2¢ and 3¢), your program would output 4—the number of ways to make 4¢ with those denominations: 

# 1¢, 1¢, 1¢, 1¢
# 1¢, 1¢, 2¢
# 1¢, 3¢
# 2¢, 2¢

# def changePossibilities(amount, denominations, temp=[], counter = 0)
# 	x = temp.reduce(:+)

# 	if x == amount
# 		counter = counter + 1
# 	end

# 	if x >= amount
# 		return
# 	end

# 	for i in (0..(denominations.length - 1)) do
# 		y = denominations[i]
# 		remain = denominations.drop(i + 1)
# 		changePossibilities(remain, denominations, temp + [y], counter = counter)
# 	end
# 	p counter
# end

# p changePossibilities(4, [1,2,3])


def count(denominations, coins_to_use=(denominations.length - 1), amount) 
  #add to count if change is made
  return 1 if amount === 0
  #if there are no coin denominations left to check but we still have change, or if the amount is negative 
  return 0 if coins_to_use < 0 || amount < 0

  count(denominations, coins_to_use, (amount - denominations[coins_to_use])) + count(denominations, coins_to_use-1, amount)
  
end

#bottom up memoization
def count(denominations, amount)
	#create array of 0s, with as many spots as the amount number
	way_to_change = Array.new((amount+1), 0)
	way_to_change[0] = 1
	#create a sort of memoization table
	denominations.each do |coin|
		#for each coin we have available, including one the same as total
		(coin..amount).each do |i|
			#add the number of ways you can make change including that coin, plus the number of ways excluding that coin (stops repeat work)
			way_to_change[i] += way_to_change[i-coin]
		end
	end
	way_to_change[amount]
end

p count([1,2,3], 4)