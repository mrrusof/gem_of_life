# frozen_string_literal: true

require 'test_helper'
require 'gem_of_life/board'

module GemOfLife
  class BoardTest < Minitest::Test
    # rubocop:disable Metrics/MethodLength
    def test_from_square_grid
      grid = [
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0]
      ].map { |row| row.map { |n| n == 1 } }
      expected_neighbors = [
        3, 5, 5, 5, 3,
        5, 8, 8, 8, 5,
        5, 8, 8, 8, 5,
        5, 8, 8, 8, 5,
        3, 5, 5, 5, 3
      ]
      board = GemOfLife::Board.from_square_grid grid, [3], [2, 3]
      cells = board.instance_variable_get(:@cells)
      assert cells.none?(&:alive?)
      assert_equal expected_neighbors, cells.map(&:neighbors).map(&:count)
    end
    # rubocop:enable Metrics/MethodLength

    # rubocop:disable all
    def test_step
      board = build :b3s23_blinker_in_5_by_5_square_board
      cells = board.instance_variable_get(:@cells)
      before = cells.map(&:alive?)

      board.step

      cells = board.instance_variable_get(:@cells)
      assert cells[..10].none?(&:alive?)
      assert cells[11..13].all?(&:alive?)
      assert cells[14..].none?(&:alive?)

      board.step

      cells = board.instance_variable_get(:@cells)
      assert_equal before, cells.map(&:alive?), 'board must be the same as before'
    end
    # rubocop:enable all
  end
end
