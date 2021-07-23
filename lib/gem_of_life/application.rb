# frozen_string_literal: true

require 'gem_of_life/initial_state_parser'
require 'gem_of_life/board'
require 'gem_of_life/square_board_presenter'

module GemOfLife
  class Application
    def initialize wait_secs
      @wait_secs = wait_secs
    end

    def run input_stream, output_stream, steps: nil
      parser = InitialStateParser.new
      born_values, survive_values, rows, cols, grid = parser.parse_square_grid input_stream
      board = Board.from_square_grid grid, born_values, survive_values
      pretty_board = SquareBoardPresenter.new output_stream, rows, cols, board
      while steps.nil? || (steps -= 1) >= 0
        pretty_board.draw
        pretty_board.step
        output_stream.puts
        sleep @wait_secs
      end
    end
  end
end
