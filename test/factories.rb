# frozen_string_literal: true

require 'gem_of_life/board'
require 'gem_of_life/cell'

FactoryBot.define do
  factory :cell, class: GemOfLife::Cell do
    initialize_with { new alive, neighbors, born_values, survive_values }

    alive { true }
    neighbors { [] }

    factory :b3s23_cell do
      born_values { [3] }
      survive_values { [2, 3] }
    end
  end

  factory :b3s23_blinker_in_5_by_5_square_board, class: GemOfLife::Board do
    initialize_with do
      grid = [
        [0, 0, 0, 0, 0],
        [0, 0, 1, 0, 0],
        [0, 0, 1, 0, 0],
        [0, 0, 1, 0, 0],
        [0, 0, 0, 0, 0]
      ].map { |row| row.map { |n| n == 1 } }
      GemOfLife::Board.from_square_grid grid, [3], [2, 3]
    end
  end
end
