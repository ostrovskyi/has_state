require 'logger'

module HasState
    module Inclusions
        module ClassMethods
            def has_state(*args)
                logger = Logger.new(STDOUT)
                logger.debug('HasState::Inclusions::ClassMethods.has_state(*args)')
                logger.debug(*args)
            end
        end
    end
end