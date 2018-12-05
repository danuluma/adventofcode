f = File.read("data.txt").split().to_a

twos = 0
threes = 0
f.each do |line|
  l = line.split('').to_a
  l.uniq.each do |xter|
    count = l.count(xter)
    if count ==3
      threes += 1
    elsif count==2
      twos += 1
    end
  end
end
puts twos*threes
