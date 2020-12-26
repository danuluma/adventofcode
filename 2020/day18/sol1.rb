data = File.readlines("#{__dir__}/data.txt").map(&:strip)

def ops(e)
  op = nil
  tot = 0
  e.split(' ').each do |i|
    if ['*', '+'].include? i
      op = i
    elsif op.nil?
      tot = i.to_i
    elsif op == '*'
      tot *= i.to_i
    elsif op == '+'
      tot += i.to_i
    end
  end
  tot
end

def opp(data)
  p1 = data.gsub(/\(([^()]*)\)/) { |e| ops(e[1...-1]) }
  p1.split.size == 1 ? p1.to_i : opp(p1)
end

def sum(data)
  data.map do |x|
    opp "(#{x.strip})"
  end.sum
end

p sum data
