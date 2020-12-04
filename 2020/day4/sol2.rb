data = File.read("#{__dir__}/data.txt").split(/\s{2,}/).map(&:split)

req_keys = ["byr" ,
    "iyr" ,
    "eyr" ,
    "hgt" ,    "hcl" ,
    "ecl" ,
    "pid"
]


def validate pdata
    vals = pdata.map { |i| i.split(":")}
    vals = vals.to_h
    return false if (vals["byr"].to_i < 1920 || vals["byr"].to_i > 2002)
    return false if (vals["iyr"].to_i < 2010 || vals["iyr"].to_i > 2020)
    return false if (vals["eyr"].to_i < 2020 || vals["eyr"].to_i > 2030)
    return false if !vals["hgt"].match(/[cm|in]$/)
    if vals["hgt"].match(/cm$/)
        hgt = vals["hgt"].to_i
        return false if hgt < 150 || hgt > 193
    elsif vals["hgt"].match(/in$/)
        hgt = vals["hgt"].to_i
        return false if (hgt < 59 || hgt > 76)
    end

    return false if !vals["hcl"].match(/^#([a-f\d]){6,6}$/)
        
    return false if !["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].include?(vals["ecl"].strip)
        
    return false if !vals["pid"].match(/^\d{9,9}$/) 
    
    return true
end


def count_valid dt, r
    valid = 0
    dt.each do |pass|
        keys = pass.map { |i| i.split(":")[0]}
        valid +=1 if (r - keys).empty? && validate(pass)
    end
    return valid
end


puts count_valid data, req_keys



