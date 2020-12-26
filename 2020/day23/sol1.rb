# frozen_string_literal: true

data = File.readlines("#{__dir__}/data.txt").map(&:to_i)

def ccups(data)
  cups = data.to_s.split('').map(&:to_i)
  100.times do |i|
    curr = i % cups.count
    ccup = cups[curr]
    tcups = []
    if cups.count - curr > 3
      tcups = cups.slice!(curr + 1, 3)
    else
      diff = cups.count - (curr + 1)
      p1 = cups.slice!(curr + 1, diff)
      p2 = cups.slice!(0, 3 - diff)
      tcups = p1 + p2
    end
    dest = ccup - 1

    dest -= 1 while tcups.include?(dest)
    dest = cups.max if dest < cups.min

    dindex = cups.index(dest)

    cups.insert(dindex + 1, tcups).flatten!

    diff = (cups.index(ccup) - i) % cups.count

    cups.dup.each_with_index { |c, j| cups[j - diff] = c }
  end
  (cups[cups.index(1) + 1..-1] + cups[0...cups.index(1)]).join('')
end

p ccups data[0]
