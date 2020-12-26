data = File.read("#{__dir__}/test.txt").split("\n\n")

def prc(data)
  tiles = {}
  data.each do |d|
    sq = d.split("\n")
    title = sq[0].scan(/\d+/)[0].to_i
    px = sq[1..-1]
    top = px[0]
    bottom = px[-1]
    left = px.map { |t| t[0] }.join
    right = px.map { |t| t[-1] }.join

    tiles[title] = [top, bottom, left, right]
  end
  ps = tiles.filter_map do |k, v|
    others = tiles.values.filter { |i| i != v }.flatten
    c = 0
    v.each do |y|
      c += 1 if others.include?(y) || others.include?(y.reverse)
    end
    k if c == 2
  end
  ps.reduce(&:*)
end

p prc data
