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

def swap_entry i, data
    typ, val = data[i].split
    case typ
    when 'nop'
        data[i] = ['jmp', val].join(' ')
        return data
    when 'acc'
        return data
    when 'jmp'
        data[i] = ['nop', val].join(' ')
        return data
    end
end


def last_g_value dt
    done = []
    nextl = 0
    gl = 0
    acc = true
    while true
        break if !!(done.include? nextl)
        if nextl == dt.size
            acc = false
            break
        end
        done << nextl
        ins, inp = dt[nextl].split
        res, add = find_next ins, inp, nextl
        nextl = res
        gl += add         
    end
    return acc, gl
end

def swap_one data
    for i in 0...data.size do
        swapped = swap_entry i, data.dup
        bool, gl = last_g_value swapped
        return gl if !bool            
    end
    return nil
end


puts swap_one data
