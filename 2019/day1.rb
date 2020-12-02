fuels = []

def calc_fuel f, i
    x = f/3 - 2
    if x > 6
        x += calc_fuel x, x
    end
    return x
end
File.foreach("day1.txt") do |line|
    fuels << calc_fuel(line.to_i, 0)
end


puts fuels.sum
