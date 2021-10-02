# frozen_string_literal: true

require_relative '../electronics/join'

# OR Logic Gate (Parallel Circuit)
class OrGate

  def initialize(phase, alpha, betta, out)
    alpha_emitter = Conductor.new
    betta_emitter = Conductor.new
    @alpha_npn_transistor = NPNTransistor.new phase, alpha, alpha_emitter
    @betta_npn_transistor = NPNTransistor.new phase, betta, betta_emitter
    @join = Join.new [alpha_emitter, betta_emitter], [out]
  end

  def debug
    @alpha_npn_transistor.debug
    @betta_npn_transistor.debug
    print self, "\nout:\t", @join.out[0].current, "\n"
  end
end
