# frozen_string_literal: true

data = File.readlines("#{__dir__}/data.txt").map(&:split)

distances = data.each_with_object({}) do |(key, val), obj|
  case key
  when 'forward'
    obj['horizontal'] ? obj['horizontal'] += val.to_i : obj['horizontal'] = val.to_i
    obj['depth'] ? obj['depth'] += (obj['aim'] || 0) * val.to_i : obj['depth'] = (obj['aim'] || 0) * val.to_i
  when 'down'
    obj['aim'] ? obj['aim'] += val.to_i : obj['aim'] = val.to_i
  when 'up'
    obj['aim'] ? obj['aim'] -= val.to_i : obj['aim'] = -val.to_i
  end
end

res = distances['horizontal'] * distances['depth']

puts res
