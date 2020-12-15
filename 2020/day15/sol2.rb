data = File.read("#{__dir__}/data.txt").split(',').map(&:to_i)

def find_spoken(data)
  nums = {}
  data.each_with_index do |i, j|
    nums[i] = [j + 1]
  end
  i = data.size + 1
  t = 30_000_000
  lastn = data.last
  while i <= t
    if nums[lastn].size == 1
      nums[0] << i
      lastn = 0
    else
      diff = nums[lastn][-1] - nums[lastn][-2]
      if nums[diff]
        nums[diff] << i
      else
        nums[diff] = [i]
      end
      lastn = diff
    end
    i += 1
  end
  p lastn
end

find_spoken data
