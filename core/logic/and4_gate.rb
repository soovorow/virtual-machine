# frozen_string_literal: true

# AND Logic Gate (Serial Circuit)
class And4Gate
  def initialize(phase, a, b, c, d, out)
    t1 = Conductor.new
    And3Gate.new phase, a, b, c, t1
    AndGate.new phase, t1, d, out
  end
end
