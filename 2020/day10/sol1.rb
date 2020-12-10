require 'matrix'
data = File.readlines("#{__dir__}/data.txt").map(&:to_i).sort

def count_jolts data
    data2 = data.dup
    data.unshift(0)
    data2 << data.last + 3
    res = (Matrix[data2] - Matrix[data]).to_a.first
    (res.count 3) * (res.count 1)
end

print count_jolts data