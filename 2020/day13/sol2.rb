data = File.readlines("#{__dir__}/data.txt")


## Slow
def ss data
    buses1 = data[1].split(',').each_with_index.filter {|i, j|  i[0] != 'x' }.map { |i, j| [i.to_i, j]}

    buses2 = buses1.sort_by(&:first).reverse
    buses = buses2.map {|i, j| [i, j - buses2[0][1]]}
    start = buses2[0][0]

    while true
        res = buses.map { |i,j| (start + j) % i == 0}.all? true

        if res == true
            return start - buses2[0][1]
            exit
        end
        start += buses[0][0]
    end
end

puts ss data

