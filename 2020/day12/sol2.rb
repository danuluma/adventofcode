data = File.readlines("#{__dir__}/data.txt").map {|i| [i[0], i.strip[1..-1].to_i]}

#############R
def manh_dist data
    snorth = 0
    seast = 0
    north = 1
    east = 10
    data.each do |(ins, val)|
        case ins
        when "N"
            north += val
        when "S"
            north -= val
        when "E"
            east += val
        when "W"
            east -= val
        when "R"
            (val.abs / 90).times do
                east, north = -1 * north, east    
              end
        when "L"
            (val.abs / 90).times do
                east, north = north, -1 * east       
              end
        when "F"
            snorth += (val * north)
            seast += (val * east)
        end
    end
    snorth.abs + seast.abs
end

puts manh_dist data
