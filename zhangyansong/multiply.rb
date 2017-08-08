

# Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2.

# Note:

# The length of both num1 and num2 is < 110.
# Both num1 and num2 contains only digits 0-9.
# Both num1 and num2 does not contain any leading zero.
# You must not use any built-in BigInteger library or convert the inputs to integer directly.

# @param {String} num1
# @param {String} num2
# @return {String}
# def multiply(num1, num2)
#     array1 = num1.split("").reverse
#     array2 = num2.split("").reverse

#     result = Array.new(array1.count+array2.count,0)

#     array1.each_with_index do |n,i|
        
#         array2.each_with_index do |m,j|
#             p = n.to_i * m.to_i
#             p = result[i + j] + p

#             result[i + j] = p%10
#             result[i + j + 1] = result[i + j + 1]+ p/10

#         end
#     end

#     result = result.reverse
#     while result.count > 0 && result[0] == 0 
#         result.delete_at(0)
#     end
    
#     if result.count > 0
#         return result.join("")
#     else
#         return "0"
#     end
    
# end

def get_products_by_digits(num1, num2)
	products_by_digits = Array.new(num1.length + num2.length, 0)
	for i in 0...num1.length
		digit1 = num1[i].to_i
		for j in 0...num2.length
			digit2 = num2[j].to_i
			products_by_digits[i + j] += digit1 * digit2
		end
	end
	products_by_digits
end

def process_carry(products_by_digits)
	# puts products_by_digits
	for i in 0...(products_by_digits.length - 1)
		v = products_by_digits[i]
		products_by_digits[i + 1] += v / 10

		products_by_digits[i] = v % 10
	end
	products_by_digits
end


def multiply(num1, num2)
	return '0' if num1 == '0' || num2 == '0'
	num1 = num1.reverse
	num2 = num2.reverse
	products_by_digits = get_products_by_digits(num1, num2)
	products_by_digits = process_carry(products_by_digits)
	products_by_digits.pop if products_by_digits.last == 0
	products_by_digits.join('').reverse
end
puts multiply("123","456")