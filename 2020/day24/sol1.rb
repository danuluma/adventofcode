# frozen_string_literal: true

data = File.readlines("#{__dir__}/data.txt").map(&:strip)

def llayout(data)
  hmap = {
    'e' => [+2, 0], 'ne' => [+1, -1], 'nw' => [-1, -1],
    'w' => [-2, 0], 'sw' => [-1, +1], 'se' => [+1, +1]
  }
  tiles = {}
  data.each do |line|
    row = 0
    col = 0
    until line.empty?
      if %w[w e].include? line[0]
        r1, c1 = hmap[line[0]]
        row += r1
        col += c1
        line.slice!(0, 1)
      elsif %w[nw ne sw se].include? line[0..1]
        r1, c1 = hmap[line[0..1]]
        row += r1
        col += c1
        line.slice!(0, 2)
      else
        p 'error jo! removing 1'
        line.slice!(0, 1)
      end
    end
    tiles[[row, col]] = tiles[[row, col]] == 'black' ? 'white' : 'black'
  end
  tiles.values.count 'black'
end

p llayout data
