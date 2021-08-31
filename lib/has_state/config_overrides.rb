# frozen_string_literal: true

module HasState
  class ConfigOverrides
    DEFAULT_KEYS = %i[default_value].freeze

    attr_reader(*DEFAULT_KEYS)

    def initialize(initial_values = {})
      raise ArgumentError unless initial_values.is_a?(Hash)

      initial_values.each { |k, v| append(k, v) }
    end

    def append(override_key, override_value)
      raise ArgumentError unless existing_option?(override_key)

      variable_name = "@#{override_key}"
      instance_variable_set(variable_name.to_sym, override_value)
    end

    def to_hash
      DEFAULT_KEYS.inject({}) do |result, override_key|
        if public_send(override_key).nil?
          result
        else
          result.merge(override_key => public_send(override_key))
        end
      end
    end

    private

    attr_writer(*DEFAULT_KEYS)

    def existing_option?(config_key)
      respond_to?(config_key)
    end
  end
end
