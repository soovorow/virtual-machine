# frozen_string_literal: true

# Wire Hub
class Bus
  attr_accessor :data

  def initialize(size, data = nil)
    if data == nil
      @data = []
      (1..size).each do
        @data.push Conductor.new
      end
    else
      @data = data
    end
  end

  # @param [String] string
  def data_as_string=(string)
    array = string.split(//).reverse
    i = 0
    array.each do |bit|
      @data[i].current = bit.to_i
      i += 1
    end
  end

  def debug
    print self, "\n"
    i = 0
    @data.each do |c|
      print i, ":\t", c.current, "\n"
      i += 1
    end
    print "\n"
  end

  def to_string
    str = ''
    @data.reverse.each { |c| str += c.current.to_s }
    str
  end

end
