data = File.read("#{__dir__}/data.txt").split("\n")

def process_data data
    mask = nil
    mem = Hash.new
    for l in data
        key, val = l.split('=').map(&:strip)
        if key.match("mask")
            mask = val.split('')
        elsif key.match(/mem\[\d+\]/)
            addr = key.match(/\d+/).to_s.to_i
            bin = addr.to_i.to_s(2).rjust(36, '0')
            res = mask.each_with_index.map do |i,j|
                mask[j] == '0' ? bin[j] : mask[j]
            end

            xcount = res.count 'X'
            perm =  [0,1].repeated_permutation(xcount).to_a

            perm.each do |i|
                nres = res.map { |r| r == 'X' ? i.pop : r }.join('').to_i(2)
                mem[nres] = val.to_i
            end
        end
    end
    mem.values.sum
end

puts process_data data
