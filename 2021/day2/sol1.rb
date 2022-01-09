# frozen_string_literal: true

data = File.readlines("#{__dir__}/data.txt").map(&:split)

distances = data.each_with_object({}) do |(key, val), obj|
  obj[key] ? obj[key] += val.to_i : obj[key] = val.to_i
end

res = distances['forward'] * (distances['down'] - distances['up'])

puts res
