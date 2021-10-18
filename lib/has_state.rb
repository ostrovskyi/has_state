# frozen_string_literal: true

require_relative 'has_state/config_overrides'
require_relative 'has_state/configurator'
require_relative 'has_state/declarations'
require_relative 'has_state/inclusions/base'
require_relative 'has_state/inclusions/class_methods'
require_relative 'has_state/input_mapper'
require_relative 'has_state/options_provider'

module HasState
  include Inclusions::Base

  def self.included(base)
    base.extend Declarations
    base.extend Inclusions::ClassMethods
  end
end
