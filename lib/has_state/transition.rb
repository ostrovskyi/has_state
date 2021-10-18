# frozen_string_literal: true

module HasState
  class Transition
    attr_reader :instance_method

    def initialize(name:, body:, method: true)
      @name = name
      @body = body
      @instance_method = method

      raise ArgumentError unless @body
    end
  end
end
