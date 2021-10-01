# frozen_string_literal: true

# NPN Transistor (Not Negative), From Collector to Emitter
class NPNTransistor
  attr_accessor :base, :collector, :emitter

  def initialize(collector, base, emitter)
    @collector = collector
    @base = base
    @emitter = emitter

    @collector.listener.push method(:update)
    @base.listener.push method(:update)
  end

  def debug
    print self, "\n"
    print "in: \t", @collector.current, "\n"
    print "sw: \t", @base.current, "\n"
    print "out: \t", @emitter.current, "\n"
    print "\n"
  end

  private

  def update
    should_emit = @collector.on? && @base.on?
    @emitter.current = should_emit ? :on : :off
  end
end
