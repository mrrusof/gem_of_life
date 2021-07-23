# frozen_string_literal: true

require 'test_helper'
require 'gem_of_life/application'

module GemOfLife
  class ApplicationTest < Minitest::Test
    # rubocop:disable all
    def test_blinker_in_5_by_5_square_grid
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
      output = StringIO.new
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
      app = Application.new 0
      app.run input, output, steps: 2
      assert_equal expected_output, output.string
    end
    # rubocop:enable all
  end
end
