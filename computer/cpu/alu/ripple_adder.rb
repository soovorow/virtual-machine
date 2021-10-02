# frozen_string_literal: true

# Ripple Adder
class RippleAdder
  def initialize(phase, bus_a, bus_b, carry_in, bus_sum, carry_out)
    @c_in = carry_in
    @bus_a = bus_a
    @bus_b = bus_b
    @c_out = carry_out
    @bus_sum = bus_sum

    carry_out_0 = Conductor.new
    carry_out_1 = Conductor.new
    carry_out_2 = Conductor.new
    carry_out_3 = Conductor.new
    carry_out_4 = Conductor.new
    carry_out_5 = Conductor.new
    carry_out_6 = Conductor.new

    @full_adder_0 = FullAdder.new phase, @bus_a.data[0], @bus_b.data[0], @c_in, carry_out_0, @bus_sum.data[0]
    @full_adder_1 = FullAdder.new phase, @bus_a.data[1], @bus_b.data[1], carry_out_0, carry_out_1, @bus_sum.data[1]
    @full_adder_2 = FullAdder.new phase, @bus_a.data[2], @bus_b.data[2], carry_out_1, carry_out_2, @bus_sum.data[2]
    @full_adder_3 = FullAdder.new phase, @bus_a.data[3], @bus_b.data[3], carry_out_2, carry_out_3, @bus_sum.data[3]
    @full_adder_4 = FullAdder.new phase, @bus_a.data[4], @bus_b.data[4], carry_out_3, carry_out_4, @bus_sum.data[4]
    @full_adder_5 = FullAdder.new phase, @bus_a.data[5], @bus_b.data[5], carry_out_4, carry_out_5, @bus_sum.data[5]
    @full_adder_6 = FullAdder.new phase, @bus_a.data[6], @bus_b.data[6], carry_out_5, carry_out_6, @bus_sum.data[6]
    @full_adder_7 = FullAdder.new phase, @bus_a.data[7], @bus_b.data[7], carry_out_6, @c_out, @bus_sum.data[7]
  end

  def debug
    print self, "\n"
    print "c_in:\t\t", @c_in.current, "\t\t\t", @c_in, "\n"
    print "bus_a:\t\t", @bus_a.to_string, "\t", @bus_a, "\n"
    print "bus_b:\t\t", @bus_b.to_string, "\t", @bus_b, "\n"
    print "c_out:\t\t", @c_out.current, "\t\t\t", @c_out, "\n"
    print "bus_sum:\t", @bus_sum.to_string, "\t", @bus_sum, "\n"
    # @full_adder_0.debug
    print "\n"
  end
end
