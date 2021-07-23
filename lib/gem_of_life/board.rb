# frozen_string_literal: true

require 'gem_of_life/cell'

module GemOfLife
  class Board
    def initialize cells
      @cells = cells
    end

    # rubocop:disable all
    def self.from_square_grid grid, born_values, survive_values
      cells = grid.map { |row| row.map { |state| Cell.new state, [], born_values, survive_values } }
      rows = cells.count
      cols = (cells.first || []).count
      cells.each_with_index do |row, ri|
        row.each_with_index do |cell, ci|
          cell.neighbors = []
          cell.neighbors << cells[ri - 1][ci - 1] if ri - 1 >= 0 && ci - 1 >= 0
          cell.neighbors << cells[ri - 1][ci]     if ri - 1 >= 0
          cell.neighbors << cells[ri - 1][ci + 1] if ri - 1 >= 0 && ci + 1 < cols

          cell.neighbors << cells[ri + 1][ci - 1] if ri + 1 < rows && ci - 1 >= 0
          cell.neighbors << cells[ri + 1][ci]     if ri + 1 < rows
          cell.neighbors << cells[ri + 1][ci + 1] if ri + 1 < rows && ci + 1 < cols

          cell.neighbors << cells[ri][ci - 1]     if ci - 1 >= 0
          cell.neighbors << cells[ri][ci + 1]     if ci + 1 < cols
        end
      end
      new cells.flatten
    end
    # rubocop:enable all

    def step
      @cells.each(&:next_state)
      @cells.each(&:commit_next_state)
    end
  end
end
