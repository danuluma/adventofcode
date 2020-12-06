data = File.readlines("#{__dir__}/data.txt")


def check_valids(arr)
    valid = 0
    arr.each do |line|
        cond, char, str = line.split(" ")
        first, second = cond.split("-").map {|a| a.to_i - 1}
        c = char.split(":")[0]
        if str[first] == c
            if str[second] != c
                valid +=1
            end
        elsif str[second] == c
            valid +=1
        end
    end
    return valid
  
end


puts check_valids(data)



