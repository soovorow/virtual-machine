# frozen_string_literal: true

# NAND Logic Gate
class NandGate

  def initialize(phase, alpha, betta, out)
    alpha_emitter = Conductor.new
    betta_out = Conductor.new
    @alpha_npn_transistor = NPNTransistor.new phase, alpha, alpha_emitter
    @betta_npn_transistor = NPNTransistor.new alpha_emitter, betta, betta_out
    @inverter = InvGate.new phase, betta_out, out
  end

  def debug
    @alpha_npn_transistor.debug
    @betta_npn_transistor.debug
    print self, "\nout:\t", @betta_npn_transistor.emitter.current, "\n\n"
  end
end
