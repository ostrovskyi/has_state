# frozen_string_literal: true

module HasState
  module Inclusions
    module Base
      attr_accessor :state

      private

      def assign_initial_state
        @state = 'initial' unless state
      end
    end
  end
end
