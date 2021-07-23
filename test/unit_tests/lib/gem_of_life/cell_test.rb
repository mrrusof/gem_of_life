# frozen_string_literal: true

require 'test_helper'
require 'gem_of_life/cell'

module GemOfLife
  class CellTest < Minitest::Test
    def make_b3s23 alive, neighbors
      build :b3s23_cell, alive: alive, neighbors: neighbors
    end

    def test_next_state_when_cell_dies_because_there_are_no_neighbors
      cell = make_b3s23 true, []
      refute cell.next_state
      assert cell.alive?, 'current state must remain the same'
    end

    def test_next_state_when_cell_dies_because_there_are_too_many_neighbors
      cell = make_b3s23 true, (1..4).map { |_| make_b3s23 true, [] }
      refute cell.next_state
      assert cell.alive?, 'current state must remain the same'
    end

    def test_next_state_when_cell_remains_dead
      neighbors = (1..2).map { |_| make_b3s23 true, [] }
      cell = make_b3s23 false, neighbors
      refute cell.next_state
      refute cell.alive?, 'current state must remain the same'
    end

    def test_next_state_when_cell_is_born
      neighbors = (1..3).map { |_| make_b3s23 true, [] }
      cell = make_b3s23 false, neighbors
      assert cell.next_state
      refute cell.alive?, 'current state must remain the same'
    end

    def test_next_state_when_cell_survives
      neighbors = (1..3).map { |_| make_b3s23 true, [] }
      cell = make_b3s23 true, neighbors
      assert cell.next_state
      assert cell.alive?, 'current state must remain the same'
    end

    def test_commit_next_state_when_cell_is_born
      neighbors = (1..3).map { |_| make_b3s23 true, [] }
      cell = make_b3s23 false, neighbors
      assert cell.next_state
      refute cell.alive?, 'current state must remain the same'
      cell.commit_next_state
      assert cell.alive?, 'next state must have been commited'
    end
  end
end
