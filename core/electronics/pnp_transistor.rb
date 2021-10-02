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
    update
  end

  def debug
    print self, "\n"
    print "in: \t", @emitter.current, "\t", @emitter, "\n"
    print "sw: \t", @base.current, "\t", @base, "\n"
    print "out: \t", @collector.current, "\t", @collector, "\n"
  end

  private

  def update
    should_emit = @emitter.on? && @base.off?
    @collector.current = should_emit ? :on : :off
  end
end
