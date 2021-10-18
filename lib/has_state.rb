# frozen_string_literal: true

require_relative 'has_state/assign_initial_value'
require_relative 'has_state/configurator'
require_relative 'has_state/declarations'

module HasState
  def self.extended(base)
    base.extend Declarations
    base.include AssignInitialValue
  end

  private

  def has_state(*args, &block)
    HasState::Configurator.call(self, args, block)
  end
end
