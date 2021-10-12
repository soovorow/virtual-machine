# frozen_string_literal: true

# Instruction Decoder
class InstructionDecoder
  attr_reader :input
  def initialize (phase, bus)
    @phase = phase
    @bus = bus

    @load = Conductor.new
    instruction_load

    @add = Conductor.new
    instruction_add
    @and = Conductor.new
    instruction_and
    @sub = Conductor.new
    instruction_sub

    @input = Conductor.new
    instruction_input
    @output = Conductor.new
    instruction_output

    @jump = Conductor.new
    instruction_jump

    @jump_condition = Conductor.new
    instruction_jump_condition

    @jumpz = Conductor.new
    instruction_jumpz
    @jumpnz = Conductor.new
    instruction_jumpnz
    @jumpc = Conductor.new
    instruction_jumpc
    @jumpnc = Conductor.new
    instruction_jumpnc

  end

  def instruction_load
    a = Conductor.new
    b = Conductor.new
    c = Conductor.new
    d = Conductor.new
    InvGate.new @phase, @bus.data[7], a
    InvGate.new @phase, @bus.data[6], b
    InvGate.new @phase, @bus.data[5], c
    InvGate.new @phase, @bus.data[4], d
    And4Gate.new @phase, a, b, c , d, @load
  end

  def instruction_add
    a = Conductor.new
    b = @bus.data[6]
    c = Conductor.new
    d = Conductor.new
    InvGate.new @phase, @bus.data[7], a
    InvGate.new @phase, @bus.data[5], c
    InvGate.new @phase, @bus.data[4], d
    And4Gate.new @phase, a, b, c , d, @add
  end

  def instruction_and
    a = Conductor.new
    b = Conductor.new
    c = Conductor.new
    d = @bus.data[4]
    InvGate.new @phase, @bus.data[7], a
    InvGate.new @phase, @bus.data[6], c
    InvGate.new @phase, @bus.data[5], d
    And4Gate.new @phase, a, b, c , d, @and
  end

  def instruction_sub
    a = Conductor.new
    b = @bus.data[6]
    c = @bus.data[5]
    d = Conductor.new
    InvGate.new @phase, @bus.data[7], a
    InvGate.new @phase, @bus.data[4], d
    And4Gate.new @phase, a, b, c , d, @sub
  end

  def instruction_input
    a = @bus.data[7]
    b = Conductor.new
    c = @bus.data[5]
    d = Conductor.new
    InvGate.new @phase, @bus.data[6], a
    InvGate.new @phase, @bus.data[4], d
    And4Gate.new phase, a, b, c , d, @input
  end

  def instruction_output
    a = @bus.data[7]
    b = @bus.data[6]
    c = @bus.data[5]
    d = Conductor.new
    InvGate.new @phase, @bus.data[4], d
    And4Gate.new @phase, a, b, c , d, @output
  end

  def instruction_jump
    a = @bus.data[7]
    b = Conductor.new
    c = Conductor.new
    d = Conductor.new
    InvGate.new @phase, @bus.data[6], b
    InvGate.new @phase, @bus.data[5], c
    InvGate.new @phase, @bus.data[4], d
    And4Gate.new @phase, a, b, c , d, @jump
  end

  def instruction_jump_condition
    a = @bus.data[7]
    b = Conductor.new
    c = Conductor.new
    d = @bus.data[4]
    InvGate.new @phase, @bus.data[6], b
    InvGate.new @phase, @bus.data[5], c
    And4Gate.new @phase, a, b, c , d, @jump_condition
  end

  def instruction_jumpz
    a = @jump_condition
    b = Conductor.new
    c = Conductor.new
    InvGate.new @phase, @bus.data[3], b
    InvGate.new @phase, @bus.data[2], c
    And3Gate.new @phase, a, b, c, @jumpz
  end

  def instruction_jumpnz
    a = @jump_condition
    b = Conductor.new
    c = @bus.data[2]
    InvGate.new @phase, @bus.data[3], b
    And3Gate.new @phase, a, b, c, @jumpnz
  end

  def instruction_jumpc
    a = @jump_condition
    b = Conductor.new
    c = @bus.data[3]
    InvGate.new @phase, @bus.data[2], b
    And3Gate.new @phase, a, b, c, @jumpc
  end

  def instruction_jumpnc
    a = @jump_condition
    b = @bus.data[2]
    c = @bus.data[3]
    And3Gate.new @phase, a, b, c, @jumpnc
  end



end
