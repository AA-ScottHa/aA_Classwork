class MaxIntSet
  attr_reader :store
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" if num >= @max || num < 0
    @store[num] = true # if @store[num] == false
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] #== true
  end

  private

  def is_valid?(num)

  end

  def validate!(num)

  end
end


class IntSet
  def initialize(num_buckets = 20)
    @buckets = num_buckets
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    bucket = num % @buckets
    @store[bucket].push(num)
  end

  def remove(num)
    bucket = num % @buckets
    @store[bucket].delete(num)
  end

  def include?(num)
    bucket = num % @buckets
    @store[bucket].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
      bucket = num % num_buckets
      @store[bucket].push(num)
      @count += 1
      resize! if @count > num_buckets
    end
  end

  def remove(num)
    if include?(num)
      bucket = num % num_buckets
      @store[bucket].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    bucket = num % num_buckets
    @store[bucket].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp = Array.new(num_buckets * 2) { Array.new }
    @store.each do |bucket|
      bucket.each do |num|
        new_bucket = num % (num_buckets * 2)
        temp[new_bucket].push(num)
      end
    end
    @store = temp
  end
end
