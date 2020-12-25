# frozen_string_literal: true

data = File.readlines("#{__dir__}/data.txt").map(&:to_i)

def transf(snum, lsize)
  v = 1
  lsize.times do
    v = (v * snum) % 20_201_227
  end
  v
end

def cbreaker(data)
  cpkey, dpkey = data
  clsize = nil
  dlsize = nil
  v = 1
  x = 1
  loop do
    v = (v * 7) % 20_201_227
    clsize = x if v == cpkey && clsize.nil?
    dlsize = x if v == dpkey && dlsize.nil?

    break if !clsize.nil? && !dlsize.nil?

    x += 1
  end

  transf dpkey, clsize
end

p cbreaker data
