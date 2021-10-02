# frozen_string_literal: true

# Replicate
class Replicate
  def initialize(alpha, bus_z)
    @alpha = alpha
    @bus_z = bus_z

    @join = Join.new [alpha], bus_z.data
  end
end
