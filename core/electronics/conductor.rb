# frozen_string_literal: true

# Conductor is responsible to pass current from one to the other side
class Conductor
  attr_reader :current
  attr_accessor :listener

  def initialize(debug = false, msg = false)
    @current = 0
    @listener = []
    @debug = debug
    @msg = msg
  end

  # @param [Boolean] voltage
  def current=(voltage)
    @current = ([:on, 1].include?(voltage) ? 1 : 0)
    @listener.each(&:call)
    if @debug != false
      print @msg, "\n"
    end
  end

  def on?
    current == 1
  end

  def off?
    current == 0
  end
end
