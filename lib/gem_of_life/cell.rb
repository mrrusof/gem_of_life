# frozen_string_literal: true

module GemOfLife
  class Cell
    attr_accessor :neighbors
    attr_writer :alive

    def initialize alive, neighbors, born_values, survive_values
      @alive = alive
      @next_state = alive
      @neighbors = neighbors
      @born_values = born_values
      @survive_values = survive_values
    end

    def alive?
      @alive
    end

    def next_state
      alive_neighbors_count = @neighbors.select(&:alive?).count
      @next_state = @alive && @survive_values.include?(alive_neighbors_count) ||
                    !@alive && @born_values.include?(alive_neighbors_count)
    end

    def commit_next_state
      @alive = @next_state
    end

    def inspect
      @alive
    end
  end
end
