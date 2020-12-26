data = File.read("#{__dir__}/data.txt").split(',').map(&:to_i)


def find_spoken data
    anums = data  
    i = anums.size
    while i < 2020
        if (anums.count anums.last) == 1
            anums << 0 
        else
            ind = anums.size.times.filter {|i| anums[i] == anums.last} 
            diff = ind[-1] - ind[-2]
            anums << diff
        end
        i +=1
    end
    p anums[2019]
end

find_spoken data
