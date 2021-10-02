# frozen_string_literal: true

require_relative '../core/electronics/power'

# Machine as is
class Machine
  attr_reader :power

  def initialize
    @power = Power.new
  end
end