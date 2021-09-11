# frozen_string_literal: true

module HasState
  module Declarations
    def declare_has_state_reader
      options = class_variable_get(:@@options_provider).options
      class_eval { attr_reader options[:field_name] }
    end

    def assign_has_state_field
      original_constructor = instance_method(:initialize)
      define_method(:initialize) do |*initialize_args, &initialize_block|
        original_constructor.bind(self).call(*initialize_args, &initialize_block)
        has_state_assign_initial_value
      end
    end
  end
end
