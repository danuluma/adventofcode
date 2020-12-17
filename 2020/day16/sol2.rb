data = File.readlines("#{__dir__}/data.txt")

def tser(data)
  rn = data[0..19].map do |i|
    i.scan(/\d+-\d+/).map do |m|
      start, stop = m.split('-')
      [start.to_i, stop.to_i]
    end
  end
  rules = rn.map { |i| i.map { |k, j| (k..j).to_a } }.flatten.uniq

  dt = data[26..-1].map { |l| l.split(',').map(&:to_i) }
  res = dt.filter_map do |n|
    n if n.filter_map do |e|
      e.to_i unless rules.include? e.to_i
    end.empty?
  end
  yourt = data[22].split(',').map(&:to_i)
  res << yourt

  t = res.transpose

  thash = {}
  rn.size.times do |i|
    thash[i] = []
  end

  t.each_with_index do |m, n|
    rn.each_with_index do |l, i|
      if m.map do |j|
        (j >= l[0][0] && j <= l[0][1]) || (j >= l[1][0] && j <= l[1][1]) ? true : false
      end.all? true
        thash[n] << i
      else
        next
      end
    end
  end

  rash = {}
  del = nil
  x = 0
  while x < 20
    thash.each do |k, v|
      next unless v.size == 1

      rash[k] = v[0]
      del = v[0]
    end
    unless del.nil?
      thash.each do |k, v|
        thash[k] = v.filter { |l| l != del }
      end
      del = nil
    end
    x += 1
  end

  f_ordered = []
  rash.invert.each do |i, j|
    f_ordered[i] = yourt[j]
  end

  f_ordered[0..5].reduce(&:*)
end
p tser data
