# frozen_string_literal: true

require 'test_helper'
require 'gem_of_life/initial_state_parser'

module GemOfLife
  class InitialStateParserTest < Minitest::Test
    # rubocop:disable Metrics/MethodLength
    def test_parse_square_grid
      input = StringIO.new <<~EOS
        1 3
        2 2 3
        5 5
        0 0 0 0 0
        0 0 0 0 0
        0 1 1 1 0
        0 0 0 0 0
        0 0 0 0 0
      EOS
      expected = [
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 1, 1, 1, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0]
      ].map { |row| row.map { |n| n == 1 } }
      parser = InitialStateParser.new
      born_values, survive_values, rows, cols, actual = parser.parse_square_grid input
      assert_equal [3], born_values
      assert_equal [2, 3], survive_values
      assert_equal 5, rows
      assert_equal 5, cols
      assert_equal expected, actual
    end
    # rubocop:enable Metrics/MethodLength
  end
end
