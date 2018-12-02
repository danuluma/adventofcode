list = Array.new

File.foreach("day1.txt") do |line|
    list << line.to_i
end

puts list.sum