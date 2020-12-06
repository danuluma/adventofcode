require 'set'

data = File.read("#{__dir__}/data.txt").split(/\s{2,}/)


def count_quiz d
    d.map do |b|
        pp = b.split("\n")
        ls = pp.join.split("")
        set = ls.to_set.to_a
        set.map do |a|
             ls.count(a) == pp.size ? 1: 0
        end.sum
    end.sum
end

puts count_quiz data



