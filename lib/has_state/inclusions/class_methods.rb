# frozen_string_literal: true

require 'logger'

require_relative '../config_overrides'
require_relative '../input_mapper'
require_relative '../options_provider'

module HasState
  module Inclusions
    module ClassMethods
      def has_state(*args, &block)
        config_overrides_params = HasState::InputMapper.new(args).output
        config_overrides = HasState::ConfigOverrides.new(config_overrides_params)
        class_variable_set(:@@options_provider, HasState::OptionsProvider.new(config_overrides))

        declare_has_state_reader
        assign_has_state_field

        yield if block
      end
    end
  end
end
