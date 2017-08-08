# You are given coins of different denominations and a total amount of money amount. Write a function to compute the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.

# Example 1:
# coins = [1, 2, 5], amount = 11
# return 3 (11 = 5 + 5 + 1)

# Example 2:
# coins = [2], amount = 3
# return -1.

# Note:
# You may assume that you have an infinite number of each kind of coin.

# Credits:
# Special thanks to @jianchao.li.fighter for adding this problem and creating all test cases.

# @param {Integer[]} coins
# @param {Integer} amount
# @return {Integer}

def coin_change(coins, amount)
    results = Array.new(amount+1,amount+1)
    results[0] = 0
    for i in 0..amount do
        coins.each_with_index do |coin,index|
            if i + coin < amount + 1
                results[i+coin] = [results[i+coin],results[i]+1].min
            end
        end
    end
    return results[amount] == amount+1 ?-1:results[amount]
end

puts coin_change([1, 2, 5],11)