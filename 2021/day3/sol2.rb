# frozen_string_literal: true

data = File.readlines("#{__dir__}/data.txt").map { |i| i.strip.split('') }

def most_f(data)
  arr = Array.new(data[0].count) { [] }

  data.each do |list|
    list.each_with_index { |num, index| arr[index] << num }
  end
  arr.map { |list| list.count('1') >= list.count('0') ? 1 : 0 }
end

def least_f(data)
  arr = Array.new(data[0].count) { [] }

  data.each do |list|
    list.each_with_index { |num, index| arr[index] << num }
  end
  arr.map { |list| list.count('0') <= list.count('1') ? 0 : 1 }
end

def filter_m(arr, pos, most_common)
  return arr if arr.size == 1

  newd = arr.filter { |j| j[pos].to_i == most_common[pos] }
  return arr if newd.size.zero?

  most_common1 = most_f(newd)
  filter_m(newd, pos + 1, most_common1)
end

def filter_l(arr, pos, least_common)
  return arr if arr.size == 1

  newd = arr.filter { |j| j[pos].to_i == least_common[pos] }
  return arr if newd.size.zero?

  least_common1 = least_f(newd)
  filter_l(newd, pos + 1, least_common1)
end
most_common = most_f(data)
least_common = least_f(data)
ogen = filter_m(data, 0, most_common).max.join('').to_i(2)
scr = filter_l(data, 0, least_common).min.join('').to_i(2)

puts scr * ogen
