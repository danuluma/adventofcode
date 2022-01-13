# frozen_string_literal: true

data = File.readlines("#{__dir__}/data.txt").map { |i| i.strip.split('') }

arr = Array.new(data[0].count) { [] }

data.each do |list|
  list.each_with_index { |num, index| arr[index] << num }
end

gamma = arr.map { |list| list.count('0') > list.count('1') ? 0 : 1 }.join('').to_i(2)
epsilon = arr.map { |list| list.count('0') < list.count('1') ? 0 : 1 }.join('').to_i(2)

puts epsilon * gamma
