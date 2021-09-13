# frozen_string_literal: true

module HasState
  module Inclusions
    module AssignInitialState
      private

      def has_state_assign_initial_value
        options = self.class.class_variable_get(:@@options_provider).options
        field_name = options[:field_name]
        instance_variable_set("@#{field_name}", has_state_initial_value)
      end

      def has_state_initial_value
        options = self.class.class_variable_get(:@@options_provider).options
        field_name = options[:field_name]
        default_value = options[:default_value]
        current_value = send(field_name)

        current_value || default_value
      end
    end
  end
end
