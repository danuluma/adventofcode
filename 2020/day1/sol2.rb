data = File.read("#{__dir__}/data.txt").split().to_a.map { |a| a.to_i }


def find_three (arr)
    arr.each_with_index do |val, index|
        other_two = 2020 - val
        arr.delete_at(index) && arr.each do | val2 | 
            val3 = other_two - val2
            if arr.include?(val3)
                return val * val2 * val3
            end
        end
    end
end

print(find_three(data))



