# frozen_string_literal: true

data = File.read("#{__dir__}/data.txt")

def rcombat(p1, p2)
  track1 = []
  track2 = []
  while p1.count.positive? && p2.count.positive?
    return [p1, 1] if track1.count(p1.join).positive? && track2.count(p2.join).positive?

    track1 << p1.join
    track2 << p2.join
    r1 = p1.shift
    r2 = p2.shift
    if r1 <= p1.count && r2 <= p2.count
      sp1 = p1[0...r1]
      sp2 = p2[0...r2]
      _warr, winner = rcombat sp1, sp2

      case winner
      when 1
        p1 << r1
        p1 << r2
      when 2
        p2 << r2
        p2 << r1
      end

    elsif r1 > r2
      p1 << r1
      p1 << r2
    elsif r2 > r1
      p2 << r2
      p2 << r1
    end

  end
  p1.count.positive? ? [p1, 1] : [p2, 2]
end

def ccombat(data)
  p1, p2 = data.split("\n\n").map { |i| i.split("\n")[1..-1].map(&:to_i) }
  warr, _winner = rcombat p1, p2
  warr.reverse.each_with_index.map { |i, j| i * (j + 1) }.sum
end

p ccombat data
