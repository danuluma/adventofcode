data = File.readlines("#{__dir__}/data.txt").map {|i| [i[0], i.strip[1..-1].to_i]}


def manh_dist data
    north = 0
    east = 0
    curr_dir = 'E'
    co_ord = 90
    cmap = {
        0 => "N",
        90 => "E",
        180 => "S",
        270 => "W",
    }
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
        when "L"
            co_ord -= val
            curr_dir = cmap[co_ord % 360]
        when "R"
            co_ord += val
            curr_dir = cmap[co_ord % 360]
        when "F"
            case curr_dir
            when "N"
                north += val
            when "S"
                north -= val
            when "E"
                east += val
            when "W"
                east -= val
            end
        end
    end

    north.abs + east.abs
end

print manh_dist data