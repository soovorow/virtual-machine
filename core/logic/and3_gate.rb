# frozen_string_literal: true

# AND Logic Gate (Serial Circuit)
class And3Gate
  def initialize(phase, a, b, c, out)
    t1 = Conductor
    AndGate.new phase, a, b, t1
    AndGate.new phase, t1, c, out
  end
end
