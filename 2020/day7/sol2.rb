data = File.readlines("#{__dir__}/data.txt")

def colours_hash d
    d.filter_map do |l|
        color = l.split[0..1].join(' ')
        contained = l.split('contain')[1].split(',').filter_map do |i| 
            count =  i.split.first
            c = i.split[1..2].join(' ')
            [c, count] unless c == "other bags."
        end
        [color, contained]
    end
end

def find_bags search, hs
    res = hs.filter_map do |f| 
        f[1] if f[0] == search
    end.first
    return res
end

def search_data sum, init, hd
    tot = []
    while init.size > 0 
        t = init.shift
        tot << t
        e,f = t
        res = find_bags e, hd
        res.each do  |e,g| 
           init << [e, g.to_i*f]
        end
    end
    return tot.map { |m| m[1]}.sum
end

def find_shiny_gold dt
    hash = colours_hash dt
    res = search_data 0, [['shiny gold', 1]], hash 
    # Exclude the outer shiny gold bag from count
    return res - 1
end

puts find_shiny_gold data
