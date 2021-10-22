# frozen_string_literal: true

module HasState
  module Transitions
    def transition_to(next_val)
      match = self.class.class_variable_get(:@@has_state_transitions).select { |tr| tr.to == next_val }
      transition = match.first if match.length == 1
      transition ? has_state_perform_transition(transition) : raise(StandardError)
    end

    private

    def has_state_perform_transition(object)
      object.body.call
    end
  end
end
