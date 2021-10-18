# frozen_string_literal: true

module HasState
  module Inclusions
    module ClassMethods
      private

      def has_state(*args, &block)
        HasState::Configurator.call(self, args, block)
      end
    end
  end
end
