data = File.read("#{__dir__}/data.txt").split("\n")

def process_data data
    mask = nil
    mem = []
    for l in data
        key, val = l.split('=').map(&:strip)
        if key.match("mask")
            mask = val.split('')
        elsif key.match(/mem\[\d+\]/)
            addr = key.match(/\d+/).to_s.to_i
            bin = val.to_i.to_s(2).rjust(36, '0')

            res = mask.each_with_index.map do |i,j|
                mask[j] == "X" ? bin[j] : mask[j]
            end.join('').to_i(2)
            mem[addr] = res
        end
    end
    mem.sum(&:to_i)
end

puts process_data data