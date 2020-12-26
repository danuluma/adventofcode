data = File.readlines("#{__dir__}/data.txt").map(&:strip)

def find_allergens(data)
  hallg = {}
  data.each do |d|
    i, a = d.split('contains')
    ing = i.delete_suffix('(').split(' ')
    alg = a.delete_suffix(')').split(',')
    hallg[ing] = alg
  end

  af = hallg.values.flatten.uniq.map { |a| [a, hallg.keys.flatten.uniq] }.to_h

  hallg.each do |alg, ing|
    ing.each do |a|
      af[a] = (af[a] & alg)
    end
  end

  (hallg.keys.flatten - af.values.flatten).count
end

p find_allergens data
