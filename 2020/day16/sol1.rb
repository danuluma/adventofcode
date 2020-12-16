data = File.readlines("#{__dir__}/data.txt")

def tser(data)
  rules = data[0...20].map do |i|
    i.scan(/\d+-\d+/).map do |m|
      start, stop = m.split('-')
      (start.to_i..stop.to_i).to_a
    end
  end.flatten.uniq
  data[25..-1].map do |n|
    n.split(',').filter_map do |e|
      e.to_i unless rules.include? e.to_i
    end
  end.flatten.sum
end
p tser data
