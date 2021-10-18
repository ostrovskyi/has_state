# frozen_string_literal: true

require_relative 'transition'

module HasState
  class Configurator
    class << self
      def call(base, args, block)
        new(input: args, base: base, block: block).call
      end
    end

    def initialize(input:, base:, block:)
      @input = input
      @base = base
      @block = block
    end

    def call
      evaluate
    end

    private

    attr_reader :base, :block, :input

    def evaluate
      config_overrides_params = HasState::InputMapper.new(input).output
      config_overrides = HasState::ConfigOverrides.new(config_overrides_params)

      base.class_variable_set(:@@options_provider, HasState::OptionsProvider.new(config_overrides))
      base.class_variable_set(:@@has_state_transitions, [])
      base.class_eval do
        declare_has_state_reader
        assign_has_state_field
      end

      instance_eval(&block) if block
    end

    def append_transition(object)
      transitions = base.class_variable_get(:@@has_state_transitions)
      transitions.push(object)
    end

    def transition(*args, &block)
      append_transition Transition.new(
        body: block,
        name: args[0],
        method: true
      )
    end
  end
end
