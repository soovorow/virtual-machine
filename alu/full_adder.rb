# frozen_string_literal: true

# Full Adder
class FullAdder
  def initialize(phase, alpha, betta, carry_in, carry_out, sum)
    ha_first_carry_out = Conductor.new
    ha_first_sum = Conductor.new
    ha_last_carry_out = Conductor.new
    @half_adder_first = HalfAdder.new phase, alpha, betta, ha_first_carry_out, ha_first_sum
    @half_adder_last = HalfAdder.new phase, ha_first_sum, carry_in, ha_last_carry_out, sum
    @or_gate = OrGate.new phase, ha_first_carry_out, ha_last_carry_out, carry_out
  end
end
