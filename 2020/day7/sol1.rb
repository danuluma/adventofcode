require 'set'

data = File.readlines("#{__dir__}/data.txt")

def colours_hash d
    d.map do |l|
        color = l.split[0..1].join(' ')
        contained = l.split('contain')[1].split(',').filter_map do |i| 
            c = i.split[1..2].join(' ')
            c unless c == "other bags."
        end
        {"#{color}": contained}
    end
end

def find_bags curr, search, hs
    cdir = search.filter_map do |e|
        others = hs.filter_map do |k|
            k.keys[0] if k.values[0].include? "#{e}"
        end
        others if others.size > 0
    end.flatten.to_set.to_a
    return curr if cdir.empty?
    return find_bags (cdir + curr).to_set.to_a, cdir, hs
end

def find_shiny_gold dt
    hash = colours_hash dt
    res = find_bags [], ['shiny gold'], hash 
    return res.size
end

puts find_shiny_gold data
# puts data.size



