# frozen_string_literal: true

require_relative 'config_overrides'
require_relative 'input_mapper'
require_relative 'options_provider'
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
      base.class_eval { declare_has_state_reader }
      extend_constructor

      instance_eval(&block) if block
    end

    def extend_constructor
      original_constructor = base.instance_method(:initialize)
      base.define_method(:initialize) do |*initialize_args, &initialize_block|
        original_constructor.bind(self).call(*initialize_args, &initialize_block)
        has_state_assign_initial_value
      end
    end

    def append_transition(object)
      base.class_variable_get(:@@has_state_transitions).push(object)
    end

    def transition(*args, &block)
      append_transition(Transition.new(body: block, name: args[0], method: true))
    end
  end
end
