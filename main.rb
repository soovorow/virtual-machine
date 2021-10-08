
require_relative 'machine'
require_relative 'core/memory/fdce'
require_relative 'core/logic/inv_gate'
require_relative 'core/electronics/join'
require_relative 'computer/cpu/decoder/sequence_generator'


machine = Machine.new 2
clock_thread = machine.turn :on

print "Is still works? \n"

clear = Conductor.new
fetch = Conductor.new
decode = Conductor.new
execute = Conductor.new

SequenceGenerator.new machine.power.phase, clear, machine.clock.enabled, machine.clock.signal,
                      fetch, decode, execute


clock_thread.join

