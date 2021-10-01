# frozen_string_literal: true

# Wire Hub
class Join
  attr_reader :in, :out

  def initialize(input, output)
    @in = input || []
    @out = output || []

    input.each { |c| c.listener.append(method(:update)) }

    update
  end

  def catch_in
    @in.each do |c|
      return 1 if c.current == 1
    end
    0
  end

  def update
    catch = catch_in
    @out.each { |c| c.current = catch }
  end

  def debug
    print self, "\n"
    @in.each { |c| print "in:\t\t", c.current, "\n" }
    @out.each { |c| print "out:\t", c.current, "\n" }
    print "\n"
  end
end
