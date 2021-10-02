# frozen_string_literal: true

# XOR Logic Gate
class XorGate
  def initialize(phase, alpha, betta, out)
    @alfa = alpha
    @betta = betta
    @out = out
    @alpha_npn_transistor = NPNTransistor.new phase, @alfa, Conductor.new
    @betta_npn_transistor = NPNTransistor.new phase, @betta, Conductor.new
    @alpha_pnp_transistor = PNPTransistor.new @alpha_npn_transistor.emitter, @betta_npn_transistor.emitter, Conductor.new
    @betta_pnp_transistor = PNPTransistor.new @betta_npn_transistor.emitter, @alpha_pnp_transistor.emitter, Conductor.new
    @join = Join.new [@alpha_pnp_transistor.collector, @betta_pnp_transistor.collector], [@out]
  end

  def debug
    print self, "\n"
    print "a:\t\t", @alfa.current, "\t", @alfa, "\n"
    print "b:\t\t", @betta.current, "\t", @betta, "\n"
    print "xor:\t", @out.current, "\t", @out, "\n"
    @alpha_npn_transistor.debug
    @betta_npn_transistor.debug
    @alpha_pnp_transistor.debug
    @betta_pnp_transistor.debug
    @join.debug
  end
end
