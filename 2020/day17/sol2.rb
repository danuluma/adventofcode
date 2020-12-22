# frozen_string_literal: true

data = File.readlines("#{__dir__}/data.txt").map { |i| i.strip.split('') }

def ccubes(data)
  hs = {}
  iter = 6
  data.each_with_index do |row, i|
    row.each_with_index do |el, j|
      hs[[i, j, 0, 0]] = el
    end
  end

  diffs = [-1, 0, 1].repeated_permutation(4).to_a.filter { |i| i != [0, 0, 0, 0] }

  iter.times do |i|
    mmh = []
    hs.each_key { |point| diffs.each { |d| mmh << d.each_with_index.map { |i, j| i + point[j] } } }
    nbs = (mmh.uniq - hs.keys)
    nbs.each do |n|
      hs[n] = '.'
    end
    h1 = hs.dup

    h1.each_key do |point|
      nbs = diffs.map { |d| d.each_with_index.map { |i, j| i + point[j] } }
      c = nbs.filter { |j| h1[j] == '#' }.count
      if h1[point] == '#'
        hs[point] = '.' unless [2, 3].include? c
      elsif c == 3
        hs[point] = '#'
      end
    end
    return (hs.values.count '#') if i == iter - 1
  end
end

p ccubes data
