data = File.readlines("#{__dir__}/data.txt").map(&:strip)


def check_row s, r
    return r[0] if s.empty?
    mid = (r.size / 2).floor
    char = s.first
    if char == "F"
        crange = (r.first..r[mid]).to_a
        return check_row s.drop(1), crange
    elsif char == "B"
        crange = (r[mid]..r.last).to_a
        return check_row s.drop(1), crange
    end
end

def check_col s, r
    return r[0] if s.empty?
    mid = (r.size / 2).floor
    char = s.first
    if char == "L"
        crange = (r.first..r[mid]).to_a
        return check_col s.drop(1), crange
    elsif char == "R"
        crange = (r[mid]..r.last).to_a
        return check_col s.drop(1), crange
    end
end

def check_seat_id p
    rows = p[0..6].split('')
    cols = p[7..-1].split('')
    r_range = (0...128).to_a
    c_range = (0...8).to_a
    row = check_row rows, r_range
    col = check_col cols, c_range
    return (row * 8) + col
end

def check_missing dt
    seats = dt.map do |d|
        check_seat_id(d)
    end
    (seats.min..seats.max).to_a - seats
end

puts check_missing data
