data = File.readlines("#{__dir__}/data.txt")


def find_next ins, inp, currl
    case ins
    when 'nop'
        return currl + 1, 0
    when 'acc'
        return currl + 1, inp.to_i
    when 'jmp'
        return currl + inp.to_i, 0
    end
end


def last_g_value dt
    done = []
    nextl = 0
    gl = 0
    while true
        break if !!(done.include? nextl)          
        done << nextl
        ins, inp = dt[nextl].split
        res, add = find_next ins, inp, nextl
        nextl = res
        gl += add
    end
    return gl
end

puts last_g_value data
