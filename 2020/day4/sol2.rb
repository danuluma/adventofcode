data = File.read("#{__dir__}/data.txt").split(/\s{2,}/).map(&:split)

req_keys = ["byr" ,
    "iyr" ,
    "eyr" ,
    "hgt" ,    "hcl" ,
    "ecl" ,
    "pid"
]


def validate pdata
    vals = pdata.strip.map { |i| i.split(":")}
    vals = vals.to_h
    return false if vals["byr"].to_i < 1920 || vals["byr"].to_i > 2002
    return false if vals["iyr"].to_i < 2010 || vals["iyr"].to_i > 2020
    return false if vals["eyr"].to_i < 2020 || vals["eyr"].to_i > 2030
    if vals["hgt"].include? "cm"
        hgt = vals["hgt"].split("cm")[0].to_i
        return false if hgt < 150 || hgt > 193
    end
    if vals["hgt"].include? "in"
        hgt = vals["hgt"].split("in")[0].to_i
        return false if (hgt < 59 || hgt > 76)
    end

    if !vals["hcl"].match(/^#([0-9]|[abcdef]){6,6}$/)
        return false
    end

    if !["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].include?(vals["ecl"].strip)
        # puts vals["ecl"]
        return false
    end
    if vals["pid"].size != 9 
        # puts vals['pid']
        return false
    end
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



