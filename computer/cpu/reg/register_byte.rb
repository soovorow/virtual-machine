# frozen_string_literal: true

# Byte Register
class RegisterByte
  def initialize(phase, clear, clock_enabled, clock, bus_in, bus_out)
    @four_bit_reg_0 = RegisterNibble.new phase,
                                         bus_in.data[0], bus_in.data[1], bus_in.data[2], bus_in.data[3],
                                         clock, clock_enabled, clear,
                                         bus_out.data[0], bus_out.data[1], bus_out.data[2], bus_out.data[3]

    @four_bit_reg_1 = RegisterNibble.new phase,
                                         bus_in.data[4], bus_in.data[5], bus_in.data[6], bus_in.data[7],
                                         clock, clock_enabled, clear,
                                         bus_out.data[4], bus_out.data[5], bus_out.data[6], bus_out.data[7]
  end
end
