data = File.readlines("#{__dir__}/data.txt").map{ |r| r.strip.split('')}
###Very verbose but...

def look_up i, j, data
    c = 1
    while c > 0    
        if i-c >= 0 
            return data[i-c][j] if data[i-c][j] != '.'  
        else        
            return 'X'
        end
        c +=1
    end
    
end

def look_down i, j, data
    c = 1
    while c > 0
        if !!(data[i+c]) 
            return data[i+c][j] if data[i+c][j] != '.'  
        else
            return 'X'
        end
        c +=1
    end
end

def look_left i, j, data
    c = 1
    while c > 0
        if j-c >= 0
            return data[i][j-c] if data[i][j-c] != '.'  
        else
            return 'X'
        end
        c +=1
    end
end
def look_right i, j, data
    c = 1
    while c > 0
        if !!(data[i][j+c])
            return data[i][j+c] if data[i][j+c] != '.'  
        else
            return 'X'
        end
        c +=1
    end
end

def look_d1 i, j, data
    c = 1
    while c > 0
        if i-c >= 0 && j-c >= 0
            return data[i-c][j-c] if data[i-c][j-c] != '.'  
        else
            return 'X'
        end
        c +=1
    end
end

def look_d2 i, j, data
    c = 1
    while c > 0
        if i-c >= 0 && !!(data[i-c][j+c])
            return data[i-c][j+c] if data[i-c][j+c] != '.'  
        else
            return 'X'
        end
        c +=1
    end
end

def look_d3 i, j, data
    c = 1
    while c > 0
        if !!(data[i+c]) && j-c >= 0
            return data[i+c][j-c] if data[i+c][j-c] != '.'  
        else
            return 'X'
        end
        c +=1
    end
end

def look_d4 i, j, data
    c = 1
    while c > 0
        if !!(data[i+c]) && !!(data[i+c][j+c])
            return data[i+c][j+c] if data[i+c][j+c] != '.'  
        else
            return 'X'
        end
        c +=1
    end
end

def swap_char i, j, data
    up, down = (look_up i,j,data), (look_down i,j,data)
    left, right =  (look_left i,j,data), (look_right i,j,data)
    d1, d2 = (look_d1 i,j,data), (look_d2 i,j,data)
    d3, d4 = (look_d3 i,j,data), (look_d4 i,j,data)
    adj = [up, down, left, right, d1, d2, d3, d4]
    case data[i][j]
    when "L"
        return adj.count('#') == 0 ? "#" : "L"
    when "#"
        return adj.count('#') >= 5 ? "L" : "#"
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