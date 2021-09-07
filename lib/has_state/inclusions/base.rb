# frozen_string_literal: true

require_relative 'assign_initial_state'

module HasState
  module Inclusions
    module Base
      include AssignInitialState
    end
  end
end
