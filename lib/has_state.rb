# frozen_string_literal: true

require_relative 'has_state/assign_initial_value'
require_relative 'has_state/configurator'
require_relative 'has_state/declarations'
require_relative 'has_state/inclusions/class_methods'

module HasState
  def self.included(base)
    base.extend Declarations
    base.extend Inclusions::ClassMethods

    base.include AssignInitialValue
  end
end
