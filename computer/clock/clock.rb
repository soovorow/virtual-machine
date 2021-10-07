# frozen_string_literal: true

# Clock generator circuit
class Clock
  attr_reader :signal, :enabled
  attr_accessor :debug

  def initialize(phase, zero, hz)
    @enabled = phase.current
    @signal = Conductor.new
    @hz = hz
  end

  def start
    print 'Clock rate is: ', @hz, ' hz', "\n"if debug
    Thread.new do
      while @enabled
        @signal.current = @signal.current == 1 ? 0 : 1
        tick
        sleep(1.0 / @hz)
      end
    end
  end

  def stop
    @enabled = 0
  end

  def tick
    print 'Clock Signal: ', @signal.current, "\n" if debug
  end

end
