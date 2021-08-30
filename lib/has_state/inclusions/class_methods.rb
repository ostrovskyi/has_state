# frozen_string_literal: true

require 'logger'

module HasState
  module Inclusions
    module ClassMethods
      def has_state(*args, &block)
        puts(args)

        original_method = instance_method(:initialize)
        define_method(:initialize) do |*initialize_args, &initialize_block|
          original_method.bind(self).call(*initialize_args, &initialize_block)
          assign_initial_state
        end

        yield if block
      end
    end
  end
end
