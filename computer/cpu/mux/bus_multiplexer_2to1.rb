# frozen_string_literal: true

# Bus Multiplexer 2to1
class BusMultiplexer2to1
  def initialize(phase, bus_a, bus_b, sel, bus_z)
    @sel = sel
    @bus_a = bus_a
    @bus_b = bus_b
    @bus_z = bus_z

    @bit_mux_2to1_0 = BitMultiplexer2to1.new phase, @bus_a.data[0], @bus_b.data[0], @sel, @bus_z.data[0]
    @bit_mux_2to1_1 = BitMultiplexer2to1.new phase, @bus_a.data[1], @bus_b.data[1], @sel, @bus_z.data[1]
    @bit_mux_2to1_2 = BitMultiplexer2to1.new phase, @bus_a.data[2], @bus_b.data[2], @sel, @bus_z.data[2]
    @bit_mux_2to1_3 = BitMultiplexer2to1.new phase, @bus_a.data[3], @bus_b.data[3], @sel, @bus_z.data[3]
    @bit_mux_2to1_4 = BitMultiplexer2to1.new phase, @bus_a.data[4], @bus_b.data[4], @sel, @bus_z.data[4]
    @bit_mux_2to1_5 = BitMultiplexer2to1.new phase, @bus_a.data[5], @bus_b.data[5], @sel, @bus_z.data[5]
    @bit_mux_2to1_6 = BitMultiplexer2to1.new phase, @bus_a.data[6], @bus_b.data[6], @sel, @bus_z.data[6]
    @bit_mux_2to1_7 = BitMultiplexer2to1.new phase, @bus_a.data[7], @bus_b.data[7], @sel, @bus_z.data[7]
  end
end
