# frozen_string_literal: true

require 'test_helper'
require 'gem_of_life/square_board_presenter'

module GemOfLife
  class SquareBoardPresenterTest < Minitest::Test
    # rubocop:disable Metrics/MethodLength
    def test_draw
      output_stream = StringIO.new
      board = build :b3s23_blinker_in_5_by_5_square_board
      decorated_board = SquareBoardPresenter.new output_stream, 5, 5, board
      expected_output = <<~EOS
        0 0 0 0 0 
        0 0 0 0 0 
        0 1 1 1 0 
        0 0 0 0 0 
        0 0 0 0 0 

        0 0 0 0 0 
        0 0 1 0 0 
        0 0 1 0 0 
        0 0 1 0 0 
        0 0 0 0 0 
      EOS
      decorated_board.step
      decorated_board.draw
      output_stream.puts
      decorated_board.step
      decorated_board.draw
      assert_equal expected_output, output_stream.string
    end
    # rubocop:enable Metrics/MethodLength
  end
end
