# frozen_string_literal: true

require_relative '../electronics/pnp_transistor'

# Inv Gate
class InvGate
  def initialize(phase, alpha, out)
    @pnp_transistor = PNPTransistor.new phase, alpha, out
  end
end
