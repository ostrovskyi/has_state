# frozen_string_literal: true

module HasState
  class InputMapper
    def initialize(input)
      if input.is_a?(Array)
        if input[0].is_a?(Hash)
          @input = input[0]
        else
          @field_name = input[0]
          @input = input[1] || {}
        end
      else
        @input = input
      end
    end

    def output
      @output ||= generate_output
    end

    private

    def generate_output
      result = {}
      result[:default_value] = input(:default).to_sym if input(:default)
      result[:field_name] = input(:field).to_sym if input(:field)
      result
    end

    def input(key)
      @input[key]
    end

    attr_reader :input_config
  end
end
