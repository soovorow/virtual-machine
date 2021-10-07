# frozen_string_literal: true

# Flip Flop
class FDCE
  def initialize(phase, clear, clock_enabled, data, clock, quit)
    @phase = phase
    @clear = clear
    @clock_enabled = clock_enabled
    @data = data
    @clock = clock
    @quit = quit

    @clear.listener.push method(:update)
    @clock_enabled.listener.push method(:update)
    @clock.listener.push method(:update)
  end

  def update
    if @clear.current == 1
      @quit.current = 0
    end
    if @clear.current == 0 && @clock_enabled.current == 1 && @data.current == 1 && @clock.current == 1
      @quit.current = 1
    end
  end

end
