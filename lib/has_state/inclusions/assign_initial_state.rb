# frozen_string_literal: true

module HasState
  module Inclusions
    module AssignInitialState
      private

      def assign_initial_state
        options = self.class.class_variable_get(:@@options_provider).options
        field_name = options[:field_name]
        default_value = options[:default_value]
        self.class.class_eval { attr_reader field_name }
        instance_variable_set("@#{field_name}".to_sym, default_value) unless send(field_name)
      end
    end
  end
end
