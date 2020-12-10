data = File.readlines("#{__dir__}/data.txt").map(&:to_i)


def enc_err dt, pr
    for i in pr...dt.size
        arr = dt[i-pr...i]
        return dt[i] unless arr.map { |n| !!(arr.include? (dt[i] - n)) }.any? true
    end
    return nil
end

def enc_weakness data, pr
    num = enc_err data, pr
    for i in 0...data.size
        list = []
        j = i
        while list.sum < num
            list << data[j]
            j += 1
            if list.sum == num && list.size > 1
                return list.min + list.max
            end
        end
    end
    return nil
end

puts enc_weakness data, 25


