
sums = Array.new

def check_this(sums)
  changes = File.read("day1.txt").split().to_a
  sum = 0
  while true
    changes.each do |change|
        sum += change.to_i
        if sums.include? sum
          puts "found"
          puts sum
          exit
        else
          sums << sum
          puts sum
        end
    end
  end
end

check_this(sums)

