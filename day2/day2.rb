f = File.read("data.txt").split().to_a

twos = 0
threes = 0
f.each do |line|
  three = false
  two = false
  l = line.split('').to_a
  l.uniq.each do |xter|
    count = l.count(xter)
    three = true if count ==3
    two = true if count==2
  end
  twos +=1 if two
  threes +=1 if three

end
puts twos*threes
