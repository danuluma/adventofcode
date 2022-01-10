# frozen_string_literal: true

data = File.readlines("#{__dir__}/data.txt").map { |i| i.strip.split('') }

arr = [[], [], [], [], []]
# arr = Array.new(5, [])

data.each do |arr1|
  arr1.each_with_index { |num, index| arr[index] << num }
end

gamma = arr.map { |list| list.count('0') > list.count('1') ? 0 : 1 }.join('').to_i(2)
epsilon = arr.map { |list| list.count('0') < list.count('1') ? 0 : 1 }.join('').to_i(2)

puts epsilon * gamma
# print arr
