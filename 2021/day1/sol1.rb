# frozen_string_literal: true

data = File.readlines("#{__dir__}/data.txt").map(&:to_i)

newd = data[1..-1].zip(data[0..-2]).map { |a, b| (a - b).positive? }.count true
puts newd
