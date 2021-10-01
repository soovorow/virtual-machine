# frozen_string_literal: true

# PNP Transistor (Inverted / Negative), From Emitter to Collector
class PNPTransistor
  attr_accessor :base, :collector, :emitter

  def initialize(emitter, base, collector)
    @emitter = emitter
    @base = base
    @collector = collector

    @emitter.listener.push method(:update)
    @base.listener.push method(:update)
  end

  def debug
    print self, "\n"
    print "in: \t", @emitter.current, "\n"
    print "sw: \t", @base.current, "\n"
    print "out: \t", @collector.current, "\n"
    print "\n"
  end

  private

  def update
    should_emit = @emitter.on? && @base.off?
    @collector.current = should_emit ? :on : :off
  end
end
