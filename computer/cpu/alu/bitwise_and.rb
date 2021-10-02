# frozen_string_literal: true

# Bitwise And
class BitwiseAnd
  def initialize(phase, bus_a, bus_b, bus_z)
    @bus_a = bus_a
    @bus_b = bus_b
    @bus_z = bus_z

    @and_gate_0 = AndGate.new phase, @bus_a.data[0], @bus_b.data[0], @bus_z.data[0]
    @and_gate_1 = AndGate.new phase, @bus_a.data[1], @bus_b.data[1], @bus_z.data[1]
    @and_gate_2 = AndGate.new phase, @bus_a.data[2], @bus_b.data[2], @bus_z.data[2]
    @and_gate_3 = AndGate.new phase, @bus_a.data[3], @bus_b.data[3], @bus_z.data[3]
    @and_gate_4 = AndGate.new phase, @bus_a.data[4], @bus_b.data[4], @bus_z.data[4]
    @and_gate_5 = AndGate.new phase, @bus_a.data[5], @bus_b.data[5], @bus_z.data[5]
    @and_gate_6 = AndGate.new phase, @bus_a.data[6], @bus_b.data[6], @bus_z.data[6]
    @and_gate_7 = AndGate.new phase, @bus_a.data[7], @bus_b.data[7], @bus_z.data[7]
  end
end
