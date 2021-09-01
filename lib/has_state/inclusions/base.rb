# frozen_string_literal: true

module HasState
  module Inclusions
    module Base
      attr_accessor :state

      private

      def assign_initial_state
        @state = self.class.class_variable_get(:@@options_provider).options[:default_value] unless state
      end
    end
  end
end
