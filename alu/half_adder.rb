# frozen_string_literal: true

# Half Adder
class HalfAdder
  def initialize(phase, alpha, betta, carry_out, sum)
    @and_gate = AndGate.new phase, alpha, betta, carry_out
    @xor_gate = XorGate.new phase, alpha, betta, sum
  end

  def debug
    @and_gate.debug
    @xor_gate.debug
  end
end
