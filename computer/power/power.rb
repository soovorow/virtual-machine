# frozen_string_literal: true

require_relative '../../core/electronics/conductor'

# Power Supply Unit
class Power
  attr_reader :phase, :zero

  def initialize
    @phase = Conductor.new
    @zero = Conductor.new
  end

  def turn(to)
    @phase.current = to
  end
end
