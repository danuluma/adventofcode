data = File.readlines("#{__dir__}/data.txt").map(&:to_i)


def enc_err dt, pr
    for i in pr...dt.size
        arr = dt[i-pr...i]
        return dt[i] unless arr.map { |n| !!(arr.include? (dt[i] - n)) }.any? true
    end
    return nil
end

puts enc_err data, 25
