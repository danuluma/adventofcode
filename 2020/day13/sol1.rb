data = File.readlines("#{__dir__}/data.txt")

def ss data
    earliest = data[0].to_i
    buses = data[1].split(',').filter {|i| i!= 'x'}
    bus = buses.map { |i| i.to_i - (earliest % i.to_i) }
    buses[bus.index(bus.min)].to_i * bus.min
end

print ss data
