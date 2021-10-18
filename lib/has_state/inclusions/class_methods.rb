# frozen_string_literal: true

require 'logger'

require_relative '../config_overrides'
require_relative '../input_mapper'
require_relative '../options_provider'

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
