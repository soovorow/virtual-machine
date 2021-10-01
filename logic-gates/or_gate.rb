# frozen_string_literal: true

require_relative '../electronics/join'

# OR Logic Gate (Parallel Circuit)
class OrGate

  def initialize(phase, alpha, betta, out)
    @alpha_npn_transistor = NPNTransistor.new phase, alpha, Conductor.new
    @betta_npn_transistor = NPNTransistor.new phase, betta, Conductor.new
    @join = Join.new [@alpha_npn_transistor.emitter, @betta_npn_transistor.emitter], [out]
  end

  def debug
    @alpha_npn_transistor.debug
    @betta_npn_transistor.debug
    print self, "\nout:\t", @join.out[0].current, "\n"
  end
end
