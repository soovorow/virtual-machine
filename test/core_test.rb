# frozen_string_literal: true

require 'minitest/autorun'

require_relative '../machine'
require_relative '../computer/power/power'
require_relative '../core/electronics/bus'
require_relative '../core/electronics/npn_transistor'
require_relative '../core/electronics/pnp_transistor'
require_relative '../core/logic/and_gate'
require_relative '../core/logic/or_gate'
require_relative '../core/logic/xor_gate'
require_relative '../core/logic/inv_gate'
require_relative '../core/logic/nand_gate'
require_relative '../core/memory/fdce'
require_relative '../computer/cpu/mux/bit_multiplexer_2to1'
require_relative '../computer/cpu/mux/bus_multiplexer_2to1'
require_relative '../computer/cpu/mux/bus_multiplexer_4to1'
require_relative '../computer/cpu/alu/bitwise_xor'
require_relative '../computer/cpu/alu/bitwise_and'
require_relative '../computer/cpu/alu/half_adder'
require_relative '../computer/cpu/alu/full_adder'
require_relative '../computer/cpu/alu/ripple_adder'
require_relative '../computer/cpu/alu/alu'

# Auto Tests
class CoreTest < Minitest::Test

  def setup
    @machine = Machine.new 10
    @machine.turn :on
  end

  def teardown
    @machine.turn :off
  end


  # Electronics Tests

  def test_power
    assert_equal(1, @machine.power.phase.current, 'Machine power is turned on')
  end

  def test_clock
    start = Time.now.to_i
    delta = 1

    while Time.now.to_i - start < delta

    end
  end

  def test_conductor
    skip
  end

  def test_bus
    skip
  end

  def test_join
    skip
  end

  def test_npn_transistors
    t = NPNTransistor.new @machine.power.phase, Conductor.new, Conductor.new

    t.base.current = 1
    assert_equal(1, t.emitter.current, 'NPN Transistor w/ base current must emit 1')

    t.base.current = 0
    assert_equal(0, t.emitter.current, 'NPN Transistor w/o base current must emit 0')
  end

  def test_pnp_transistors
    t = PNPTransistor.new @machine.power.phase, Conductor.new, Conductor.new

    t.base.current = :on
    assert_equal(0, t.collector.current, 'PNP Transistor w/ base current must collect 0')

    t.base.current = :off
    assert_equal(1, t.collector.current, 'PNP Transistor w/o base current must collect 1')
  end


  # Logic Gates Tests

  def test_and_gate
    v = @machine.power.phase
    a = Conductor.new
    b = Conductor.new
    z = Conductor.new

    AndGate.new v, a, b, z

    a.current = 0
    b.current = 0
    assert_equal(0, z.current, '0 & 0 must equal 0')

    a.current = 0
    b.current = 1
    assert_equal(0, z.current, '0 & 1 must equal 0')

    a.current = 1
    b.current = 0
    assert_equal(0, z.current, '1 & 0 must equal 0')

    a.current = 1
    b.current = 1
    assert_equal(1, z.current, '1 & 1 must equal 1')
  end

  def test_or_gate
    v = @machine.power.phase
    a = Conductor.new
    b = Conductor.new
    z = Conductor.new

    OrGate.new v, a, b, z

    a.current = 0
    b.current = 0
    assert_equal(0, z.current, '0 | 0 must equal 0')

    a.current = 0
    b.current = 1
    assert_equal(1, z.current, '0 | 1 must equal 1')

    a.current = 1
    b.current = 0
    assert_equal(1, z.current, '1 | 0 must equal 1')

    a.current = 1
    b.current = 1
    assert_equal(1, z.current, '1 | 1 must equal 1')
  end

  def test_xor_gate
    v = @machine.power.phase
    a = Conductor.new
    b = Conductor.new
    z = Conductor.new

    XorGate.new v, a, b, z

    a.current = 0
    b.current = 0
    assert_equal(0, z.current, '0 ^ 0 must equal 0')

    a.current = 0
    b.current = 1
    assert_equal(1, z.current, '0 ^ 1 must equal 1')

    a.current = 1
    b.current = 0
    assert_equal(1, z.current, '1 ^ 0 must equal 1')

    a.current = 1
    b.current = 1
    assert_equal(0, z.current, '1 ^ 1 must equal 0')

  end

  def test_inv_gate
    v = @machine.power.phase
    a = Conductor.new
    z = Conductor.new

    InvGate.new v, a, z

    a.current = 0
    assert_equal(1, z.current)
    a.current = 1
    assert_equal(0, z.current)
  end

  def test_nand_gate
    v = @machine.power.phase
    a = Conductor.new
    b = Conductor.new
    z = Conductor.new

    NandGate.new v, a, b, z

    a.current = 0
    b.current = 0
    assert_equal(1, z.current, '!(0 & 0) must equal 1')

    a.current = 0
    b.current = 1
    assert_equal(1, z.current, '!(0 & 1) must equal 1')

    a.current = 1
    b.current = 0
    assert_equal(1, z.current, '!(1 & 0) must equal 1')

    a.current = 1
    b.current = 1
    assert_equal(0, z.current, '!(1 & 1) must equal 0')
  end


  # MUX Tests

  def test_bit_mux_2to1
    phase = @machine.power.phase
    sel = Conductor.new
    alpha = Conductor.new
    betta = Conductor.new
    out = Conductor.new

    BitMultiplexer2to1.new phase, alpha, betta, sel, out

    sel.current = 0
    alpha.current = 0
    betta.current = 0
    assert_equal(0, out.current)

    sel.current = 0
    alpha.current = 0
    betta.current = 1
    assert_equal(0, out.current)

    sel.current = 0
    alpha.current = 1
    betta.current = 0
    assert_equal(1, out.current)

    sel.current = 0
    alpha.current = 1
    betta.current = 1
    assert_equal(1, out.current)

    sel.current = 1
    alpha.current = 0
    betta.current = 0
    assert_equal(0, out.current)

    sel.current = 1
    alpha.current = 0
    betta.current = 1
    assert_equal(1, out.current)

    sel.current = 1
    alpha.current = 1
    betta.current = 0
    assert_equal(0, out.current)

    sel.current = 1
    alpha.current = 1
    betta.current = 1
    assert_equal(1, out.current)

  end

  def test_bus_mux_2to1
    phase = @machine.power.phase
    bus_a = Bus.new 8
    bus_b = Bus.new 8
    sel = Conductor.new
    bus_z = Bus.new 8

    BusMultiplexer2to1.new phase, bus_a, bus_b, sel, bus_z

    bus_a.data_as_string = '00000000'
    bus_b.data_as_string = '11110000'

    sel.current = 0
    assert_equal('00000000', bus_z.to_string)
    sel.current = 1
    assert_equal('11110000', bus_z.to_string)
  end

  def test_bus_mux_4to1
    phase = @machine.power.phase
    bus_a = Bus.new 8
    bus_b = Bus.new 8
    bus_c = Bus.new 8
    bus_d = Bus.new 8
    sel_0 = Conductor.new
    sel_1 = Conductor.new
    bus_z = Bus.new 8

    BusMultiplexer4to1.new phase, bus_a, bus_b, bus_c, bus_d, sel_0, sel_1, bus_z

    bus_a.data_as_string = '00000000'
    bus_b.data_as_string = '00000001'
    bus_c.data_as_string = '00000010'
    bus_d.data_as_string = '00000011'

    sel_0.current = 0
    sel_1.current = 0
    assert_equal('00000000', bus_z.to_string)

    sel_0.current = 0
    sel_1.current = 1
    assert_equal('00000010', bus_z.to_string)

    sel_0.current = 1
    sel_1.current = 0
    assert_equal('00000001', bus_z.to_string)

    sel_0.current = 1
    sel_1.current = 1
    assert_equal('00000011', bus_z.to_string)
  end


  # ALU Tests

  def test_bitwise_xor
    v = @machine.power.phase
    bus_a = Bus.new 8
    en = Conductor.new
    bus_z = Bus.new 8

    BitwiseXor.new v, bus_a, en, bus_z

    en.current = 0
    bus_a.data_as_string = '00000000'
    assert_equal('00000000', bus_z.to_string, "00000000 ^ 00000000 = 00000000")

    en.current = 1
    bus_a.data_as_string = '00000000'
    assert_equal('11111111', bus_z.to_string, "00000000 ^ 11111111 = 11111111")

    en.current = 1
    bus_a.data_as_string = '01101001'
    assert_equal('10010110', bus_z.to_string, "01101001 ^ 11111111 = 10010110")
  end

  def test_bitwise_and
    skip
  end

  def test_half_adder
    v = @machine.power.phase
    a = Conductor.new
    b = Conductor.new
    carry_out = Conductor.new
    sum = Conductor.new

    HalfAdder.new v, a, b, carry_out, sum

    a.current = 0
    b.current = 0
    assert_equal(0, carry_out.current, '0 + 0 carry = 0')
    assert_equal(0, sum.current, '0 + 0 sum = 0')

    a.current = 0
    b.current = 1
    assert_equal(0, carry_out.current, '0 + 1 carry = 0')
    assert_equal(1, sum.current, '0 + 1 sum = 1')

    a.current = 1
    b.current = 0
    assert_equal(0, carry_out.current, '1 + 0 carry = 0')
    assert_equal(1, sum.current, '1 + 1 sum = 0')

    a.current = 1
    b.current = 1
    assert_equal(1, carry_out.current, '1 + 1 carry = 1')
    assert_equal(0, sum.current, '1 + 1 sum = 0')
  end

  def test_full_adder
    v = @machine.power.phase
    a = Conductor.new
    b = Conductor.new
    c_in = Conductor.new
    c_out = Conductor.new
    sum = Conductor.new

    FullAdder.new v, a, b, c_in, c_out, sum

    c_in.current = 0
    a.current = 0
    b.current = 0
    assert_equal(0, c_out.current)
    assert_equal(0, sum.current)

    c_in.current = 0
    a.current = 0
    b.current = 1
    assert_equal(0, c_out.current)
    assert_equal(1, sum.current)

    c_in.current = 0
    a.current = 1
    b.current = 0
    assert_equal(0, c_out.current)
    assert_equal(1, sum.current)

    c_in.current = 0
    a.current = 1
    b.current = 1
    assert_equal(1, c_out.current)
    assert_equal(0, sum.current)

    c_in.current = 1
    a.current = 0
    b.current = 0
    assert_equal(0, c_out.current)
    assert_equal(1, sum.current)

    c_in.current = 1
    a.current = 0
    b.current = 1
    assert_equal(1, c_out.current)
    assert_equal(0, sum.current)

    c_in.current = 1
    a.current = 1
    b.current = 0
    assert_equal(1, c_out.current)
    assert_equal(0, sum.current)

    c_in.current = 1
    a.current = 1
    b.current = 1
    assert_equal(1, c_out.current)
    assert_equal(1, sum.current)
  end

  def test_ripple_adder

    v = @machine.power.phase
    bus_a = Bus.new 8
    bus_b = Bus.new 8
    c_in = Conductor.new
    bus_sum = Bus.new 8
    c_out = Conductor.new

    ra = RippleAdder.new v, bus_a, bus_b, c_in, bus_sum, c_out

    bus_a.data_as_string = '00000001'
    bus_b.data_as_string = '00000001'
    assert_equal('00000010', bus_sum.to_string, "00000001 + 00000001 = 00000010")

    bus_a.data_as_string = '11001000' # 200
    bus_b.data_as_string = '00110010' # 50
    assert_equal('11111010', bus_sum.to_string, "11001000 + 00110010 = 11111010") # 250

    bus_a.data_as_string = '11111111'
    bus_b.data_as_string = '11111111'
    assert_equal('11111110', bus_sum.to_string, "11111111 + 11111111 = 11111111")
    assert_equal(1, c_out.current, "11111111 + 11111111 set carry out to 1")

    ra.debug
  end

  def test_alu
    v = @machine.power.phase
    bus_a = Bus.new 8
    bus_b = Bus.new 8
    s0 = Conductor.new # mux output
    s1 = Conductor.new # mux output
    s2 = Conductor.new # carry bit
    s3 = Conductor.new # xor bit: invert B
    s4 = Conductor.new # and bit: reset B to [ 0000 0000 ]
    bus_alu = Bus.new 8
    c_out = Conductor.new

    alu = ALU.new v, bus_a, bus_b, s0, s1, s2, s3, s4, bus_alu, c_out

    # S01 TABLE
    #  11       ( D ) return B
    #  01       ( C ) return A
    #  10       ( B ) return A & B

    #     C XA
    # S01 2 34 TABLE
    #  00 0 00  ( A ) return A + B        // 14
    #  00 1 10  ( A ) return A - B        // 6
    #  00 1 01  ( A ) return A + 1        // 11

    # TRASH
    #  00 0 01  ( A ) return A + 0        // 10
    #  00 0 11  ( A ) return A + 0        // 10
    #  00 0 10  ( A ) return A + -B-1     // 5 + Carry bit
    #  00 1 00  ( A ) return A + B + 1    // 15 (A + B + 1) ???
    #  00 1 11  ( A ) return A + 0 + 1    // 11

    bus_a.data_as_string = '00001010' # 10
    bus_b.data_as_string = '00000100' # 4

    # s2.current = 1
    # s3.current = 1
    # s4.current = 1
    assert_equal('00001110', bus_alu.to_string, "00001010 + 00000100 = 00001110")

    s2.current = 1
    s3.current = 1
    # s4.current = 1
    assert_equal('00000110', bus_alu.to_string, "00001010 - 00000100 = 00000110")

    s2.current = 1
    # s3.current = 1
    s4.current = 1
    assert_equal('00001011', bus_alu.to_string, "00001010 + 00000001 = 00001011")


    alu.debug
  end


  # REG Tests

  def test_fdce
    phase = @machine.power.phase
    clear = Conductor.new
    clock_enabled = Conductor.new
    data = Conductor.new
    clock = @machine.clock.signal
    quit = Conductor.new

    FDCE.new phase, clear, clock_enabled, data, clock, quit

    clear.current = 1
    assert_equal(0, quit.current)

    clear.current = 0
    clock_enabled.current = 0
    assert_equal(0, quit.current)

    clear.current = 0
    clock_enabled.current = 1
    data.current = 1
    clock.current = 1
    assert_equal(1, quit.current)

    clear.current = 0
    clock_enabled.current = 0
    assert_equal(1, quit.current)
  end

  def test_register_nibble
    skip
  end

  def test_register_byte
    skip
  end

  def test_register_half_word
    skip
  end




end
