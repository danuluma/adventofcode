data = File.readlines("#{__dir__}/data.txt")


def check_valids(arr)
    valid = 0
    arr.each do |line|
        cond, char, str = line.split(" ")
        min, max = cond.split("-").map(&:to_i)
        c = char.split(":")[0]
        count = str.count c 
        if count >= min && count <= max
            valid +=1
        end
    end
    return valid
  
end


print(check_valids(data))



