        require 'matrix'
        data = File.readlines("#{__dir__}/data.txt").map(&:to_i).sort

        def count_diff data
            data2 = data.dup
            data.unshift(0)
            data2 << data.last + 3
            res = (Matrix[data2] - Matrix[data]).to_a.first
            return res
        end

        def count_jolts data
            res = count_diff data
            kmap = {
                2=> 2,
                3=> 4,
                4=> 7
            }
            res.join.scan(/1{2,}/).map { |i| kmap[i.split('').map(&:to_i).sum]}.reduce(&:*)
        end

        puts count_jolts data