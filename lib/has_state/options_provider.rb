# frozen_string_literal: true

require_relative 'config_overrides'

module HasState
  class OptionsProvider
    DEFAULT_OPTIONS = {
      default_value: :initial
    }.freeze

    def initialize(config_overrides_object)
      raise(ArgumentError) unless config_overrides_object.is_a?(ConfigOverrides)

      @config_overrides_object = config_overrides_object
    end

    def options
      DEFAULT_OPTIONS.merge(@config_overrides_object)
    end
  end
end
