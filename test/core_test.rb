require 'minitest/autorun'

require_relative '../machine'
require_relative '../electronics/npn_transistor'
require_relative '../electronics/pnp_transistor'
require_relative '../logic-gates/and_gate'
require_relative '../logic-gates/or_gate'
require_relative '../logic-gates/xor_gate'
require_relative '../alu/half_adder'

class CoreTest < Minitest::Test
  def setup
    @machine = Machine.new
    @machine.power.turn :on
  end

  def test_npn_transistors
    t = NPNTransistor.new @machine.power.out, Conductor.new, Conductor.new

    t.base.current = :on
    assert_equal(1, t.emitter.current, 'NPN Transistor w/ base current must emit 1')

    t.base.current = :off
    assert_equal(0, t.emitter.current, 'NPN Transistor w/o base current must emit 0')
  end

  def test_pnp_transistors
    t = PNPTransistor.new @machine.power.out, Conductor.new, Conductor.new

    t.base.current = :on
    assert_equal(0, t.collector.current, 'PNP Transistor w/ base current must collect 0')

    t.base.current = :off
    assert_equal(1, t.collector.current, 'PNP Transistor w/o base current must collect 1')
  end

  def test_and_gate
    v = @machine.power.out
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
    v = @machine.power.out
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
    v = @machine.power.out
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

  def test_half_adder
    v = @machine.power.out
    a = Conductor.new
    b = Conductor.new
    carry = Conductor.new
    sum = Conductor.new

    ha = HalfAdder.new v, a, b, carry, sum

    a.current = 0
    b.current = 0
    assert_equal(0, carry.current, '0 + 0 carry = 0')
    assert_equal(0, sum.current, '0 + 0 sum = 0')

    a.current = 0
    b.current = 1
    assert_equal(0, carry.current, '0 + 1 carry = 0')
    assert_equal(1, sum.current, '0 + 1 sum = 1')

    a.current = 1
    b.current = 0
    assert_equal(0, carry.current, '1 + 0 carry = 0')
    assert_equal(1, sum.current, '1 + 1 sum = 0')

    a.current = 1
    b.current = 1
    ha.debug
    assert_equal(1, carry.current, '1 + 1 carry = 1')
    assert_equal(0, sum.current, '1 + 1 sum = 0')
  end

  def test_full_adder

  end

end
