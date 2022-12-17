# frozen_string_literal: true

data = File.read("#{__dir__}/data.txt").split("\n\n")

res = data.map { |a| a.split("\n").map(&:to_i).sum }

p res.max
