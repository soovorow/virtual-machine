# frozen_string_literal: true

require_relative 'replicate'
require_relative 'bitwise_and'

# ALU – Arithmetic Logic Unit
class ALU
  def initialize(phase, bus_a, bus_b, s0, s1, s2, s3, s4, bus_alu, carry_out)
    @bus_a = bus_a
    @bus_b = bus_b
    @s0 = s0
    @s1 = s1
    @s2 = s2
    @s3 = s3
    @s4 = s4
    @bus_alu = bus_alu
    @c_out = carry_out


    inv_result = Conductor.new
    bus_01 = Bus.new
    bus_02 = Bus.new
    bus_03 = Bus.new
    ripple_adder_sum_bus = Bus.new

    @inv_gate = InvGate.new phase, @s4, inv_result
    @replicate = Replicate.new inv_result, bus_01
    @bitwise_xor = BitwiseXor.new phase, @bus_b, @s3, bus_02
    @bitwise_and_0 = BitwiseAnd.new phase, bus_01, bus_02, bus_03
    @ripple_adder = RippleAdder.new phase, @bus_a, bus_03, @s2, ripple_adder_sum_bus, @c_out

    bitwise_and_out_bus = Bus.new # bitwise and 2 to mux b
    @bitwise_and_2 = BitwiseAnd.new phase, @bus_a, @bus_b, bitwise_and_out_bus

    @mux_bus_4to1 = BusMultiplexer4to1.new phase, ripple_adder_sum_bus, bitwise_and_out_bus, @bus_a, @bus_b, @s0, @s1, @bus_alu

  end

  def debug
    print self, "\n"
    print "a:\t\t", @bus_a.to_string, "\t", @bus_a, "\n"
    print "b:\t\t", @bus_b.to_string, "\t", @bus_b, "\n"
    print "s0:\t\t", @s0.current, "\t\t\t", @s0, "\n"
    print "s1:\t\t", @s1.current, "\t\t\t", @s1, "\n"
    print "s2:\t\t", @s2.current, "\t\t\t", @s2, "\n"
    print "s3:\t\t", @s3.current, "\t\t\t", @s3, "\n"
    print "s4:\t\t", @s4.current, "\t\t\t", @s4, "\n"
    print "alu:\t", @bus_alu.to_string, "\t", @bus_alu, "\n"
    print "c_out:\t", @c_out.current, "\t\t\t", @c_out, "\n"
  end
end
