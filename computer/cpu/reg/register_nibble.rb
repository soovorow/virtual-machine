# frozen_string_literal: true

# Half Byte Register
class RegisterNibble
  def initialize(phase, d0, d1, d2, d3, clock, clock_eabled, clear, q0, q1, q2, q3)
    @fdce_0 = FDCE.new phase, clear, clock_eabled, d0, clock, q0
    @fdce_1 = FDCE.new phase, clear, clock_eabled, d1, clock, q1
    @fdce_2 = FDCE.new phase, clear, clock_eabled, d2, clock, q2
    @fdce_3 = FDCE.new phase, clear, clock_eabled, d3, clock, q3
  end
end
