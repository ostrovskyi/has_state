# frozen_string_literal: true

require_relative 'has_state/inclusions/class_methods'
require_relative 'has_state/inclusions/base'

module HasState
  include Inclusions::Base
  include Inclusions::ClassMethods
end
