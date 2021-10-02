# frozen_string_literal: true

# Bitwise Xor
class BitwiseXor
  def initialize(phase, bus_a, en, bus_z)
    @en = en
    @bus_a = bus_a
    @bus_z = bus_z

    @xor_gate_0 = XorGate.new phase, @bus_a.data[0], @en, @bus_z.data[0]
    @xor_gate_1 = XorGate.new phase, @bus_a.data[1], @en, @bus_z.data[1]
    @xor_gate_2 = XorGate.new phase, @bus_a.data[2], @en, @bus_z.data[2]
    @xor_gate_3 = XorGate.new phase, @bus_a.data[3], @en, @bus_z.data[3]
    @xor_gate_4 = XorGate.new phase, @bus_a.data[4], @en, @bus_z.data[4]
    @xor_gate_5 = XorGate.new phase, @bus_a.data[5], @en, @bus_z.data[5]
    @xor_gate_6 = XorGate.new phase, @bus_a.data[6], @en, @bus_z.data[6]
    @xor_gate_7 = XorGate.new phase, @bus_a.data[7], @en, @bus_z.data[7]
  end
end
