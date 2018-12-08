
data = File.read("data.txt").split().to_a

data.each do |line|
  (0...data.length).each do |x|
    if line.split('').to_a.length == data[x].split('').to_a.length
      diff = 0
      lt = Array.new
      (0...line.split('').to_a.length).each do |n|
        if (line.split('').to_a)[n] != (data[x].split('').to_a)[n]
          diff += 1
          arr = line.split('').to_a
          arr.delete_at(n)
          lt << arr.join
        end
      end
      puts lt if diff == 1
    end
  end
end
