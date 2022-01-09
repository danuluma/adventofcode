# frozen_string_literal: true

data = File.readlines("#{__dir__}/data.txt").map(&:to_i)

rolling_sums = data[2..-1].zip(data[1..-2], data[0..-3]).map(&:sum)
newd = rolling_sums[1..-1].zip(rolling_sums[0..-2]).map { |a, b| (a - b).positive? }.count true

puts newd
