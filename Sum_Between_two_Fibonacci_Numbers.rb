# SUM of F(0)...F(b) = F(b + 2) - 1
def test(expected_answer, result)
  if expected_answer == result
    puts "Correct!"
  else
    "Result: #{result}"
  end
end
def determine_pattern_mod_10(array)
  i = array.length

  current_value = (array[i - 1] + array[i - 2]) % 10

  array.push(current_value)
  if array[i] == 1 && array[i - 1] == 0
    return array
  else
    determine_pattern_mod_10(array)
  end
end

def last_digits_of_sum(a, b, array)

  pattern = determine_pattern_mod_10([0, 1, 1])

  length_of_pattern = pattern.length - 2

  last_digit_of_b = (b + 2) % length_of_pattern
  last_digit_of_a = (a + 1) % length_of_pattern

  # takes into consider if last digit of b < last digit of a
  total = pattern[last_digit_of_b] + 10
  extra = pattern[last_digit_of_a]

  # need to account if the total sum's last digit is 0
  (total - extra) % 10
end

def last_digit_sum_between_two_Fibonacci_numbers(array, a, b)
  # account if b = 0 && b = 1
  return 0 if a == 0 && b == 0
  return 1 if a == 0 && b == 1
  result = last_digits_of_sum(a, b, array)
end

# total run time: 0.136s
array = [0, 1, 1]
a = 30
b = 45
expected_answer = 4
result = last_digit_sum_between_two_Fibonacci_numbers(array, a, b)
puts test(expected_answer, result)
