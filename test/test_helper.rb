# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'gem_of_life'

require 'minitest/autorun'
require 'factory_bot'

FactoryBot.find_definitions

module Minitest
  class Test
    include FactoryBot::Syntax::Methods
  end
end
