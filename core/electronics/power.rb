# frozen_string_literal: true

require_relative '../electronics/conductor'

# Power Supply Unit
class Power
  attr_reader :out

  def initialize
    @out = Conductor.new
  end

  def turn(to)
    @out.current = to
  end
end
