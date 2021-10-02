# frozen_string_literal: true

# Half Adder
class HalfAdder
  def initialize(phase, alpha, betta, carry_out, sum)
    @alfa = alpha
    @betta = betta
    @c_out = carry_out
    @sum = sum
    @and_gate = AndGate.new phase, @alfa, @betta, @c_out
    @xor_gate = XorGate.new phase, @alfa, @betta, @sum
  end

  def debug
    print self, "\n"
    print "a:\t\t", @alfa.current, "\t", @alfa, "\n"
    print "b:\t\t", @betta.current, "\t", @betta, "\n"
    print "c_out:\t", @c_out.current, "\t", @c_out, "\n"
    print "sum:\t", @sum.current, "\t", @sum, "\n"
    # @and_gate.debug
    @xor_gate.debug
  end
end
