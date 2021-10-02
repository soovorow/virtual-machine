# frozen_string_literal: true

# Bus Multiplexer 4to1
class BusMultiplexer4to1
  def initialize(phase, bus_a, bus_b, bus_c, bus_d, s_0, s_1, bus_z)
    @bus_a = bus_a
    @bus_b = bus_b
    @bus_c = bus_c
    @bus_d = bus_d
    @s_0 = s_0
    @s_1 = s_1
    @bus_z = bus_z

    bus_ab_to_z_a = Bus.new
    bus_cd_to_z_b = Bus.new

    @ab_mux = BusMultiplexer2to1.new phase, @bus_a, @bus_b, @s_0, bus_ab_to_z_a
    @cd_mux = BusMultiplexer2to1.new phase, @bus_c, @bus_d, @s_0, bus_cd_to_z_b
    @z_mux =  BusMultiplexer2to1.new phase, bus_ab_to_z_a, bus_cd_to_z_b, @s_1, @bus_z
  end
end
