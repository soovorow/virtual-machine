# frozen_string_literal: true

# Flip Flop
class FDCE
  def initialize(phase, clear, clock_enabled, data, clock, quit, default_state = 0, name = '')
    @phase = phase
    @clear = clear
    @clock_enabled = clock_enabled
    @data = data
    @clock = clock
    @quit = quit
    @name = name

    @state = Conductor.new
    @state.current = default_state

    @clock.listener.push method(:update)
  end

  def update
    @quit.current = @state.current
    if @clock.current == 1
      @state.current = @data.current
      if @quit.current == 1 && @clock.current == 1
        print "State: \t", @name, "\n"
      end
    end

    # debug
  end

  def debug
    print self, "\n"
    # print "Clk E:\t",@clock_enabled.current, "\t", @clock_enabled, "\n"
    # print "Clear:\t",@clear.current, "\t", @clear, "\n"
    # print "Clock:\t",@clock.current, "\t", @clock, "\n"
    print "Data:\t",@data.current, "\t", @data, "\n"
    print "State:\t",@state.current, "\t", @state, "\n"
    print "Quit:\t",@quit.current, "\t", @quit, "\n"
  end

end
