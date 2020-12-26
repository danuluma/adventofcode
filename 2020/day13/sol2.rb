data = File.readlines("#{__dir__}/data.txt")

## Slow
def ss(data)
  buses1 = data[1].split(',').each_with_index.filter { |i, _j| i[0] != 'x' }.map { |i, j| [i.to_i, j] }

  buses2 = buses1.sort_by(&:first).reverse
  buses = buses2.map { |i, j| [i, j - buses2[0][1]] }
  start = buses[0][0]

  loop do
    res = buses.map { |i, j| ((start + j) % i).zero? }.all? true
    return start - buses2[0][1] if res == true

    start += buses[0][0]
  end
end

def ss1(data)
  dt = data[1].split(',').map(&:to_i)
  vhash = {
    dt[0] => [dt[0], dt[0]]
  }

  prev = 0
  dt.each_with_index do |i, j|
    next if i.zero? || j.zero?

    start, step = vhash[dt[prev]]
    res = []
    while res.size < 2
      res << start if ((start + j) % i).zero?
      start += step
    end
    vhash[i] = [res[0], res[1] - res[0]]

    prev = j
  end
  vhash[dt.last].first
end

puts ss1 data
