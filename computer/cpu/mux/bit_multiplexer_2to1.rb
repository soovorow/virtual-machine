# frozen_string_literal: true

# Bit Multiplexer 2to1
class BitMultiplexer2to1
  def initialize(phase, alpha, betta, sel, out)
    @sel = sel
    @alpha = alpha
    @betta = betta
    @out = out

    and_a_to_or_a = Conductor.new
    and_b_to_or_b = Conductor.new
    inv_sel_to_and_a_b = Conductor.new

    @inv_gate = InvGate.new phase, @sel, inv_sel_to_and_a_b
    @and_gate_a = AndGate.new phase, @alpha, inv_sel_to_and_a_b, and_a_to_or_a
    @and_gate_b = AndGate.new phase, @sel, @betta, and_b_to_or_b
    @or_gate = OrGate.new phase, and_a_to_or_a, and_b_to_or_b, out
  end
end
