# frozen_string_literal: true

data = File.readlines("#{__dir__}/data.txt").map(&:to_i)

# Class
class Node
  attr_accessor :next, :num

  def initialize(num)
    @num = num
  end
end

# Class
class LinkedList
  def initialize
    @head = nil
    @tail = nil
    @current = nil
    @nodes = {}
  end

  def <<(num)
    node = Node.new(num)
    if @head.nil?
      @head = node
      @tail = @head
    else
      @tail.next = node
      @tail = @tail.next
    end
    @nodes[num] = node
  end

  def link
    @tail.next = @head
  end

  def swap(min, max)
    startnode = current.next
    endnode = current.next.next.next
    picks = [startnode.num, startnode.next.num, endnode.num]

    dest = current.num - 1
    dest -= 1 while picks.include?(dest)
    dest = max if dest < min
    dest -= 1 while picks.include?(dest)

    node = find(dest)

    x = endnode.next
    current.next = x

    t = node.next
    node.next = startnode
    endnode.next = t

    @current = current.next
  end

  def next_two(num)
    node = find(num)
    node.next.num * node.next.next.num
  end

  private

  def current
    @current ||= @head
  end

  def find(num)
    @nodes[num]
  end
end

def ccups(data)
  max = 1_000_000
  dcups = data.to_s.split('').map(&:to_i)
  min = dcups.min
  cups = dcups + (10..max).to_a
  list = LinkedList.new
  cups.each do |cup|
    list << cup
  end
  list.link

  10_000_000.times do |_i|
    list.swap(min, max)
  end
  list.next_two 1
end

start = Time.now
p ccups data[0]

p Time.now - start
