# frozen_string_literal: true

require_relative './computer/power/power'
require_relative './computer/clock/clock'

# Machine as is
class Machine
  attr_reader :power, :clock

  def initialize(clock_freq)
    @power = Power.new
    @clock = Clock.new @power.phase, @power.zero, clock_freq
  end

  def turn(to)
    @power.turn(to)
    if [1, :on].include?(to)
      @clock.start
    else
      @clock.stop
    end
  end
end
