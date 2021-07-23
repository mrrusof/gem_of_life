# frozen_string_literal: true

require 'delegate'

module GemOfLife
  class SquareBoardPresenter < SimpleDelegator
    def initialize output_stream, rows, cols, board
      super board
      @output_stream = output_stream
      @rows = rows
      @cols = cols
      @board = board
    end

    def draw
      cells = @board.instance_variable_get(:@cells)
      (0...@rows).each do |row|
        (0...@cols).each do |col|
          value = cells[row * @cols + col].alive? ? '1' : '0'
          @output_stream.print value
          @output_stream.print ' '
        end
        @output_stream.puts
      end
    end
  end
end
