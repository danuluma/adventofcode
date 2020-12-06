require 'set'

data = File.read("#{__dir__}/data.txt").split(/\s{2,}/)


def count_quiz d
    d.map do |b|
        b.split("\n").join.split("").to_set.size
    end.sum
end

puts count_quiz data



