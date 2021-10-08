# frozen_string_literal: true

# Sequence Generator
class SequenceGenerator
  def initialize(phase, clr, ce, clk, fetch, decode, execute)
    @fdce1 = FDCE.new phase, clr, ce, execute, clk, fetch, 1, 'Fetch'
    @fdce2 = FDCE.new phase, clr, ce, fetch, clk, decode, 0, 'Decode'
    @fdce3 = FDCE.new phase, clr, ce, decode, clk, execute, 0, 'Execute'
  end
end
