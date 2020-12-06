data = File.read("data.txt").split().to_a.map { |a| a.to_i }


def find_em (arr)
    arr.each do |val|
        comp = 2020 - val
        if arr.include?(comp)
            return val * comp
        end
    end
end

puts find_em(data)


