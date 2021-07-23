# frozen_string_literal: true

require 'strscan'

module GemOfLife
  class InitialStateParser
    def parse_square_grid stream
      input = stream.read.split.map(&:to_i).enum_for
      born_values_count = input.next
      born_values = (1..born_values_count).map { |_| input.next }
      survival_values_count = input.next
      survival_values = (1..survival_values_count).map { |_| input.next }
      rows = input.next
      cols = input.next
      grid = (1..rows).map { |_| (1..cols).map { |_| input.next == 1 } }
      [born_values, survival_values, rows, cols, grid]
    end
  end
end
