# frozen_string_literal: true

require 'logger'

module HasState
  module Inclusions
    module ClassMethods
      # rubocop:disable Naming/PredicateName
      def has_state(*args)
        logger = Logger.new($stdout)
        logger.debug('HasState::Inclusions::ClassMethods.has_state(*args)')
        logger.debug(*args)
      end
      # rubocop:enable Naming/PredicateName
    end
  end
end
