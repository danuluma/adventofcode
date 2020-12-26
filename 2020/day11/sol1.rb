data = File.readlines("#{__dir__}/data.txt").map{ |r| r.strip.split('')}

def swap_char i, j, data
    up, down = i > 0 ? data[i-1][j] : 'X', data[i+1] ? data[i+1][j] : 'X'
    left, right =  j > 0 ? data[i][j-1] : 'X', data[i][j+1] || 'X'
    d1, d2 = (i > 0 && j > 0) ? data[i-1][j-1] : 'X', i > 0 ? (data[i-1][j+1] || 'X') : 'X'
    d3, d4 = (data[i+1] && j > 0) ? data[i+1][j-1] : 'X', data[i+1] ? (data[i+1][j+1] || 'X') : 'X'
    adj = [up, down, left, right, d1, d2, d3, d4]
    case data[i][j]
    when "L"
        return adj.count('#') == 0 ? "#" : "L"
    when "#"
        return adj.count('#') >= 4 ? "L" : "#"
    when "."
        return "."
    else
        return data[i][j]
    end
end


def count_occupied data
    res = Array.new(data.size) {Array.new(data[0].size)}
    data.each_with_index do |row, i|
        row.each_with_index do |char, j|
            res[i][j] = swap_char i, j, data
        end
    end
    count, initial = (res.flatten.count "#"), (data.flatten.count "#")
    return count if count == initial
    count_occupied res
end


print count_occupied data