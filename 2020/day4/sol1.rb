data = File.read("#{__dir__}/data.txt").split(/\s{2,}/).map(&:split)

req_keys = ["byr" ,
    "iyr" ,
    "eyr" ,
    "hgt" ,    "hcl" ,
    "ecl" ,
    "pid"
]
def count_valid dt, r
    valid = 0
    dt.each do |pass|
        keys = pass.map { |i| i.split(":")[0]}
        valid +=1 if (r - keys).empty?
    end
    return valid
end


puts count_valid data, req_keys



