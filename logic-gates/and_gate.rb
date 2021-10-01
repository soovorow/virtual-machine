# frozen_string_literal: true

# AND Logic Gate (Serial Circuit)
class AndGate

  def initialize(phase, alpha, betta, out)
    alpha_emitter = Conductor.new
    @alpha_npn_transistor = NPNTransistor.new phase, alpha, alpha_emitter
    @betta_npn_transistor = NPNTransistor.new alpha_emitter, betta, out
  end

  def debug
    @alpha_npn_transistor.debug
    @betta_npn_transistor.debug
    print self, "\nout:\t", @betta_npn_transistor.emitter.current, "\n\n"
  end
end
