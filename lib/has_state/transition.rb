# frozen_string_literal: true

module HasState
  class Transition
    attr_reader :name, :from, :to, :body, :instance_method

    def initialize(to:, body:, name: nil, from: nil, method: true)
      @name = name
      @from = from
      @to = to
      @body = body
      @instance_method = method

      raise ArgumentError unless @body && @from
    end

    def from_any?
      raise(NotImplementedError)
    end
  end
end
