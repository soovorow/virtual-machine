# frozen_string_literal: true

# Byte Register
class RegisterHalfWord
  def initialize(phase, clear, clock_enabled, clock, bus_in, bus_out)

    r1bus_in = Bus.new 8, [
      bus_in.data[0],
      bus_in.data[1],
      bus_in.data[2],
      bus_in.data[3],
      bus_in.data[4],
      bus_in.data[5],
      bus_in.data[6],
      bus_in.data[7]
    ]
    r1bus_out = Bus.new 8, [
      bus_out.data[0],
      bus_out.data[1],
      bus_out.data[2],
      bus_out.data[3],
      bus_out.data[4],
      bus_out.data[5],
      bus_out.data[6],
      bus_out.data[7]
    ]
    r2bus_in = Bus.new 8, [
      bus_in.data[8],
      bus_in.data[9],
      bus_in.data[10],
      bus_in.data[11],
      bus_in.data[12],
      bus_in.data[13],
      bus_in.data[14],
      bus_in.data[15]
    ]
    r2bus_out = Bus.new 8, [
      bus_out.data[8],
      bus_out.data[9],
      bus_out.data[10],
      bus_out.data[11],
      bus_out.data[12],
      bus_out.data[13],
      bus_out.data[14],
      bus_out.data[15]
    ]

    @reg1 = RegisterByte.new phase, clear, clock_enabled, clock, r1bus_in, r1bus_out
    @reg2 = RegisterByte.new phase, clear, clock_enabled, clock, r2bus_in, r2bus_out
  end
end
