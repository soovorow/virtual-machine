# frozen_string_literal: true

# Full Adder
class FullAdder
  attr_reader :c_out

  def initialize(phase, alpha, betta, carry_in, carry_out, sum)

    @c_in = carry_in
    @alfa = alpha
    @betta = betta
    @sum = sum
    @c_out = carry_out

    ha_first_carry_out = Conductor.new
    ha_first_sum = Conductor.new
    ha_last_carry_out = Conductor.new
    @half_adder_first = HalfAdder.new phase, @alfa, @betta, ha_first_carry_out, ha_first_sum
    @half_adder_last = HalfAdder.new phase, ha_first_sum, @c_in, ha_last_carry_out, @sum
    @or_gate = OrGate.new phase, ha_first_carry_out, ha_last_carry_out, @c_out
  end

  def debug
    print self, "\n"
    print "c_in:\t", @c_in.current, "\t", @c_in, "\n"
    print "a:\t\t", @alfa.current, "\t", @alfa, "\n"
    print "b:\t\t", @betta.current, "\t", @betta, "\n"
    print "c_out:\t", @c_out.current, "\t", @c_out, "\n"
    print "sum:\t", @sum.current, "\t", @sum, "\n"
    @half_adder_first.debug
    @half_adder_last.debug
    print "\n"
  end
end
