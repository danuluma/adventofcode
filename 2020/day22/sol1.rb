# frozen_string_literal: true

data = File.read("#{__dir__}/data.txt")

def ccombat(data)
  p1, p2 = data.split("\n\n").map { |i| i.split("\n")[1..-1].map(&:to_i) }
  while p1.count.positive? && p2.count.positive?
    r1 = p1.shift
    r2 = p2.shift
    if r1 > r2
      p1 << r1
      p1 << r2
    elsif r2 > r1
      p2 << r2
      p2 << r1
    end
  end
  wplayer = p1.count.positive? ? p1 : p2

  wplayer.reverse.each_with_index.map { |i, j| i * (j + 1) }.sum
end

p ccombat data
