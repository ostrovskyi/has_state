# frozen_string_literal: true

module HasState
  module Declarations
    def declare_has_state_reader
      options = class_variable_get(:@@options_provider).options
      class_eval { attr_reader options[:field_name] }
    end
  end
end
